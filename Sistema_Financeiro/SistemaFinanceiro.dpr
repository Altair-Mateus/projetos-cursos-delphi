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
  SistemaFinanceiro.View.CrDetalhe in 'src\view\SistemaFinanceiro.View.CrDetalhe.pas' {frmCrDetalhe},
  SistemaFinanceiro.View.CpDetalhe in 'src\view\SistemaFinanceiro.View.CpDetalhe.pas' {frmCpDetalhe},
  SistemaFinanceiro.Model.Entidades.LancamentoCaixa in 'src\model\Entidades\SistemaFinanceiro.Model.Entidades.LancamentoCaixa.pas',
  SistemaFinanceiro.View.RelatoriosPadrao in 'src\view\Relatorios\SistemaFinanceiro.View.RelatoriosPadrao.pas' {frmRelatorioPadrao},
  SistemaFinanceiro.View.Relatorios.Usuarios in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Usuarios.pas' {frmRelUsuarios},
  SistemaFinanceiro.View.Relatorios.Cr in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Cr.pas' {frmRelCr},
  SistemaFinanceiro.View.Relatorios.Cp in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Cp.pas' {frmRelCp},
  SistemaFinanceiro.View.Relatorios.Caixa in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Caixa.pas' {frmRelCaixa},
  SistemaFinanceiro.View.Clientes in 'src\view\SistemaFinanceiro.View.Clientes.pas' {frmCliente},
  SistemaFinanceiro.Model.dmClientes in 'src\model\SistemaFinanceiro.Model.dmClientes.pas' {dmClientes: TDataModule},
  SistemaFinanceiro.View.Relatorios.Clientes in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Clientes.pas' {frmRelClientes},
  SistemaFinanceiro.Model.dmFornecedores in 'src\model\SistemaFinanceiro.Model.dmFornecedores.pas' {dmFornecedores: TDataModule},
  SistemaFinanceiro.View.Fornecedores in 'src\view\SistemaFinanceiro.View.Fornecedores.pas' {frmFornecedores},
  SistemaFinanceiro.View.Relatorios.Fornecedores in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.Fornecedores.pas' {frmRelFornecedores},
  SistemaFinanceiro.Model.dmFrPgto in 'src\model\SistemaFinanceiro.Model.dmFrPgto.pas' {dmFrPgto: TDataModule},
  SistemaFinanceiro.View.FrPgto in 'src\view\SistemaFinanceiro.View.FrPgto.pas' {frmFrPgto},
  SistemaFinanceiro.View.Relatorios.FrPgto in 'src\view\Relatorios\SistemaFinanceiro.View.Relatorios.FrPgto.pas' {frmRelFrPgto},
  SistemaFinanceiro.View.BaixarCR.FrPgto in 'src\view\SistemaFinanceiro.View.BaixarCR.FrPgto.pas' {frmFrPgtoBaixaCr},
  SistemaFinanceiro.Model.dmPgtoBxCr in 'src\model\SistemaFinanceiro.Model.dmPgtoBxCr.pas' {dmPgtoBxCr: TDataModule},
  SistemaFinanceiro.Model.dmPgtoBxCp in 'src\model\SistemaFinanceiro.Model.dmPgtoBxCp.pas' {dmPgtoBxCp: TDataModule},
  SistemaFinanceiro.View.BaixarCP.FrPgto in 'src\view\SistemaFinanceiro.View.BaixarCP.FrPgto.pas' {frmFrPgtoBaixaCp},
  SistemaFinanceiro.View.CadAdmin in 'src\view\SistemaFinanceiro.View.CadAdmin.pas' {frmCadAdmin},
  SistemaFinanceiro.View.Ajuda in 'src\view\SistemaFinanceiro.View.Ajuda.pas' {frmAjuda};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmCaixa, dmCaixa);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCPagar, dmCPagar);
  Application.CreateForm(TdmCReceber, dmCReceber);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmFornecedores, dmFornecedores);
  Application.CreateForm(TdmFrPgto, dmFrPgto);
  Application.CreateForm(TdmPgtoBxCr, dmPgtoBxCr);
  Application.CreateForm(TdmPgtoBxCp, dmPgtoBxCp);
  Application.Run;
end.
