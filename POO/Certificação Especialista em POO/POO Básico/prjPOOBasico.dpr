program prjPOOBasico;

uses
  Vcl.Forms,
  fAula2 in 'fAula2.pas' {frmAula2},
  fAula3 in 'fAula3.pas' {frmAula3},
  fAula4 in 'fAula4.pas' {frmAula4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAula3, frmAula3);
  Application.CreateForm(TfrmAula2, frmAula2);
  Application.CreateForm(TfrmAula4, frmAula4);
  Application.Run;
end.
