program Project1;

uses
  Forms,
  LauncherUnit in 'LauncherUnit.pas' {LauncherForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLauncherForm, LauncherForm);
  Application.Run;
end.
