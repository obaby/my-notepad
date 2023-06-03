unit PlugInUnit;
/////////////////////////////////////////////////////////////////////////////////////////////////
//  DeDe PlugIn Library Example, by DaFixer
//
//  This File is a part of DeDePlugIn SDK v.1.1
/////////////////////////////////////////////////////////////////////////////////////////////////

interface

uses DeDe_SDK;

/////////////////////////////////////////////////////////////////////////////////////////////////
//   The set of functions that every plugin should export
//   Their names and prototypes are defined in DeDe_SDK
/////////////////////////////////////////////////////////////////////////////////////////////////
function InitPlugIn(DeDe_FunctionsList : TFunctionPointerListArray) : Boolean; export;
procedure StartPlugIn(Index : Integer; InData : TListGenIN ; var OutData : TListGenOut); export;
procedure GetPlugInfo(var PlugInfo : Array of TPlugInfoRec); export;
function GetPlugCount : Integer; export;
function GetPlugVer(Index : Integer): String; export;


/////////////////////////////////////////////////////////////////////////////////////////////////
//   The function that DeDe gives to our plugin. We will receive pointers to them
// in InitPlugIn proc.
////////////////////////////////////////////////////////////////////////////////////////////////
var
  GetByte : TGetByteProc;// function (dwVirtOffset : DWORD) : Byte;
  GetWord : TGetWordProc;// function (dwVirtOffset : DWORD) : Word;
  GetDWORD: TGetDWORDProc;// function (dwVirtOffset : DWORD) : DWORD;
  GetPascalString : TGetPascalStringProc;// function (dwVirtOffset : DWORD) : String;
  GetBinaryData : TGetBinaryDataProc;// procedure (var buffer : Array of Byte; size : Integer; dwVirtOffset : DWORD);
  Disassemble : TDisassembleProc;// function (dwVirtOffset : DWORD) : TDasmData;
  GetCallReference : TGetCallReferenceProc;// function (dwVirtOffset : DWORD; var sReference : String; var btRefType : Byte; btMode : Byte = 0) : Boolean;
  GetObjectName : TGetObjectNameProc;// function (dwVirtOffset : DWORD; var sObjName : String) : Boolean;
  GetFieldReference : TGetFieldReferenceProc;// function (dwVirtOffset : DWORD; var sReference : String) : Boolean;

implementation

uses Windows, SysUtils;

////////////////////////////////////////////////////////////////////////////////
//   Data for the exported plugins
////////////////////////////////////////////////////////////////////////////////
const Plug_Count = 2;

const PlugIns : Array [1..Plug_Count] of TPlugInfoRec =
      ((PlugName    : 'Simple Disassembler' ;
        PlugVersion : '1.0';
        PlugType    : ptDisassembler or ptFixRelativeOffsets
        ),
       (PlugName    : 'Data Reader';
        PlugVersion : '1.0';
        PlugType    : ptDisassembler or ptOwnerShow
       )
      );


/////////////////////////////////////////////////////////////////////////////////////
//   Our implementation of InitPlugIn. I dont see any reason to implement it
// in different way so use it as implemented below
/////////////////////////////////////////////////////////////////////////////////////
function InitPlugIn(DeDe_FunctionsList : TFunctionPointerListArray) : Boolean; export;
begin
  GetByte:=DeDe_FunctionsList[nGetByte];
  GetWord:=DeDe_FunctionsList[nGetWord];
  GetDWord:=DeDe_FunctionsList[nGetDWord];
  GetPascalString:=DeDe_FunctionsList[nGetPascalString];
  GetBinaryData:=DeDe_FunctionsList[nGetBinaryData];
  Disassemble:=DeDe_FunctionsList[nDisassemble];
  GetCallReference:=DeDe_FunctionsList[nGetCallReference];
  GetObjectName:=DeDe_FunctionsList[nGetObjectName];
  GetFieldReference:=DeDe_FunctionsList[nGetFieldReference];
  Result:=True;
end;

procedure RunPlugin_1(InData : TListGenIN ; var OutData : TListGenOut); forward;
procedure RunPlugin_2(InData : TListGenIN ; var OutData : TListGenOut); forward;

///////////////////////////////////////////////////////////////////////////////////////////////
//   Our Implementation of StartPlugIn. Plugins are enumerated in the order passed by
// GetPlugInfo() using 1-based order. The OutData.Listing TStringList instance is created
// by DeDe when StartPlugIn is called. It should *not* be freed by our plugin.
///////////////////////////////////////////////////////////////////////////////////////////////
procedure StartPlugIn(Index : Integer; InData : TListGenIN ; var OutData : TListGenOut); export;
begin
 Case Index Of
  1: RunPlugin_1(InData, OutData);
  2: RunPlugin_2(InData, OutData);
 End;
end;

////////////////////////////////////////////////////////////////////////////////////////////////
//   Returns the exported plugins count
////////////////////////////////////////////////////////////////////////////////////////////////
function GetPlugCount : Integer; export;
begin
  Result:=Plug_Count;
end;

////////////////////////////////////////////////////////////////////////////////////////////////
//   Returns the exported plugins info. Note that the dinamic array PlugInfo is
// always 0-based while the internal enumeration used in StartPlugIn is 1-based.
// DeDe calls this procedure after calling GetPlugCount and setting the length of
// the PlugInfo accordingly. As it could be expected accessing PlugInfo[Plug_Count]
// in the body of this procedure will cause access violation.
////////////////////////////////////////////////////////////////////////////////////////////////
procedure GetPlugInfo(var PlugInfo : Array of TPlugInfoRec); export;
begin
  PlugInfo[0]:=PlugIns[1];
  PlugInfo[1]:=PlugIns[2];
end;

////////////////////////////////////////////////////////////////////////////////////////////////
//  Returns the version of the specified 1-base indixated exported plugin
////////////////////////////////////////////////////////////////////////////////////////////////
function GetPlugVer(Index : Integer): String; export;
begin
  If Index>Plug_Count then exit;
  Result:=PlugIns[Index].PlugVersion;
end;


////////////////////////////////////////////////////////////////////////////////////////////////
//   Our 1-st plugin is a simple disassembler that calls Disassemble(). Important is that
// the plugin itself has to determine when to stop disassembling! It is usefull to know
// that the delphi compiler uses as separator between the procedures the following sequences:
//
// 1 byte  : 90       'nop'
// 2 bytes : 8BC0     'mov eax, eax'
// 3 bytes : 8D4000   'lea eax, [eax+00]'
//
//   I added check for 'add     [eax], al' because after the end of the project code
// in .dpr file follows zero bytes till the end of the section and there is no 'ret'.
// If this check does not exists running our plugin at the dpr procedure might result
// errors.
////////////////////////////////////////////////////////////////////////////////////////////////
Procedure RunPlugIn_1;
var s : String;
    sInstr : String;
    size : Integer;
    dw : DWORD;
begin
  dw:=InData.dwStartAddress;
  if OutData.Listing=nil then Raise Exception.Create('OutData.Listing not initialized');
  if OutData.GlobalVars=nil then Raise Exception.Create('OutData.GlobalVars not initialized');
  OutData.Listing.Clear;

  Repeat
    Disassemble(dw,sInstr,size);
    Inc(dw,size);
    s:=sInstr;
    OutData.Listing.Add(s);
  Until (s='ret') or (s='add     [eax], al');
end;

/////////////////////////////////////////////////////////////////////////////////////////////////
//   Our second plugin, that has ptOwnerShow flag set, reads and shows some data
/////////////////////////////////////////////////////////////////////////////////////////////////
Procedure RunPlugIn_2;
var b  : Byte;
    w  : Word;
    dw : DWORD;
    s  : String;
begin
  b:=GetByte($401000);
  MessageBox(0,PChar('The byte at $401000 is: '+IntToHex(b,2)),PChar('Test PlugIn 2'),0);

  w:=GetWord($401000);
  MessageBox(0,PChar('The word at $401000 is: '+IntToHex(w,4)),PChar('Test PlugIn 2'),0);

  dw:=GetDWord($401000);
  MessageBox(0,PChar('The dword at $401000 is: '+IntToHex(dw,8)),PChar('Test PlugIn 2'),0);

  s:=GetPascalString($401005);
  MessageBox(0,PChar('The string at $401000 is: '+s),PChar('Test PlugIn 2'),0);
end;


end.
