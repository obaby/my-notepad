program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'about\Unit2.pas' {AboutBox},
  config in 'Config\config.pas' {EditorConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '火星信息安全研究院记事本';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TEditorConfig, EditorConfig);
  Application.Run;
end.
