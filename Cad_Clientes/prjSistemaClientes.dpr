program prjSistemaClientes;

uses
  Vcl.Forms,
  fCadCliente in 'fCadCliente.pas' {Form1},
  uDmdados in 'uDmdados.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
