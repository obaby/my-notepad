{This file is generated by DeDe Ver 3.50.04 Copyright (c) 1999-2001 DaFixer}

Project Viewer;

Uses
  Printers in 'Printers.pas' {TPrinterCanvas},
  unitform_search in 'unitform_search.pas' {Tform_search},
  unitform_about in 'unitform_about.pas' {Tform_about},
  unitform_demomsg in 'unitform_demomsg.pas' {Tform_demomsg},
  unitform_login in 'unitform_login.pas' {Tform_login},
  unitform_logincode in 'unitform_logincode.pas' {Tform_logincode},
  unitform_main in 'unitform_main.pas' {Tform_viewer};

{$R *.RES}

begin
{
0049CC5C   55                     push    ebp
0049CC5D   8BEC                   mov     ebp, esp
0049CC5F   83C4EC                 add     esp, -$14
0049CC62   33C0                   xor     eax, eax
0049CC64   8945EC                 mov     [ebp-$14], eax
0049CC67   B8BCC84900             mov     eax, $0049C8BC

* Reference to: SysInit.@InitExe(Pointer);
|
0049CC6C   E82398F6FF             call    00406494
0049CC71   33C0                   xor     eax, eax
0049CC73   55                     push    ebp

* Possible String Reference to: '�Mn�����Rs����'
|
0049CC74   682ACD4900             push    $0049CD2A

***** TRY
|
0049CC79   64FF30                 push    dword ptr fs:[eax]
0049CC7C   648920                 mov     fs:[eax], esp
0049CC7F   6A40                   push    $40
0049CC81   8D55EC                 lea     edx, [ebp-$14]
0049CC84   33C0                   xor     eax, eax

* Reference to: System.ParamStr(Integer):String;
|
0049CC86   E88D5EF6FF             call    00402B18
0049CC8B   8B4DEC                 mov     ecx, [ebp-$14]
0049CC8E   B201                   mov     dl, $01

* Reference to class TFileStream
|
0049CC90   A1DC7E4100             mov     eax, dword ptr [$00417EDC]

* Reference to: Classes.TFileStream.Create(TFileStream;boolean;AnsiString;Word);overload;
|
0049CC95   E8E6FBF7FF             call    0041C880

* Reference to GlobalVar_004A1E54
|
0049CC9A   A3541E4A00             mov     dword ptr [$004A1E54], eax
0049CC9F   33C0                   xor     eax, eax
0049CCA1   55                     push    ebp
0049CCA2   680DCD4900             push    $0049CD0D

***** TRY
|
0049CCA7   64FF30                 push    dword ptr fs:[eax]
0049CCAA   648920                 mov     fs:[eax], esp

* Reference to TApplication instance
|
0049CCAD   A1AC024A00             mov     eax, dword ptr [$004A02AC]
0049CCB2   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.Initialize(TApplication);
|
0049CCB4   E853B1FDFF             call    00477E0C

* Reference to TApplication instance
|
0049CCB9   A1AC024A00             mov     eax, dword ptr [$004A02AC]
0049CCBE   8B00                   mov     eax, [eax]

* Reference to field TApplication.ShowMainForm : Boolean
|
0049CCC0   C6405B00               mov     byte ptr [eax+$5B], $00

* Reference to pointer to GlobalVar_004A1E4C
|
0049CCC4   A158014A00             mov     eax, dword ptr [$004A0158]
0049CCC9   8B15541E4A00           mov     edx, [$004A1E54]
0049CCCF   8910                   mov     [eax], edx

* Reference to Tform_viewer instance
|
0049CCD1   8B0D98004A00           mov     ecx, [$004A0098]

* Reference to TApplication instance
|
0049CCD7   A1AC024A00             mov     eax, dword ptr [$004A02AC]
0049CCDC   8B00                   mov     eax, [eax]

* Reference to class Tform_viewer
|
0049CCDE   8B1558974900           mov     edx, [$00499758]

* Reference to: Forms.TApplication.CreateForm(TApplication;TComponentClass;void;void);
|
0049CCE4   E83BB1FDFF             call    00477E24

* Reference to TApplication instance
|
0049CCE9   A1AC024A00             mov     eax, dword ptr [$004A02AC]
0049CCEE   8B00                   mov     eax, [eax]

* Reference to: Forms.TApplication.Run(TApplication);
|
0049CCF0   E8AFB1FDFF             call    00477EA4
0049CCF5   33C0                   xor     eax, eax
0049CCF7   5A                     pop     edx
0049CCF8   59                     pop     ecx
0049CCF9   59                     pop     ecx
0049CCFA   648910                 mov     fs:[eax], edx

****** FINALLY
|
0049CCFD   6814CD4900             push    $0049CD14
0049CD02   A1541E4A00             mov     eax, dword ptr [$004A1E54]

* Reference to: System.TObject.Free(TObject);
|
0049CD07   E8DC66F6FF             call    004033E8
0049CD0C   C3                     ret


* Reference to: System.@HandleFinally;
|
0049CD0D   E96A6EF6FF             jmp     00403B7C
0049CD12   EBEE                   jmp     0049CD02

****** END
|
0049CD14   33C0                   xor     eax, eax
0049CD16   5A                     pop     edx
0049CD17   59                     pop     ecx
0049CD18   59                     pop     ecx
0049CD19   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '�Rs����'
|
0049CD1C   6831CD4900             push    $0049CD31
0049CD21   8D45EC                 lea     eax, [ebp-$14]

* Reference to: System.@LStrClr(void;void);
|
0049CD24   E84F74F6FF             call    00404178
0049CD29   C3                     ret


* Reference to: System.@HandleFinally;
|
0049CD2A   E94D6EF6FF             jmp     00403B7C
0049CD2F   EBF0                   jmp     0049CD21

* Reference to: System.@Halt0;
|
0049CD31   E85273F6FF             call    00404088
0049CD36   8BC0                   mov     eax, eax
0049CD38   0000                   add     [eax], al

}
end.
