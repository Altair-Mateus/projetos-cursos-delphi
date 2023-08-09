program SistemaFinanceiro;
uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\view\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.CadastroPadrao in 'src\view\SistemaFinanceiro.View.CadastroPadrao.pas' {frmCadastroPadrao},
  SistemaFinanceiro.View.Splash in 'src\view\SistemaFinanceiro.View.Splash.pas' {frmSplash},
  SistemaFinanceiro.Model.udmDados in 'src\model\SistemaFinanceiro.Model.udmDados.pas' {DataModule1: TDataModule},
  SistemaFinanceiro.View.Usuarios in 'src\view\SistemaFinanceiro.View.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Model.dmUsuarios in 'src\model\SistemaFinanceiro.Model.dmUsuarios.pas' {dmUsuarios: TDataModule},
  SistemaFinanceiro.Utilitarios in 'src\util\SistemaFinanceiro.Utilitarios.pas',
  SistemaFinanceiro.View.Login in 'src\view\SistemaFinanceiro.View.Login.pas' {frmLogin},
  SistemaFinanceiro.Model.Entidades.Usuario in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.Usuario.pas',
  SistemaFinanceiro.View.RedefinirSenha in 'src\view\SistemaFinanceiro.View.RedefinirSenha.pas' {frmRedefinirSenha},
  SistemaFinanceiro.Model.dmCaixa in 'src\model\SistemaFinanceiro.Model.dmCaixa.pas' {dmCaixa: TDataModule},
  SistemaFinanceiro.View.Caixa in 'src\view\SistemaFinanceiro.View.Caixa.pas' {frmCaixa},
  SistemaFinanceiro.View.SaldoCaixa in 'src\view\SistemaFinanceiro.View.SaldoCaixa.pas' {frmSaldoCaixa},
  SistemaFinanceiro.Model.Entidades.ResumoCaixa in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.ResumoCaixa.pas',
  SistemaFinanceiro.Model.dmCPagar in 'src\model\SistemaFinanceiro.Model.dmCPagar.pas' {dmCPagar: TDataModule},
  SistemaFinanceiro.View.CPagar in 'src\view\SistemaFinanceiro.View.CPagar.pas' {frmContasPagar},
  SistemaFinanceiro.Model.dmCReceber in 'src\model\SistemaFinanceiro.Model.dmCReceber.pas' {dmCReceber: TDataModule},
  SistemaFinanceiro.View.CReceber in 'src\view\SistemaFinanceiro.View.CReceber.pas' {frmContasReceber},
  SistemaFinanceiro.View.BaixarCP in 'src\view\SistemaFinanceiro.View.BaixarCP.pas' {frmBaixarCP},
  SistemaFinanceiro.Model.Entidades.CP in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.CP.pas',
  SistemaFinanceiro.Model.Entidades.CP.Detalhe in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.CP.Detalhe.pas',
  SistemaFinanceiro.Model.Entidades.CR in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.CR.pas',
  SistemaFinanceiro.Model.Entidades.CR.Detalhe in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.CR.Detalhe.pas',
  SistemaFinanceiro.View.BaixarCR in 'src\view\SistemaFinanceiro.View.BaixarCR.pas' {frmBaixarCR},
  SistemaFinanceiro.View.ConsultarCr in 'src\view\SistemaFinanceiro.View.ConsultarCr.pas' {frmConsultarCr};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmCaixa, dmCaixa);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCPagar, dmCPagar);
  Application.CreateForm(TfrmContasPagar, frmContasPagar);
  Application.CreateForm(TdmCReceber, dmCReceber);
  Application.CreateForm(TfrmContasReceber, frmContasReceber);
  Application.CreateForm(TfrmBaixarCP, frmBaixarCP);
  Application.CreateForm(TfrmBaixarCR, frmBaixarCR);
  Application.CreateForm(TfrmConsultarCr, frmConsultarCr);
  Application.Run;
end.
