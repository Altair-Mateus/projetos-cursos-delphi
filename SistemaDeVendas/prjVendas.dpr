program prjVendas;

uses
  Vcl.Forms,
  uFormMain in 'Forms\uFormMain.pas' {FormMain},
  uDmDados in 'Forms\uDmDados.pas' {dmDados: TDataModule},
  uBiblioteca in 'Classes\uBiblioteca.pas',
  uFormConfigBanco in 'Forms\uFormConfigBanco.pas' {FormConfigBanco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormConfigBanco, FormConfigBanco);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
