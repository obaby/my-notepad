unit unitform_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls
type
  Tform_search=class(TForm)
    lv_searchresults: TListView;
    RzPanel1: TRzPanel;
    lbl_search: TLabel;
    edit_searchtext: TEdit;
    btn_search: TButton;
    procedure btn_searchClick(Sender : TObject);
    procedure lv_searchresultsClick(Sender : TObject);
    procedure FormClose(Sender : TObject);
    procedure _PROC_00494F63(Sender : TObject);
    procedure _PROC_004950A4(Sender : TObject);
    procedure _PROC_004950D4(Sender : TObject);
    procedure _PROC_004950DC(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end ;

var
  form_search: Tform_search;

{This file is generated by DeDe Ver 3.50.04 Copyright (c) 1999-2002 DaFixer}

implementation

{$R *.DFM}

procedure Tform_search.btn_searchClick(Sender : TObject);
begin
(*
00494F78   55                     push    ebp
00494F79   8BEC                   mov     ebp, esp
00494F7B   6A00                   push    $00
00494F7D   53                     push    ebx
00494F7E   8BD8                   mov     ebx, eax
00494F80   33C0                   xor     eax, eax
00494F82   55                     push    ebp

* Possible String Reference to: '�z�����[Y]�U��j'
|
00494F83   68FD4F4900             push    $00494FFD

***** TRY
|
00494F88   64FF30                 push    dword ptr fs:[eax]
00494F8B   648920                 mov     fs:[eax], esp

* Reference to TScreen instance
|
00494F8E   A16C044A00             mov     eax, dword ptr [$004A046C]
00494F93   8B00                   mov     eax, [eax]
00494F95   66BAF5FF               mov     dx, $FFF5

* Reference to: Forms.TScreen.SetCursor(TScreen;TCursor);
|
00494F99   E84E0FFEFF             call    00475EEC
00494F9E   33C0                   xor     eax, eax
00494FA0   55                     push    ebp
00494FA1   68E04F4900             push    $00494FE0

***** TRY
|
00494FA6   64FF30                 push    dword ptr fs:[eax]
00494FA9   648920                 mov     fs:[eax], esp
00494FAC   8D55FC                 lea     edx, [ebp-$04]

* Reference to control Tform_search.edit_searchtext : TEdit
|
00494FAF   8B8304030000           mov     eax, [ebx+$0304]

* Reference to: Controls.TControl.GetText(TControl):TCaption;
|
00494FB5   E8E632FCFF             call    004582A0
00494FBA   8B55FC                 mov     edx, [ebp-$04]
00494FBD   8BC3                   mov     eax, ebx

|
00494FBF   E888FDFFFF             call    00494D4C
00494FC4   33C0                   xor     eax, eax
00494FC6   5A                     pop     edx
00494FC7   59                     pop     ecx
00494FC8   59                     pop     ecx
00494FC9   648910                 mov     fs:[eax], edx

****** FINALLY
|
00494FCC   68E74F4900             push    $00494FE7

* Reference to TScreen instance
|
00494FD1   A16C044A00             mov     eax, dword ptr [$004A046C]
00494FD6   8B00                   mov     eax, [eax]
00494FD8   33D2                   xor     edx, edx

* Reference to: Forms.TScreen.SetCursor(TScreen;TCursor);
|
00494FDA   E80D0FFEFF             call    00475EEC
00494FDF   C3                     ret


* Reference to: System.@HandleFinally;
|
00494FE0   E997EBF6FF             jmp     00403B7C
00494FE5   EBEA                   jmp     00494FD1

****** END
|
00494FE7   33C0                   xor     eax, eax
00494FE9   5A                     pop     edx
00494FEA   59                     pop     ecx
00494FEB   59                     pop     ecx
00494FEC   648910                 mov     fs:[eax], edx

****** FINALLY
|

* Possible String Reference to: '[Y]�U��j'
|
00494FEF   6804504900             push    $00495004
00494FF4   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
00494FF7   E87CF1F6FF             call    00404178
00494FFC   C3                     ret


* Reference to: System.@HandleFinally;
|
00494FFD   E97AEBF6FF             jmp     00403B7C
00495002   EBF0                   jmp     00494FF4

****** END
|
00495004   5B                     pop     ebx
00495005   59                     pop     ecx
00495006   5D                     pop     ebp
00495007   C3                     ret

*)
end;

procedure Tform_search.lv_searchresultsClick(Sender : TObject);
begin
(*
00495008   55                     push    ebp
00495009   8BEC                   mov     ebp, esp
0049500B   6A00                   push    $00
0049500D   53                     push    ebx
0049500E   56                     push    esi
0049500F   8BD8                   mov     ebx, eax
00495011   33C0                   xor     eax, eax
00495013   55                     push    ebp
00495014   6878504900             push    $00495078

***** TRY
|
00495019   64FF30                 push    dword ptr fs:[eax]
0049501C   648920                 mov     fs:[eax], esp

* Reference to control Tform_search.lv_searchresults : TListView
|
0049501F   8B83F8020000           mov     eax, [ebx+$02F8]

* Reference to: ComCtrls.TCustomListView.GetSelected(TCustomListView):TListItem;
|
00495025   E886F2FAFF             call    004442B0
0049502A   8BF0                   mov     esi, eax
0049502C   85F6                   test    esi, esi
0049502E   7432                   jz      00495062

* Reference to field Tform_search.OFFS_0312
|
00495030   6683BB1203000000       cmp     word ptr [ebx+$0312], +$00
00495038   7428                   jz      00495062

* Reference to field TListView.Name : TComponentName
|
0049503A   8B4608                 mov     eax, [esi+$08]
0049503D   8B10                   mov     edx, [eax]

* Possible reference to virtual method TComponentName.OFFS_14
|
0049503F   FF5214                 call    dword ptr [edx+$14]
00495042   85C0                   test    eax, eax
00495044   7E1C                   jle     00495062
00495046   8D4DFC                 lea     ecx, [ebp-$04]
00495049   33D2                   xor     edx, edx

* Reference to field TListView.Name : TComponentName
|
0049504B   8B4608                 mov     eax, [esi+$08]
0049504E   8B30                   mov     esi, [eax]

* Possible reference to virtual method TComponentName.OFFS_0C
|
00495050   FF560C                 call    dword ptr [esi+$0C]
00495053   8B55FC                 mov     edx, [ebp-$04]

* Reference to field Tform_search.OFFS_0314
|
00495056   8B8314030000           mov     eax, [ebx+$0314]

* Possible reference to virtual method Tform_search.OFFS_0310
|
0049505C   FF9310030000           call    dword ptr [ebx+$0310]
00495062   33C0                   xor     eax, eax
00495064   5A                     pop     edx
00495065   59                     pop     ecx
00495066   59                     pop     ecx
00495067   648910                 mov     fs:[eax], edx

****** FINALLY
|
0049506A   687F504900             push    $0049507F
0049506F   8D45FC                 lea     eax, [ebp-$04]

* Reference to: System.@LStrClr(void;void);
|
00495072   E801F1F6FF             call    00404178
00495077   C3                     ret


* Reference to: System.@HandleFinally;
|
00495078   E9FFEAF6FF             jmp     00403B7C
0049507D   EBF0                   jmp     0049506F

****** END
|
0049507F   5E                     pop     esi
00495080   5B                     pop     ebx
00495081   59                     pop     ecx
00495082   5D                     pop     ebp
00495083   C3                     ret

*)
end;

procedure Tform_search.FormClose(Sender : TObject);
begin
(*
00495084   53                     push    ebx

* Reference to field Tform_search.OFFS_031A
|
00495085   6683B81A03000000       cmp     word ptr [eax+$031A], +$00
0049508D   7410                   jz      0049509F
0049508F   8BD8                   mov     ebx, eax
00495091   8BD0                   mov     edx, eax

* Reference to field Tform_search.OFFS_031C
|
00495093   8B831C030000           mov     eax, [ebx+$031C]

* Possible reference to virtual method Tform_search.OFFS_0318
|
00495099   FF9318030000           call    dword ptr [ebx+$0318]
0049509F   5B                     pop     ebx
004950A0   C3                     ret

*)
end;

procedure Tform_search._PROC_00494F63(Sender : TObject);
begin
(*
00494F63   003C54                 add     [esp+edx*2], bh
00494F66   49                     dec     ecx
00494F67   54                     push    esp
00494F68   4C                     dec     esp
00494F69   45                     inc     ebp
00494F6A   3E003C2F               add     ds:[edi+ebp], bh
00494F6E   54                     push    esp
00494F6F   49                     dec     ecx
00494F70   54                     push    esp
00494F71   4C                     dec     esp
00494F72   45                     inc     ebp
00494F73   3E0000                 add     ds:[eax], al
00494F76   0000                   add     [eax], al

*)
end;

procedure Tform_search._PROC_004950A4(Sender : TObject);
begin
(*
004950A4   55                     push    ebp
004950A5   8BEC                   mov     ebp, esp
004950A7   33C0                   xor     eax, eax
004950A9   55                     push    ebp
004950AA   68C9504900             push    $004950C9

***** TRY
|
004950AF   64FF30                 push    dword ptr fs:[eax]
004950B2   648920                 mov     fs:[eax], esp
004950B5   FF05A01D4A00           inc     dword ptr [$004A1DA0]
004950BB   33C0                   xor     eax, eax
004950BD   5A                     pop     edx
004950BE   59                     pop     ecx
004950BF   59                     pop     ecx
004950C0   648910                 mov     fs:[eax], edx

****** FINALLY
|
004950C3   68D0504900             push    $004950D0
004950C8   C3                     ret


* Reference to: System.@HandleFinally;
|
004950C9   E9AEEAF6FF             jmp     00403B7C
004950CE   EBF8                   jmp     004950C8

****** END
|
004950D0   5D                     pop     ebp
004950D1   C3                     ret

*)
end;

procedure Tform_search._PROC_004950D4(Sender : TObject);
begin
(*
004950D4   832DA01D4A0001         sub     dword ptr [$004A1DA0], +$01
004950DB   C3                     ret

*)
end;

procedure Tform_search._PROC_004950DC(Sender : TObject);
begin
(*
004950DC   CC                     int     3
004950DD   83442404D8             add     dword ptr [esp+$04], -$28
004950E2   E981070000             jmp     00495868
004950E7   83442404D8             add     dword ptr [esp+$04], -$28
004950EC   E933060000             jmp     00495724
004950F1   83442404D8             add     dword ptr [esp+$04], -$28
004950F6   E9F9060000             jmp     004957F4
004950FB   83442404D8             add     dword ptr [esp+$04], -$28
00495100   E9FB070000             jmp     00495900
00495105   83442404D8             add     dword ptr [esp+$04], -$28

|
0049510A   E9654EFEFF             jmp     00479F74
0049510F   83442404D8             add     dword ptr [esp+$04], -$28

|
00495114   E9874EFEFF             jmp     00479FA0
00495119   83442404D8             add     dword ptr [esp+$04], -$28

|
0049511E   E9A14EFEFF             jmp     00479FC4
00495123   83442404D4             add     dword ptr [esp+$04], -$2C
00495128   E903030000             jmp     00495430
0049512D   83442404D4             add     dword ptr [esp+$04], -$2C
00495132   E965030000             jmp     0049549C
00495137   83442404D4             add     dword ptr [esp+$04], -$2C
0049513C   E913030000             jmp     00495454
00495141   83442404D4             add     dword ptr [esp+$04], -$2C
00495146   E915030000             jmp     00495460
0049514B   83442404D4             add     dword ptr [esp+$04], -$2C
00495150   E963010000             jmp     004952B8
00495155   83442404D4             add     dword ptr [esp+$04], -$2C
0049515A   E90D030000             jmp     0049546C
0049515F   83442404D4             add     dword ptr [esp+$04], -$2C
00495164   E90F030000             jmp     00495478
00495169   83442404D4             add     dword ptr [esp+$04], -$2C
0049516E   E9C9020000             jmp     0049543C
00495173   83442404D4             add     dword ptr [esp+$04], -$2C
00495178   E907030000             jmp     00495484
0049517D   83442404D4             add     dword ptr [esp+$04], -$2C
00495182   E909030000             jmp     00495490
00495187   83442404D4             add     dword ptr [esp+$04], -$2C

|
0049518C   E9E34DFEFF             jmp     00479F74
00495191   83442404D4             add     dword ptr [esp+$04], -$2C

|
00495196   E9054EFEFF             jmp     00479FA0
0049519B   83442404D4             add     dword ptr [esp+$04], -$2C

|
004951A0   E91F4EFEFF             jmp     00479FC4
004951A5   CC                     int     3
004951A6   CC                     int     3
004951A7   CC                     int     3
004951A8   055149000F             add     eax, +$0F004951
004951AD   51                     push    ecx
004951AE   49                     dec     ecx
004951AF   0019                   add     [ecx], bl
004951B1   51                     push    ecx
004951B2   49                     dec     ecx
004951B3   00DD                   add     ch, bl
004951B5   50                     push    eax
004951B6   49                     dec     ecx
004951B7   00E7                   add     bh, ah
004951B9   50                     push    eax
004951BA   49                     dec     ecx
004951BB   00F1                   add     cl, dh
004951BD   50                     push    eax
004951BE   49                     dec     ecx
004951BF   00FB                   add     bl, bh
004951C1   50                     push    eax
004951C2   49                     dec     ecx
004951C3   008751490091           add     [edi+$91004951], al
004951C9   51                     push    ecx
004951CA   49                     dec     ecx
004951CB   009B5149004B           add     [ebx+$4B004951], bl
004951D1   51                     push    ecx
004951D2   49                     dec     ecx
004951D3   005551                 add     [ebp+$51], dl
004951D6   49                     dec     ecx
004951D7   005F51                 add     [edi+$51], bl
004951DA   49                     dec     ecx
004951DB   006951                 add     [ecx+$51], ch
004951DE   49                     dec     ecx
004951DF   007351                 add     [ebx+$51], dh
004951E2   49                     dec     ecx
004951E3   007D51                 add     [ebp+$51], bh
004951E6   49                     dec     ecx
004951E7   0023                   add     [ebx], ah
004951E9   51                     push    ecx
004951EA   49                     dec     ecx
004951EB   002D51490037           add     [$37004951], ch
004951F1   51                     push    ecx
004951F2   49                     dec     ecx
004951F3   004151                 add     [ecx+$51], al
004951F6   49                     dec     ecx
004951F7   0002                   add     [edx], al
004951F9   0000                   add     [eax], al

*)
end;

end.