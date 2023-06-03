unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinData, DynamicSkinForm, SkinCtrls, Menus, SkinHint, SkinMenus,
  spTrayIcon, ExtCtrls, ComCtrls, SkinTabs, StdCtrls, SkinBoxCtrls, ImgList,
  StdActns, ExtActns, ActnList, spDialogs, spColorCtrls, spSkinShellCtrls,
  spMessages, IdBaseComponent, IdCoder, IdCoder3to4, IdCoderBinHex4,ShellAPI,
  jpeg,IniFiles, SkinExCtrls, Mask,Math, sppngimagelist, System.Actions,
  System.ImageList, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinFrame1: TspSkinFrame;
    spSkinData1: TspSkinData;
    spCompressedStoredSkin1: TspCompressedStoredSkin;
    spCompressedSkinList1: TspCompressedSkinList;
    spResourceStrData1: TspResourceStrData;
    MainMenu1: TMainMenu;
    spSkinMainMenuBar1: TspSkinMainMenuBar;
    spTrayIcon1: TspTrayIcon;
    spSkinPopupMenu1: TspSkinPopupMenu;
    spSkinHint1: TspSkinHint;
    spSkinToolBar1: TspSkinToolBar;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Print1: TMenuItem;
    Exit1: TMenuItem;
    Font1: TMenuItem;
    N2: TMenuItem;
    B1: TMenuItem;
    U1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Undo1: TMenuItem;
    Past1: TMenuItem;
    N6: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    Aligen1: TMenuItem;
    Left1: TMenuItem;
    Right1: TMenuItem;
    Center1: TMenuItem;
    Option1: TMenuItem;
    S1: TMenuItem;
    B2: TMenuItem;
    I1: TMenuItem;
    M1: TMenuItem;
    D1: TMenuItem;
    N7: TMenuItem;
    P1: TMenuItem;
    C1: TMenuItem;
    T1: TMenuItem;
    N8: TMenuItem;
    H1: TMenuItem;
    B3: TMenuItem;
    T2: TMenuItem;
    New: TspSkinSpeedButton;
    open: TspSkinSpeedButton;
    Save: TspSkinSpeedButton;
    spSkinSpeedButton4: TspSkinSpeedButton;
    spSkinSpeedButton5: TspSkinSpeedButton;
    spSkinSpeedButton6: TspSkinSpeedButton;
    spSkinSpeedButton7: TspSkinSpeedButton;
    spSkinSpeedButton8: TspSkinSpeedButton;
    spSkinSpeedButton9: TspSkinSpeedButton;
    spSkinSpeedButton10: TspSkinSpeedButton;
    spSkinSpeedButton11: TspSkinSpeedButton;
    spSkinSpeedButton12: TspSkinSpeedButton;
    spSkinSpeedButton13: TspSkinSpeedButton;
    spSkinBevel1: TspSkinBevel;
    spSkinBevel2: TspSkinBevel;
    iPage: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTabSheet2: TspSkinTabSheet;
    spSkinTabSheet3: TspSkinTabSheet;
    spSkinRichEdit1: TspSkinRichEdit;
    spSkinScrollBar1: TspSkinScrollBar;
    spSkinScrollBar2: TspSkinScrollBar;
    iMainImageList: TImageList;
    ilMainMenuImageList: TImageList;
    spSkinMessage1: TspSkinMessage;
    spSelectSkinsFromFoldersDialog1: TspSelectSkinsFromFoldersDialog;
    spSkinOpenDialog1: TspSkinOpenDialog;
    spSkinSaveDialog1: TspSkinSaveDialog;
    spSkinOpenPictureDialog1: TspSkinOpenPictureDialog;
    spSkinFontDialog1: TspSkinFontDialog;
    spSkinConfirmDialog1: TspSkinConfirmDialog;
    spSkinColorDialog1: TspSkinColorDialog;
    spSkinTextDialog1: TspSkinTextDialog;
    spSkinFindDialog1: TspSkinFindDialog;
    spSkinReplaceDialog1: TspSkinReplaceDialog;
    spSkinStatusBar2: TspSkinStatusBar;
    spSkinStatusPanel1: TspSkinStatusPanel;
    spSkinStatusPanel2: TspSkinStatusPanel;
    spSkinStatusPanel3: TspSkinStatusPanel;
    IdEncoderBinHex41: TIdEncoderBinHex4;
    actlst1: TActionList;
    RichEditBold1: TRichEditBold;
    RichEditItalic1: TRichEditItalic;
    RichEditUnderline1: TRichEditUnderline;
    RichEditStrikeOut1: TRichEditStrikeOut;
    RichEditBullets1: TRichEditBullets;
    RichEditAlignLeft1: TRichEditAlignLeft;
    RichEditAlignRight1: TRichEditAlignRight;
    RichEditAlignCenter1: TRichEditAlignCenter;
    act1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    SearchFindFirst1: TSearchFindFirst;
    spSkinSpeedButton14: TspSkinSpeedButton;
    spSkinColorDialog2: TspSkinColorDialog;
    FilePrintSetup1: TFilePrintSetup;
    spSkinSpeedButton1: TspSkinSpeedButton;
    CtrlC1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    img1: TImage;
    spSkinMemo1: TspSkinMemo;
    A1: TMenuItem;
    spOpenSkinDialog1: TspOpenSkinDialog;
    tmr1: TTimer;
    spSkinStatusPanel4: TspSkinStatusPanel;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinEdit1: TspSkinEdit;
    spSkinEdit2: TspSkinEdit;
    spSkinEdit3: TspSkinEdit;
    spSkinShadowLabel1: TspSkinShadowLabel;
    spSkinShadowLabel2: TspSkinShadowLabel;
    spSkinEdit4: TspSkinEdit;
    spSkinShadowLabel3: TspSkinShadowLabel;
    spSkinEdit5: TspSkinEdit;
    spSkinShadowLabel4: TspSkinShadowLabel;
    spSkinEdit6: TspSkinEdit;
    spSkinEdit7: TspSkinEdit;
    spSkinShadowLabel5: TspSkinShadowLabel;
    spSkinEdit8: TspSkinEdit;
    spSkinShadowLabel6: TspSkinShadowLabel;
    spSkinEdit9: TspSkinEdit;
    spSkinShadowLabel7: TspSkinShadowLabel;
    spSkinShadowLabel8: TspSkinShadowLabel;
    spSkinEdit13: TspSkinEdit;
    spSkinShadowLabel9: TspSkinShadowLabel;
    spSkinEdit14: TspSkinEdit;
    spSkinShadowLabel10: TspSkinShadowLabel;
    spSkinEdit15: TspSkinEdit;
    spSkinEdit16: TspSkinEdit;
    spSkinShadowLabel11: TspSkinShadowLabel;
    spSkinEdit17: TspSkinEdit;
    spSkinShadowLabel12: TspSkinShadowLabel;
    spSkinEdit18: TspSkinEdit;
    spSkinEdit19: TspSkinEdit;
    spSkinShadowLabel13: TspSkinShadowLabel;
    spSkinShadowLabel14: TspSkinShadowLabel;
    spSkinEdit21: TspSkinEdit;
    NotHex1: TspSkinCheckRadioBox;
    spSkinGroupBox2: TspSkinGroupBox;
    spSkinShadowLabel15: TspSkinShadowLabel;
    spSkinShadowLabel16: TspSkinShadowLabel;
    spSkinShadowLabel17: TspSkinShadowLabel;
    spSkinShadowLabel18: TspSkinShadowLabel;
    spSkinShadowLabel19: TspSkinShadowLabel;
    spSkinShadowLabel20: TspSkinShadowLabel;
    spSkinShadowLabel21: TspSkinShadowLabel;
    spSkinShadowLabel22: TspSkinShadowLabel;
    spSkinShadowLabel23: TspSkinShadowLabel;
    spSkinShadowLabel24: TspSkinShadowLabel;
    spSkinEdit10: TspSkinEdit;
    spSkinEdit11: TspSkinEdit;
    spSkinEdit12: TspSkinEdit;
    spSkinEdit22: TspSkinEdit;
    spSkinEdit23: TspSkinEdit;
    spSkinEdit24: TspSkinEdit;
    spSkinEdit25: TspSkinEdit;
    spSkinEdit26: TspSkinEdit;
    spSkinEdit27: TspSkinEdit;
    spSkinEdit28: TspSkinEdit;
    spSkinEdit29: TspSkinEdit;
    spSkinEdit30: TspSkinEdit;
    spSkinEdit31: TspSkinEdit;
    spSkinEdit32: TspSkinEdit;
    spSkinEdit33: TspSkinEdit;
    NotHex2: TspSkinCheckRadioBox;
    spSkinShadowLabel25: TspSkinShadowLabel;
    spSkinEdit34: TspSkinEdit;
    spSkinEdit35: TspSkinEdit;
    spSkinShadowLabel26: TspSkinShadowLabel;
    spSkinEdit36: TspSkinEdit;
    spSkinGroupBox3: TspSkinGroupBox;
    spSkinShadowLabel27: TspSkinShadowLabel;
    spSkinShadowLabel28: TspSkinShadowLabel;
    spSkinShadowLabel29: TspSkinShadowLabel;
    spSkinShadowLabel30: TspSkinShadowLabel;
    Erjinzhi: TspSkinEdit;
    Bajinzhi: TspSkinEdit;
    Shijinzhi: TspSkinEdit;
    Shiliujinzhi: TspSkinEdit;
    spSkinGroupBox4: TspSkinGroupBox;
    spSkinMemo2: TspSkinMemo;
    spSkinMemo3: TspSkinMemo;
    spSkinShadowLabel31: TspSkinShadowLabel;
    spSkinShadowLabel32: TspSkinShadowLabel;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinButton3: TspSkinButton;
    spSkinButton4: TspSkinButton;
    spSkinShadowLabel33: TspSkinShadowLabel;
    spPngImageList1: TspPngImageList;
    MainMenu: TspPngImageList;
    ilcracklist: TImageList;
    spSkinGroupBox5: TspSkinGroupBox;
    spSkinButton5: TspSkinButton;
    spSkinButton6: TspSkinButton;
    spSkinButton8: TspSkinButton;
    spSkinButton9: TspSkinButton;
    spSkinButton10: TspSkinButton;
    spSkinButton11: TspSkinButton;
    spSkinButton12: TspSkinButton;
    spSkinButton14: TspSkinButton;
    spSkinGroupBox6: TspSkinGroupBox;
    spSkinButton17: TspSkinButton;
    spSkinButton18: TspSkinButton;
    spSkinButton19: TspSkinButton;
    spSkinButton20: TspSkinButton;
    spSkinButton26: TspSkinButton;
    spSkinGroupBox7: TspSkinGroupBox;
    spSkinButton21: TspSkinButton;
    spSkinButton22: TspSkinButton;
    spSkinButton23: TspSkinButton;
    spSkinButton24: TspSkinButton;
    spSkinButton27: TspSkinButton;
    spSkinButton28: TspSkinButton;
    spSkinGroupBox8: TspSkinGroupBox;
    spSkinButton16: TspSkinButton;
    spSkinButton15: TspSkinButton;
    spSkinButton13: TspSkinButton;
    spSkinButton30: TspSkinButton;
    spSkinButton32: TspSkinButton;
    spSkinButton33: TspSkinButton;
    spSkinButton34: TspSkinButton;
    spSkinButton35: TspSkinButton;
    spSkinButton36: TspSkinButton;
    spSkinButton37: TspSkinButton;
    spSkinButton38: TspSkinButton;
    spSkinButton25: TspSkinButton;
    spSkinButton7: TspSkinButton;
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure spSkinRichEdit1SelectionChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure spSkinSpeedButton11Click(Sender: TObject);
    procedure spSkinSpeedButton10Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure spSkinSpeedButton14Click(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure openClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure spSkinSpeedButton1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure spSkinSpeedButton12Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure spSkinRichEdit1Change(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure spSkinButton3Click(Sender: TObject);
    procedure spSkinButton4Click(Sender: TObject);
    procedure spSkinEdit3Change(Sender: TObject);
    procedure spSkinEdit5Change(Sender: TObject);
    procedure spSkinEdit8Change(Sender: TObject);
    procedure spSkinEdit14Change(Sender: TObject);
    procedure spSkinEdit17Change(Sender: TObject);
    procedure spSkinEdit19Change(Sender: TObject);
    procedure spSkinEdit12Change(Sender: TObject);
    procedure spSkinEdit23Change(Sender: TObject);
    procedure spSkinEdit26Change(Sender: TObject);
    procedure spSkinEdit29Change(Sender: TObject);
    procedure spSkinEdit32Change(Sender: TObject);
    procedure spSkinEdit35Change(Sender: TObject);
    procedure ErjinzhiChange(Sender: TObject);
    procedure BajinzhiChange(Sender: TObject);
    procedure ShijinzhiChange(Sender: TObject);
    procedure ShiliujinzhiChange(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure spSkinSpeedButton2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure iPageChange(Sender: TObject);
    procedure spSkinButton5Click(Sender: TObject);
    procedure spSkinButton6Click(Sender: TObject);
    procedure spSkinButton39Click(Sender: TObject);
    procedure spSkinButton7Click(Sender: TObject);
    procedure spSkinButton8Click(Sender: TObject);
    procedure spSkinButton9Click(Sender: TObject);
    procedure spSkinButton10Click(Sender: TObject);
    procedure spSkinButton11Click(Sender: TObject);
    procedure spSkinButton12Click(Sender: TObject);
    procedure spSkinButton14Click(Sender: TObject);
    procedure spSkinButton34Click(Sender: TObject);
    procedure spSkinButton33Click(Sender: TObject);
    procedure spSkinButton17Click(Sender: TObject);
    procedure spSkinButton18Click(Sender: TObject);
    procedure spSkinButton19Click(Sender: TObject);
    procedure spSkinButton20Click(Sender: TObject);
    procedure spSkinButton26Click(Sender: TObject);
    procedure spSkinButton38Click(Sender: TObject);
    procedure spSkinButton21Click(Sender: TObject);
    procedure spSkinButton22Click(Sender: TObject);
    procedure spSkinButton23Click(Sender: TObject);
    procedure spSkinButton24Click(Sender: TObject);
    procedure spSkinButton25Click(Sender: TObject);
    procedure spSkinButton27Click(Sender: TObject);
    procedure spSkinButton28Click(Sender: TObject);
    procedure spSkinButton37Click(Sender: TObject);
    procedure spSkinButton30Click(Sender: TObject);
    procedure spSkinButton32Click(Sender: TObject);
    procedure spSkinButton36Click(Sender: TObject);
    procedure spSkinButton16Click(Sender: TObject);
    procedure spSkinButton15Click(Sender: TObject);
    procedure spSkinButton13Click(Sender: TObject);
    procedure spSkinButton35Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MyFileName:string; //编辑的文件名称
  MySkinFileName:string; //皮肤文件路径
  ConfigFile:Tinifile;
  ConfigfileName:string; //配置文件名称
  Backgroundcolor:string; //编辑器背景色
  AlphaValue:string; //窗体编辑器透明度
  ScrollBar:string; //滚动条
  Tittle:string;  //标题
  AutoSaveTime:string;//自动保存时间间隔
  BackgroundImagePath:string;
  Istop:string;
  bmp:TBitmap;
const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
implementation
  uses Unit2,config ;

{$R *.dfm}

function inttoBitStr(intstr: string): string;
var
i :Integer;
begin
i := StrToInt(intstr);
while i <>0 do
begin              //i mod 2取模,再使用format格式化
   result:=Format('%d'+result,[i mod 2]);
   i:=i div 2
end
end;

function OtoBitStr(O: string): string;
const
      cBitStrings:   array[0..7]   of   string   =
(
'000',   '001',   '010',   '011',
'100',   '101',   '110',   '111'
);
var
i,j:   Integer;
begin
Result   :=   '';
for   I   :=   1   to   Length(o)   do
begin
    j:=strtoint(o[i]);
    Result   :=   Result   +   cBitStrings[j];
end;
while   Pos('0',   Result)   =   1   do   Delete(Result,   1,   1);
end;

function BitStrToOStr(const BitStr: String): String;
var
vD : Byte;
I : Integer;
vHextStr : String;
vP : PChar;
vLen : Integer;
begin
vLen := Length(BitStr);
if vLen mod 3 > 0 then
begin
    SetLength(vHextStr,   vLen   div   3   +   1);
    vLen := vlen div 3 + 1;
end
else
begin
    SetLength(vHextStr,   vLen   div   3);
    vLen := vlen div 3 ;
end;

//初始化
vD := 0;
vP := PChar(BitStr)+length(BitStr)-1;
I := 0;   //开始计数

while vP^ <> #0 do
begin
    if vp^ = '1' then
    begin
      case i of
      0:      vD :=vd+1;
      1:      vD :=vd+2;
      2:      vD :=vd+4;
      end;
    end;

    Dec(vP);
    Inc(I);
    if I = 3 then
    begin
      case vD of
        0..9 : vHextStr[vLen] := Chr(vD + $30);
      end;
      Dec(vLen);
      I   :=   0;
      vD   :=   0;
    end;
end;

if I > 0then
begin
    case   vD   of
      0..9 : vHextStr[vLen] := Chr(vD + $30);
    end;
end;

Result := vHextStr;
end;

function   BinToInt(InStr:String):Integer;
var
        LoopCounter:Integer;
begin
        Result   :=   0;
        for   LoopCounter   :=   1   to   Length(Instr)   do
        Result:=Result+ Trunc(StrToInt(InStr[LoopCounter])*Power(2,   Length(InStr)-LoopCounter   )   );
end;

function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function StrToInt(S: string): integer;
begin
 Val(S, Result, Result);
end;

function HexToInt(Const HexValue: String) : Integer;
begin
  Val('$'+HexValue, Result, Result);
end;

function IntToHex(Const Value: Integer): string;
const
  HexChars: array[0..15] of Char = '0123456789ABCDEF';
var
  iTemp: Integer;
  i: Integer;
begin
  Result := '';
  i := 0;
  while i<4 do
  begin
    case i of
      0: iTemp := Value shr 24 and $FF;
      1: iTemp := Value shr 16 and $FF;
      2: iTemp := Value shr 8 and $FF;
      3: iTemp := Value and $FF;
    end;
    Result := Result + HexChars[iTemp div 16];
    Result := Result + HexChars[iTemp mod 16];
    Inc(i);
  end;
end;

function LowerCase(const S: string): String;
begin
  Result:=CharLower(Pchar(S));
end;

function UpperCase(const S: string): String;
begin
  Result:=CharUpper(Pchar(S));
end;

function Encode64(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Ord(s[i]);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b div (1 shl a);
      b := b mod (1 shl a);
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Pos(s[i], codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b mod (1 shl a);
        x := x mod 256;
        Result := Result + chr(x);
      end;
    end
    else
      Exit;
  end;
end;

//转换
function Str_Gb2UniCode(text: string): String;
var
  i,len: Integer;
  cur: Integer;
  t: String;
  ws: WideString;
begin
  Result := '';
  ws := text;
  len := Length(ws);
  i := 1;
  while i <= len do
  begin
    cur := Ord(ws[i]);
    FmtStr(t,'%4.4X',[cur]);
    Result := Result + t;
    Inc(i);
  end;
end;

//恢复
function Unicode_str(text: string):string;
var
  i,len: Integer;
  ws: WideString;
begin
  ws := '';
  i := 1;
  len := Length(text);
  while i < len do
  begin
    ws := ws + Widechar(StrToInt('$' + Copy(text,i,4)));
    i := i+4;
  end;
  Result := ws;
end;

procedure TForm1.A1Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  if Assigned(AboutBox) then begin
    AboutBox := TAboutBox.Create(Application);
    AboutBox.ShowModal;
  end;
end;

procedure TForm1.B2Click(Sender: TObject);
begin
    with spskincolordialog2 do
    begin
      color:=spskincolordialog2.Color;
      if execute then
        spskinrichedit1.Color:=color;
        Backgroundcolor := ColorToString(Color);
    end;
end;

procedure TForm1.B3Click(Sender: TObject);
begin
 ShellExecute(Handle,nil,PChar( 'http://www.h4ck.org.cn/'),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.BajinzhiChange(Sender: TObject);
begin
  if Bajinzhi.Focused then begin
    Erjinzhi.Text := OtoBitStr(Bajinzhi.Text);
    Shijinzhi.Text := IntToStr(BinToInt(Erjinzhi.Text));
    Shiliujinzhi.Text := IntToHex(StrToInt(Shijinzhi.Text));
  end;
end;

procedure TForm1.btn10Click(Sender: TObject);
begin
   WinExec('Addon\PEID0.95 + 2009最新识别库\PEID0.95 + 2009最新识别库\peid0.95EN.exe',1);
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
   WinExec('Addon\OllyICE\OllyDBG.EXE',1);
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
WinExec('Addon\Restorator 2009 4.0 build 1807\Restorator.exe',1);
end;

procedure TForm1.btn13Click(Sender: TObject);
begin
   WinExec('Addon\吾爱破解专用版\吾爱破解专用版.exe',1);
end;

procedure TForm1.btn14Click(Sender: TObject);
begin
   WinExec('Addon\OllyICE\Udd Cleaner.exe',1);
end;

procedure TForm1.btn15Click(Sender: TObject);
begin
  WinExec('Addon\SoftSnoop 1.3.2\SoftSnoop.exe',1);
end;

procedure TForm1.btn16Click(Sender: TObject);
begin
  WinExec('Addon\吾爱破解专用版\Udd Cleaner.exe',1);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  WinExec('addon/dup2/dup2.exe',1);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
   WinExec('Addon\keymake1.73\keymake999.exe',1);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  WinExec('Addon\ollydbg\ollydbg2.0.exe',1);
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
   WinExec('Addon\OC and ccl\OC.exe',1);
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
   WinExec('Addon\obaby\PEiD【obaby】.exe',1);
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
   WinExec('Addon\ImpREC.v1.7c\ImportREC.exe',1);
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
   WinExec('Addon\LPE-DLX\LordPE.EXE',1);
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
  WinExec('Addon\eXeScope\eXeScope.exe',1);
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
WinExec('Addon\OllyICE\OllyICE.exe',1);
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  WinExec('plugin/ICALCLK.EXE',1);
end;

procedure TForm1.D1Click(Sender: TObject);
begin
  Unit1.Form1.Visible :=False;
  //EditorConfig.Visible := False;
  Unit1.Form1.spSkinData1.CompressedStoredSkin :=Unit1.Form1.spCompressedStoredSkin1;
  Unit1.Form1.Visible :=True;
  //EditorConfig.Visible := True;
  Unit1.ConfigFile := TIniFile.Create(Unit1.ConfigfileName);
  Unit1.ConfigFile.WriteString('main','Caption','');
  Unit1.ConfigFile.WriteString('main','SkinFile','');
  Unit1.ConfigFile.WriteString('main','Backgroundcolor','');
  Unit1.ConfigFile.WriteString('main','AlphaBlendValue','');
  Unit1.ConfigFile.Writestring('main','IsTop','');
  Unit1.ConfigFile.WriteString('Edit','Autosavetime','');
  Unit1.ConfigFile.WriteString('Edit','Scrollbar','');
  Unit1.ConfigFile.Destroy;
end;

procedure TForm1.ErjinzhiChange(Sender: TObject);
begin
  if Erjinzhi.Focused then begin
  Shijinzhi.Text := IntToStr(BinToInt(Erjinzhi.Text));
  Shiliujinzhi.Text := IntToHex(StrToInt(Shijinzhi.Text));
  Bajinzhi.Text :=BitStrToOStr(Erjinzhi.Text);
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if spSkinRichEdit1.Modified then begin
    if  messagedlg('文档内容已经被修改是否保存文件？',mtConfirmation,[mbyes,mbno],0)=mrYes  then begin
       if spSkinSaveDialog1.Execute then begin
        spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
        CanClose := True;
       end;
    end else begin
      CanClose :=True;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyFileName :='';
  MySkinFileName :='';
  tmr1.Enabled :=False;
  ConfigfileName := ExtractFilePath(paramstr(0))+'config.ini';
  if FileExists(ConfigfileName) then begin
     ConfigFile :=TIniFile.Create(ConfigfileName);
     Tittle :=ConfigFile.ReadString('main','Caption','');
     if Tittle <>'' then begin
     form1.Caption:=Tittle;
     end;
     MySkinFileName := ConfigFile.ReadString('main','SkinFile','');
     if MySkinFileName <> '' then begin
     spSkinData1.LoadFromFile(MySkinFileName);
     //config.EditorConfig.skinfile.Text := MySkinFileName;
     end;
     Backgroundcolor := ConfigFile.ReadString('main','Backgroundcolor','');
     if Backgroundcolor <>'' then begin
     spSkinRichEdit1.Color := StringToColor(Backgroundcolor);
     end;
     AlphaValue  :=ConfigFile.ReadString('main','AlphaBlendValue','');
     if AlphaValue <>''  then  begin
       Form1.AlphaBlend := True;
       form1.AlphaBlendValue :=StrToInt(AlphaValue); //透明度
       //form1.TransparentColor :=true; //透明颜色
     end;

     Istop := ConfigFile.Readstring('main','IsTop','');
     if ((Istop <>'') and (StrToInt(Istop) = 1)) then begin
       form1.FormStyle := fsStayOnTop;
     end;

     BackgroundImagePath:=configfile.ReadString('main', 'BackGround','');
     if BackgroundImagePath<>'' then   begin
       img1.Picture.LoadFromFile(BackgroundImagePath);
     end;

     ScrollBar :=ConfigFile.ReadString('Edit','Scrollbar','');
      if ScrollBar <>'' then begin

        case StrToInt(ScrollBar) of
         0: begin
             Unit1.Form1.spSkinRichEdit1.ScrollBars := ssHorizontal;
             Scrollbar :='0';
            end;
         1: begin
            Unit1.Form1.spSkinRichEdit1.ScrollBars := ssVertical;
            Scrollbar :='1';
            end;
         2: begin
            Unit1.Form1.spSkinRichEdit1.ScrollBars := ssBoth;
            Scrollbar :='2';
            end;
         3: begin
            Unit1.Form1.spSkinRichEdit1.ScrollBars := ssNone;
            Scrollbar :='3';
            end;
        end;
      end;
     AutoSaveTime :=ConfigFile.ReadString('Edit','Autosavetime','');
     if (((AutoSaveTime <>'') and ((StrToInt(AutoSaveTime))>0))) then begin
      tmr1.Enabled :=True;
      tmr1.Interval := (StrToInt(AutoSaveTime))*1000*60;
      //EditorConfig.Autosave.Text:=AutoSaveTime;
      //config.EditorConfig.Autosave.TextHint :=AutoSaveTime;
     end;
     ConfigFile.Destroy;
  end;
  spSkinStatusPanel4.Caption :='日期：'+datetostr(date) ;
  {spSkinRichEdit1.Brush.Style :=bsClear;
  SetWindowLong(spSkinRichEdit1.Handle,GWL_EXSTYLE,GWL_EXSTYLE or WS_EX_TRANSPARENT);
  SetLayeredWindowAttributes(spSkinRichEdit1.Handle, clWhite, 128, LWA_COLORKEY);}
//  bmp := TBitmap.Create;
//
//bmp.LoadFromFile('C:\Users\obaby\Pictures\截图\搜狗截图20230602223851.bmp');
//
//Brush.Bitmap := bmp;
end;

procedure TForm1.I1Click(Sender: TObject);
begin
if spSkinOpenPictureDialog1.Execute then begin
  img1.Picture.LoadFromFile(spSkinOpenPictureDialog1.FileName);
  Unit1.ConfigFile := TIniFile.Create(Unit1.ConfigfileName);
  Unit1.ConfigFile.WriteString('main','BackGround',spSkinOpenPictureDialog1.FileName);
  Unit1.ConfigFile.Destroy;
end;
//    spSkinRichEdit1.
end;

procedure TForm1.iPageChange(Sender: TObject);
begin
  {form1.Height:=783;
  Form1.Width :=606;
  Form1.Repaint; }
end;

procedure TForm1.M1Click(Sender: TObject);
begin
 try
   if spOpenSkinDialog1.Execute then  begin
      form1.Visible :=False;
      spSkinData1.LoadFromFile(spOpenSkinDialog1.FileName);
      MySkinFileName := spOpenSkinDialog1.FileName;
      Form1.Visible :=True;
   end;
 except
  Form1.Visible := True;
 end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if spSkinFontDialog1.Execute then begin
    spSkinRichEdit1.Font.Assign(spSkinFontDialog1.Font);
    spSkinRichEdit1.SelAttributes.Assign(spSkinFontDialog1.Font);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  with spskincolordialog1 do
    begin
      color:=spskincolordialog1.Color;
      if execute then
        spskinrichedit1.SelAttributes.Color:=color;
    end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  WinExec('plugin/NetMonitor.exe',1);
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  if (not spSkinRichEdit1.Modified ) then begin
    spSkinRichEdit1.Text :='';
    spSkinStatusPanel1.Caption :='File:New File....';
    MyFileName := '';
  end else begin
    if messagedlg('文档内容已经被修改是否保存文件？',mtConfirmation,[mbyes,mbno],0)=mrYes then  begin
     with spSkinSaveDialog1 do
      if Execute then begin
        spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
        spSkinRichEdit1.Lines.Text :='';
        spSkinStatusPanel1.Caption :='File:New File....';
        MyFileName := '';
      end;

    end else begin
      spSkinRichEdit1.Lines.Text :='';
      spSkinStatusPanel1.Caption := 'File:New File....';
      MyFileName :='';
    end;

  end;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if not spSkinRichEdit1.Modified then begin
    if spSkinOpenDialog1.Execute then begin
    spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
    MyFileName:= spSkinOpenDialog1.FileName;
    spSkinRichEdit1.Modified :=False;
    spSkinStatusPanel1.Caption := 'File:'+myfilename;
    end;
  end  else begin
    if  messagedlg('文档内容已经被修改是否保存文件？',mtConfirmation,[mbyes,mbno],0)=mrYes then begin
      if spSkinSaveDialog1.Execute then begin
        spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
      end;
      if spSkinOpenDialog1.Execute then begin
      spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
      spSkinStatusPanel1.Caption :='File:'+spskinopendialog1.FileName;
      MyFileName:= spSkinOpenDialog1.FileName;
      spSkinRichEdit1.Modified :=False;
      end;
    end  else begin
      if spSkinOpenDialog1.Execute then begin
      spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
      spSkinStatusPanel1.Caption :='File:'+spskinopendialog1.FileName;
      MyFileName:= spSkinOpenDialog1.FileName;
      spSkinRichEdit1.Modified :=False;
      end;
    end;

  end;

end;

procedure TForm1.S1Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  if Assigned (EditorConfig) then begin
  EditorConfig := TEditorConfig.Create(Application);
  EditorConfig.ShowModal;
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
if spSkinRichEdit1.Modified then  begin
 if MyFileName <> '' then begin
 spSkinRichEdit1.Lines.SaveToFile(MyFileName);
 end else begin
    if spSkinSaveDialog1.Execute then begin
    spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
    MyFileName:= spSkinSaveDialog1.FileName;
    spSkinStatusPanel1.Caption :='File:'+myFileName;
    end;
 end;
 spSkinRichEdit1.Modified :=False;
end;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
begin
if spSkinRichEdit1.Lines.Text <>'' then begin
  if  spSkinSaveDialog1.Execute then  begin
    spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
    MyFileName := spSkinSaveDialog1.FileName;
    spSkinStatusPanel1.Caption := 'File'+myfilename;
    spSkinRichEdit1.Modified :=False;
  end;
end;
end;

procedure TForm1.spSkinButton10Click(Sender: TObject);
begin
   WinExec('Addon\Restorator 2009 4.0 build 1807\Restorator.exe',1);
end;

procedure TForm1.spSkinButton11Click(Sender: TObject);
begin
  WinExec('Addon\winhex\WinHex.exe',1);
end;

procedure TForm1.spSkinButton12Click(Sender: TObject);
begin
   WinExec('Addon\eXeScope\eXeScope_fix_by_humourkyo.exe',1);
end;

procedure TForm1.spSkinButton13Click(Sender: TObject);
begin
WinExec('Addon\dup2 1.9\dup2.exe',1);
end;

procedure TForm1.spSkinButton14Click(Sender: TObject);
begin
  WinExec('Addon\freeRes0.94\freeRes.exe',1);
end;

procedure TForm1.spSkinButton15Click(Sender: TObject);
begin
  WinExec('Addon\keymaker2\keymake.exe',1);
end;

procedure TForm1.spSkinButton16Click(Sender: TObject);
begin
  WinExec('Addon\cazaseriales\cazaseriales.exe',1);
end;

procedure TForm1.spSkinButton17Click(Sender: TObject);
begin
  WinExec('Addon\ollydbg\ollydbg2.0.exe',1);
end;

procedure TForm1.spSkinButton18Click(Sender: TObject);
begin
   WinExec('Addon\OllyICE\OllyICE.exe',1);
end;

procedure TForm1.spSkinButton19Click(Sender: TObject);
begin
   WinExec('Addon\OllyICE\Ollydbg.exe',1);
end;

procedure TForm1.spSkinButton1Click(Sender: TObject);
begin
  spskinmemo3.Clear;
 spskinmemo3.Lines.Add(Str_Gb2UniCode(spskinmemo2.Lines.Text));
end;

procedure TForm1.spSkinButton20Click(Sender: TObject);
begin
  WinExec('Addon\吾爱破解专用版\吾爱破解专用版.exe',1);
end;

procedure TForm1.spSkinButton21Click(Sender: TObject);
begin
    WinExec('Addon\E-Code Explorer\E-Code Explorer.exe',1);
end;

procedure TForm1.spSkinButton22Click(Sender: TObject);
begin
   WinExec('Addon\DeDe.3.50.04.1635\DeDe.exe',1);
end;

procedure TForm1.spSkinButton23Click(Sender: TObject);
begin
   WinExec('Addon\ilasmGUI\ilasmGui.exe',1);
end;

procedure TForm1.spSkinButton24Click(Sender: TObject);
begin
  WinExec('Addon\ildasm2.0\ildasm (2).exe',1);
end;

procedure TForm1.spSkinButton25Click(Sender: TObject);
begin
  WinExec('Addon\PE_Explorer\pexplorer.exe',1);
end;

procedure TForm1.spSkinButton26Click(Sender: TObject);
begin
   WinExec('Addon\PEBrowsePro\PEBrowseDbg.exe',1);
end;

procedure TForm1.spSkinButton27Click(Sender: TObject);
begin
  WinExec('Addon\Reflector\Reflector.exe',1);
end;

procedure TForm1.spSkinButton28Click(Sender: TObject);
begin
   WinExec('Addon\PEBrowsePro\PEBrowsePro.exe',1);
end;

procedure TForm1.spSkinButton2Click(Sender: TObject);
begin
    spskinmemo3.Clear;
    spskinmemo3.Lines.Add(Unicode_str(spskinmemo2.Lines.Text));
end;

procedure TForm1.spSkinButton30Click(Sender: TObject);
begin
 WinExec('Addon\StrongNameRemove20\StrongNameRemove20.exe',1);
end;

procedure TForm1.spSkinButton32Click(Sender: TObject);
begin
   WinExec('Addon\p32dasm.v2.6\P32Dasm.exe',1);
end;

procedure TForm1.spSkinButton33Click(Sender: TObject);
begin
  WinExec('Addon\ProtectionID_v6.4.0\protection_id.exe',1);
end;

procedure TForm1.spSkinButton34Click(Sender: TObject);
begin
  WinExec('Addon\reshhack3.4\ResHacker.exe',1);
end;

procedure TForm1.spSkinButton35Click(Sender: TObject);
begin
WinExec('Addon\Serial_Sniffer_Creator_2.0\SS Creator 2.exe',1);
end;

procedure TForm1.spSkinButton36Click(Sender: TObject);
begin
WinExec('Addon\SoftSnoop 1.3.2\SoftSnoop.exe',1);
end;

procedure TForm1.spSkinButton37Click(Sender: TObject);
begin
  WinExec('Addon\W32dsmv10\kWdsm.exe',1);
end;

procedure TForm1.spSkinButton38Click(Sender: TObject);
begin
  WinExec('Addon\OllyDRX 1.0\DeRoX.exe',1);
end;

procedure TForm1.spSkinButton39Click(Sender: TObject);
begin
  WinExec('Addon\obaby\PEiD【obaby】.exe',1);
end;

procedure TForm1.spSkinButton3Click(Sender: TObject);
begin
  spskinmemo3.Clear;
  spskinmemo3.Lines.Add(Encode64(spskinmemo2.lines.Text));
end;

procedure TForm1.spSkinButton4Click(Sender: TObject);
begin
  spskinmemo3.Clear;
  spskinmemo3.Lines.Add(Decode64(spskinmemo2.lines.Text));
end;

procedure TForm1.spSkinButton5Click(Sender: TObject);
begin
  WinExec('Addon\c32asm\C32Asm.exe',1);

end;

procedure TForm1.spSkinButton6Click(Sender: TObject);
begin
  WinExec('Addon\PEID0.95\peid0.95EN.exe',1);
end;

procedure TForm1.spSkinButton7Click(Sender: TObject);
begin
WinExec('Addon\obaby\PEiD【obaby】.exe',1);
end;

procedure TForm1.spSkinButton8Click(Sender: TObject);
begin
  WinExec('Addon\LPE-DLX\LordPE.EXE',1);
end;

procedure TForm1.spSkinButton9Click(Sender: TObject);
begin
  WinExec('Addon\ImpREC.v1.7c\ImportREC.exe',1);
end;

//shl 运算
procedure TForm1.spSkinEdit12Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
   spSkinEdit11.Text := IntToStr(StrToInt(spSkinEdit10.Text) + StrToInt(spSkinEdit12.Text));
  end else begin
    spSkinEdit11.Text := IntToHex( StrToInt('$'+spskinedit10.Text) + strtoint('$'+spskinedit12.Text));
  end;
end;

procedure TForm1.spSkinEdit14Change(Sender: TObject);
begin
   if NotHex1.Checked then begin
    spSkinEdit15.Text := IntToStr( StrToInt(spSkinEdit13.Text) shl StrToInt(spSkinEdit14.Text) );
   end else begin
     spSkinEdit15.Text :=IntToHex( StrToInt('$'+spskinedit13.Text) shl strtoint(spSkinEdit14.Text));
   end;
end;
//shr运算右移
procedure TForm1.spSkinEdit17Change(Sender: TObject);
begin
   if NotHex1.Checked then begin
    spSkinEdit18.Text := IntToStr( StrToInt(spSkinEdit16.Text) shr StrToInt(spSkinEdit17.Text) );
   end else begin
     spSkinEdit18.Text :=IntToHex( StrToInt('$'+spskinedit16.Text) shr strtoint(spSkinEdit17.Text));
   end;
end;

procedure TForm1.spSkinEdit19Change(Sender: TObject);
begin
  if NotHex1.Checked then begin
  spSkinEdit21.Text :=IntToStr(not StrToInt(spSkinEdit19.Text));
  end else begin
    if spSkinEdit19.Text <>'' then begin
      spSkinEdit21.Text := IntToHex(not StrToInt('$'+spskinedit19.Text) );
    end;
  end;
end;

procedure TForm1.spSkinEdit23Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
   spSkinEdit24.Text := IntToStr(StrToInt(spSkinEdit22.Text) - StrToInt(spSkinEdit23.Text));
  end else begin
    spSkinEdit24.Text := IntToHex( StrToInt('$'+spskinedit22.Text) - strtoint('$'+spskinedit23.Text));
  end;
end;

procedure TForm1.spSkinEdit26Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
   spSkinEdit27.Text := IntToStr(StrToInt(spSkinEdit25.Text) * StrToInt(spSkinEdit26.Text));
  end else begin
    spSkinEdit27.Text := IntToHex( StrToInt('$'+spskinedit25.Text) * strtoint('$'+spskinedit26.Text));
  end;
end;

procedure TForm1.spSkinEdit29Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
    if ((spSkinEdit29.Text <>'') and (strtoint(spskinedit29.Text) <>0)) then
      spSkinEdit30.Text := FloatToStr((StrToInt(spSkinEdit28.Text)) / (StrToInt(spSkinEdit29.Text)));
  end else begin
   if ((spSkinEdit29.Text <>'') and (strtoint(spskinedit29.Text) <>0)) then
    spSkinEdit30.Text := IntToHex(( StrToInt('$'+spskinedit28.Text)) div (strtoint('$'+spskinedit29.Text)));
  end;
end;    ////////////////////

procedure TForm1.spSkinEdit32Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
    if ((spSkinEdit32.Text <>'') and (strtoint(spskinedit32.Text) <>0)) then
      spSkinEdit33.Text := FloatToStr((StrToInt(spSkinEdit31.Text)) div (StrToInt(spSkinEdit32.Text)));
  end else begin
   if ((spSkinEdit32.Text <>'') and (strtoint(spskinedit32.Text) <>0)) then
    spSkinEdit33.Text := IntToHex(( StrToInt('$'+spskinedit31.Text)) div (strtoint('$'+spskinedit32.Text)));
  end;
end;

procedure TForm1.spSkinEdit35Change(Sender: TObject);
begin
  if NotHex2.Checked then begin
    if ((spSkinEdit35.Text <>'') and (strtoint(spskinedit35.Text) <>0)) then
      spSkinEdit36.Text := FloatToStr((StrToInt(spSkinEdit34.Text)) mod (StrToInt(spSkinEdit35.Text)));
  end else begin
   if ((spSkinEdit35.Text <>'') and (strtoint(spskinedit35.Text) <>0)) then
    spSkinEdit36.Text := IntToHex(( StrToInt('$'+spskinedit34.Text)) mod (strtoint('$'+spskinedit35.Text)));
  end;
end;

procedure TForm1.spSkinEdit3Change(Sender: TObject);
begin
  if NotHex1.Checked then begin
    spSkinEdit2.Text := IntToStr(StrToInt(spSkinEdit1.Text) xor StrToInt(spSkinEdit3.Text));
  end else begin
    if spSkinEdit3.Text <>'' then begin
      spSkinEdit2.Text :=IntToHex((StrToInt('$'+spskinedit1.Text) xor StrToInt('$'+spskinedit3.Text)));
    end;
  end;

end;
//or运算
procedure TForm1.spSkinEdit5Change(Sender: TObject);
begin
  if NotHex1.Checked then begin
    spSkinEdit6.Text := IntToStr(StrToInt(spSkinEdit4.Text) or StrToInt(spSkinEdit5.Text));
  end else begin
    if spSkinEdit5.Text <>'' then begin
      spSkinEdit6.Text :=IntToHex((StrToInt('$'+spskinedit4.Text) or StrToInt('$'+spskinedit5.Text)));
    end;
  end;
end;
//and运算
procedure TForm1.spSkinEdit8Change(Sender: TObject);
begin
  if NotHex1.Checked then begin
    spSkinEdit9.Text := IntToStr(StrToInt(spSkinEdit7.Text) and StrToInt(spSkinEdit8.Text));
  end else begin
    if spSkinEdit8.Text <>'' then begin
      spSkinEdit9.Text :=IntToHex((StrToInt('$'+spskinedit7.Text) and StrToInt('$'+spskinedit8.Text)));
    end;
  end;
end;

procedure TForm1.spSkinRichEdit1Change(Sender: TObject);
begin
  if spSkinRichEdit1.Lines.Text ='' then begin
  spSkinStatusPanel3.Caption :='New file Or Cleared.';
  end else begin
  spSkinStatusPanel3.Caption:='File Modified.';
  end;
end;

procedure TForm1.spSkinRichEdit1SelectionChange(Sender: TObject);
begin
  spSkinStatusPanel2.Caption :=  'Pos:'+inttostr(spSkinRichEdit1.CaretPos.y) +'  Row '+ IntToStr(spSkinRichEdit1.CaretPos.x)+'  Col.'
end;

procedure TForm1.spSkinSpeedButton10Click(Sender: TObject);
begin
  with spskincolordialog1 do
    begin
      color:=spskincolordialog1.Color;
      if execute then
        spskinrichedit1.SelAttributes.Color:=color;
    end;
end;

procedure TForm1.spSkinSpeedButton11Click(Sender: TObject);
begin
  if spSkinFontDialog1.Execute then begin
    spSkinRichEdit1.SelAttributes.Assign(spSkinFontDialog1.Font);
  end;
end;

procedure TForm1.spSkinSpeedButton12Click(Sender: TObject);
begin
  Form1.FormStyle := fsNormal;
  if Assigned (EditorConfig) then begin
  EditorConfig := TEditorConfig.Create(Application);
  EditorConfig.ShowModal;
  end;
end;

procedure TForm1.spSkinSpeedButton14Click(Sender: TObject);
begin
    with spskincolordialog2 do
    begin
      color:=spskincolordialog2.Color;
      if execute then
        spskinrichedit1.Color:=color;
        Backgroundcolor := ColorToString(Color);
    end;
end;

procedure TForm1.spSkinSpeedButton1Click(Sender: TObject);
begin
  spSkinRichEdit1.CaretPos := Point(0,0);
  spSkinRichEdit1.SetFocus;
  spSkinMemo1.Lines.LoadFromFile('plugin/style.config');
  spSkinRichEdit1.Lines.Add(spSkinMemo1.Lines.Text);
end;

procedure TForm1.spSkinSpeedButton2Click(Sender: TObject);
begin
  WinExec('addon/c32asm/c32asm.exe',1);
end;

procedure TForm1.T1Click(Sender: TObject);
begin
  WinExec('plugin/Timer.exe',1);
end;

procedure TForm1.T2Click(Sender: TObject);
begin
ShellExecute(Handle,nil,PChar( 'http://www.obaby.org.cn/'),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if spSkinRichEdit1.Modified then begin
    if MyFileName <>'' then begin
      spSkinRichEdit1.Lines.SaveToFile(MyFileName);
    end else begin
       if spSkinSaveDialog1.Execute then begin
          spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
          MyFileName:= spSkinSaveDialog1.FileName;
          spSkinStatusPanel1.Caption :='File:'+myFileName;
       end;
    end;
    spSkinRichEdit1.Modified :=False;
  end;

end;

procedure TForm1.NewClick(Sender: TObject);
begin
  if (not spSkinRichEdit1.Modified ) then begin
    spSkinRichEdit1.Text :='';
    spSkinStatusPanel1.Caption :='File:New File....';
    MyFileName := '';
  end else begin
    if messagedlg('文档内容已经被修改是否保存文件？',mtConfirmation,[mbyes,mbno],0)=mrYes then  begin
     with spSkinSaveDialog1 do
      if Execute then begin
        spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
        spSkinRichEdit1.Lines.Text :='';
        spSkinStatusPanel1.Caption :='File:New File....';
        MyFileName := '';
      end;

    end else begin
      spSkinRichEdit1.Lines.Text :='';
      spSkinStatusPanel1.Caption := 'File:New File....';
      MyFileName :='';
    end;

  end;
end;

procedure TForm1.openClick(Sender: TObject);
begin
  if not spSkinRichEdit1.Modified then begin
    if spSkinOpenDialog1.Execute then begin
    spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
    MyFileName:= spSkinOpenDialog1.FileName;
    spSkinRichEdit1.Modified :=False;
    spSkinStatusPanel1.Caption := 'File:'+myfilename;
    end;
  end  else begin
    if  messagedlg('文档内容已经被修改是否保存文件？',mtConfirmation,[mbyes,mbno],0)=mrYes then begin
      if spSkinSaveDialog1.Execute then begin
        spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
      end;
      if spSkinOpenDialog1.Execute then begin
      spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
      spSkinStatusPanel1.Caption :='File:'+spskinopendialog1.FileName;
      MyFileName:= spSkinOpenDialog1.FileName;
      spSkinRichEdit1.Modified :=False;
      end;
    end  else begin
      if spSkinOpenDialog1.Execute then begin
      spSkinRichEdit1.Lines.LoadFromFile(spSkinOpenDialog1.FileName);
      spSkinStatusPanel1.Caption :='File:'+spskinopendialog1.FileName;
      MyFileName:= spSkinOpenDialog1.FileName;
      spSkinRichEdit1.Modified :=False;
      end;
    end;

  end;

end;

procedure TForm1.SaveClick(Sender: TObject);
begin
if spSkinRichEdit1.Modified then  begin
 if MyFileName <> '' then begin
 spSkinRichEdit1.Lines.SaveToFile(MyFileName);
 end else begin
    if spSkinSaveDialog1.Execute then begin
    spSkinRichEdit1.Lines.SaveToFile(spSkinSaveDialog1.FileName);
    MyFileName:= spSkinSaveDialog1.FileName;
    spSkinStatusPanel1.Caption :='File:'+myFileName;
    end;
 end;
 spSkinRichEdit1.Modified :=False;
end;
end;
procedure TForm1.ShijinzhiChange(Sender: TObject);
begin
  if (Shijinzhi.Focused and (Shijinzhi.Text<>'')) then begin
    erjinzhi.Text := inttoBitStr(Shijinzhi.Text);
    Bajinzhi.Text :=BitStrToOStr(Erjinzhi.Text);
    Shiliujinzhi.Text := IntToHex(StrToInt(Shijinzhi.Text));
  end;
end;

procedure TForm1.ShiliujinzhiChange(Sender: TObject);
begin
  if Shiliujinzhi.Focused then begin
    Shijinzhi.Text := IntToStr(HexToInt(Shiliujinzhi.Text));
    erjinzhi.Text := inttoBitStr(Shijinzhi.Text);
    Bajinzhi.Text :=BitStrToOStr(Erjinzhi.Text);
  end;
end;

end.
