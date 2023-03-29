program PrjListView;

uses
  Vcl.Forms,
  uFrmListView in 'uFrmListView.pas' {FrmListView},
  uCliente in 'uCliente.pas',
  uFrmListViewOO in 'uFrmListViewOO.pas' {frmListViewOO};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmListViewOO, frmListViewOO);
  Application.CreateForm(TFrmListView, FrmListView);
  Application.Run;
end.
