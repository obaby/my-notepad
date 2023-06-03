unit config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, SkinData, ComCtrls, SkinCtrls, SkinExCtrls,
  StdCtrls, Mask, SkinBoxCtrls,IniFiles;

type
  TEditorConfig = class(TForm)
    spSkinData1: TspSkinData;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinLabel1: TspSkinLabel;
    spSkinLabel2: TspSkinLabel;
    Edittittle: TspSkinEdit;
    skinfile: TspSkinEdit;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinCheckRadioBox1: TspSkinCheckRadioBox;
    spSkinGroupBox2: TspSkinGroupBox;
    spSkinShadowLabel1: TspSkinShadowLabel;
    spSkinFrame1: TspSkinFrame;
    spSkinButton3: TspSkinButton;
    spSkinButton4: TspSkinButton;
    spSkinButton5: TspSkinButton;
    spSkinButton6: TspSkinButton;
    spSkinShadowLabel2: TspSkinShadowLabel;
    spSkinShadowLabel3: TspSkinShadowLabel;
    Autosave: TspSkinNumericEdit;
    spSkinShadowLabel4: TspSkinShadowLabel;
    spSkinComboBox1: TspSkinComboBox;
    spSkinButton7: TspSkinButton;
    spSkinTrackBar1: TspSkinTrackBar;
    procedure spSkinTrackBar1Change(Sender: TObject);
    procedure spSkinCheckRadioBox1Click(Sender: TObject);
    procedure spSkinComboBox1Change(Sender: TObject);
    procedure spSkinButton4Click(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure spSkinButton7Click(Sender: TObject);
    procedure spSkinButton3Click(Sender: TObject);
    procedure spSkinButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spSkinButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorConfig: TEditorConfig;

implementation
  uses Unit1;
{$R *.dfm}



procedure TEditorConfig.FormCreate(Sender: TObject);
begin
  if Unit1.MySkinFileName <>'' then begin
  skinfile.Text := Unit1.MySkinFileName;
  end;
  if ((AutoSaveTime <>'' ) and (StrToInt(AutoSaveTime)<>0)) then begin
  Autosave.Text := AutoSaveTime;
  end;
end;

procedure TEditorConfig.spSkinButton1Click(Sender: TObject);
begin
 try
   if Unit1.Form1.spOpenSkinDialog1.Execute then  begin
      Unit1.Form1.Visible :=False;
      EditorConfig.Visible :=False;
      Unit1.Form1.spSkinData1.LoadFromFile(Unit1.Form1.spOpenSkinDialog1.FileName);
      MySkinFileName := Unit1.Form1.spOpenSkinDialog1.FileName;
      Unit1.Form1.Visible :=True;
      EditorConfig.Visible :=True;
   end;
 except
  Unit1.Form1.Visible := True;
  EditorConfig.Visible:=True;
 end;

end;

procedure TEditorConfig.spSkinButton2Click(Sender: TObject);
begin
    with Unit1.Form1.spskincolordialog2 do
    begin
      color:=Unit1.Form1.spskincolordialog2.Color;
      if execute then
        Unit1.Form1.spskinrichedit1.Color:=color;
        Backgroundcolor := ColorToString(Color);
    end;
end;

procedure TEditorConfig.spSkinButton3Click(Sender: TObject);
begin
  if Unit1.Form1.spSkinFontDialog1.Execute then begin
    Unit1.Form1.spSkinRichEdit1.SelAttributes.Assign(Unit1.Form1.spSkinFontDialog1.Font);
  end;
end;

procedure TEditorConfig.spSkinButton4Click(Sender: TObject);
begin
    with Unit1.Form1.spskincolordialog1 do
    begin
      color:=Unit1.Form1.spskincolordialog1.Color;
      if execute then
        Unit1.Form1.spskinrichedit1.SelAttributes.Color:=color;
    end;
end;

procedure TEditorConfig.spSkinButton5Click(Sender: TObject);
begin
  Unit1.Form1.Visible :=False;
  EditorConfig.Visible := False;
  Unit1.Form1.spSkinData1.CompressedStoredSkin :=Unit1.Form1.spCompressedStoredSkin1;
  Unit1.Form1.Visible :=True;
  EditorConfig.Visible := True;
  Unit1.ConfigFile := TIniFile.Create(Unit1.ConfigfileName);
  Unit1.ConfigFile.WriteString('main','Caption','');
  Unit1.ConfigFile.WriteString('main','SkinFile','');
  Unit1.ConfigFile.WriteString('main','Backgroundcolor','');
  Unit1.ConfigFile.WriteString('main','AlphaBlendValue','');
  Unit1.ConfigFile.Writestring('main','IsTop','');
  Unit1.ConfigFile.WriteString('Edit','Autosavetime','');
  Unit1.ConfigFile.WriteString('Edit','Scrollbar','');
  Unit1.ConfigFile.Destroy;
  ShowMessage('已经恢复默认配置，重启后生效！');
end;

procedure TEditorConfig.spSkinButton6Click(Sender: TObject);
begin
  Unit1.ConfigFile := TIniFile.Create(Unit1.ConfigfileName);
  Unit1.ConfigFile.WriteString('main','Caption',Edittittle.Text);
  Unit1.ConfigFile.WriteString('main','SkinFile',MySkinFileName);
  Unit1.ConfigFile.WriteString('main','Backgroundcolor',Backgroundcolor);
  Unit1.ConfigFile.WriteString('main','AlphaBlendValue',AlphaValue);
  Unit1.ConfigFile.Writestring('main','IsTop',Istop);
  Unit1.ConfigFile.WriteString('Edit','Autosavetime',AutoSaveTime);
  Unit1.ConfigFile.WriteString('Edit','Scrollbar',ScrollBar);
  Unit1.ConfigFile.Destroy;
  ShowMessage('配置文件已经更新！');
end;

procedure TEditorConfig.spSkinButton7Click(Sender: TObject);
begin
  if  StrToInt(Autosave.Text)>0 then begin
    Unit1.Form1.tmr1.Enabled :=True;
    Unit1.Form1.tmr1.Interval := StrToInt(Autosave.text) *1000*60;
    Unit1.AutoSaveTime := Autosave.text;
    ShowMessage('自动保存功能已经打开，间隔为'+autosave.Text+'分钟'+#10#13
    +'如果想关闭自动保存，请修改时间为0！');
  end else begin
    Unit1.Form1.tmr1.Enabled :=False;
    Unit1.AutoSaveTime := Autosave.text;
    ShowMessage('自动保存功能已经关闭，请注意随时保存文档！');
  end;

end;

procedure TEditorConfig.spSkinCheckRadioBox1Click(Sender: TObject);
begin
  if spSkinCheckRadioBox1.Checked then begin
    Unit1.Form1.FormStyle :=fsStayOnTop;
    Istop :='1';
  end else begin
    Unit1.Form1.FormStyle :=fsNormal;
    Istop := '0';
  end;

end;

procedure TEditorConfig.spSkinComboBox1Change(Sender: TObject);
begin
   case spSkinComboBox1.ItemIndex of
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

procedure TEditorConfig.spSkinTrackBar1Change(Sender: TObject);
begin
  Unit1.Form1.AlphaBlend := True;
  Unit1.form1.AlphaBlendValue := spSkinTrackBar1.Value;
  Unit1.AlphaValue := IntToStr(spSkinTrackBar1.Value);
end;

end.
