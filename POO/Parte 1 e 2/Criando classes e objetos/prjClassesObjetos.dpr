program prjClassesObjetos;

uses
  Vcl.Forms,
  frmExemplo in 'frmExemplo.pas' {Form1},
  uCarro in 'uCarro.pas',
  uAviao in 'uAviao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.