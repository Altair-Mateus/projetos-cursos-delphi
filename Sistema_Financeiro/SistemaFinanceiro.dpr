program SistemaFinanceiro;

uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\view\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.CadastroPadrao in 'src\view\SistemaFinanceiro.View.CadastroPadrao.pas' {frmCadastroPadrao},
  SistemaFinanceiro.View.Splash in 'src\view\SistemaFinanceiro.View.Splash.pas' {frmSplash},
  SistemaFinanceiro.Model.udmDados in 'src\model\SistemaFinanceiro.Model.udmDados.pas' {DataModule1: TDataModule},
  SistemaFinanceiro.View.Usuarios in 'src\view\SistemaFinanceiro.View.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Model.dmUsuarios in 'src\model\SistemaFinanceiro.Model.dmUsuarios.pas' {DataModuleUsuarios: TDataModule},
  SistemaFinanceiro.Utilitarios in 'src\util\SistemaFinanceiro.Utilitarios.pas',
  SistemaFinanceiro.View.Login in 'src\view\SistemaFinanceiro.View.Login.pas' {frmLogin},
  SistemaFinanceiro.Model.Entidades.Usuario in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.Usuario.pas',
  SistemaFinanceiro.View.RedefinirSenha in 'src\view\SistemaFinanceiro.View.RedefinirSenha.pas' {frmRedefinirSenha},
  SistemaFinanceiro.Model.dmCaixa in 'src\model\SistemaFinanceiro.Model.dmCaixa.pas' {DataModuleCaixa: TDataModule},
  SistemaFinanceiro.View.Caixa in 'src\view\SistemaFinanceiro.View.Caixa.pas' {frmCaixa},
  SistemaFinanceiro.View.SaldoCaixa in 'src\view\SistemaFinanceiro.View.SaldoCaixa.pas' {frmSaldoCaixa},
  SistemaFinanceiro.Model.Entidades.ResumoCaixa in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.ResumoCaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModuleUsuarios, DataModuleUsuarios);
  Application.CreateForm(TDataModuleCaixa, DataModuleCaixa);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
