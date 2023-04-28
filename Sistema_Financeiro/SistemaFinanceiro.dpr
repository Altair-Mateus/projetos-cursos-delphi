program SistemaFinanceiro;

uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\view\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.CadastroPadrao in 'src\view\SistemaFinanceiro.View.CadastroPadrao.pas' {frmCadastroPadrao},
  SistemaFinanceiro.View.Splash in 'src\view\SistemaFinanceiro.View.Splash.pas' {frmSplash},
  SistemaFinanceiro.Model.udmDados in 'src\model\SistemaFinanceiro.Model.udmDados.pas' {DataModule1: TDataModule},
  SistemaFinanceiro.View.Usuarios in 'src\view\SistemaFinanceiro.View.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Model.dmUsuarios in 'src\model\SistemaFinanceiro.Model.dmUsuarios.pas' {DataModuleUsuarios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModuleUsuarios, DataModuleUsuarios);
  Application.Run;
end.
