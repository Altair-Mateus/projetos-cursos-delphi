program prjSistemaVendas;

uses
  Vcl.Forms,
  fMain in 'Forms\fMain.pas' {frmMain},
  uDmDados in 'Forms\uDmDados.pas' {dmDados: TDataModule},
  uBiblioteca in 'Classes\uBiblioteca.pas',
  fConfigBanco in 'Forms\fConfigBanco.pas' {frmConfigBanco},
  fCadastroPai in 'Forms\fCadastroPai.pas' {frmCadastroPai},
  fCadastroCliente in 'Forms\fCadastroCliente.pas' {frmCadastroCliente},
  fCadastroProduto in 'Forms\fCadastroProduto.pas' {frmCadastroProdutos},
  fPesquisarPai in 'Forms\fPesquisarPai.pas' {frmPesquisarPai},
  fPesquisarCliente in 'Forms\fPesquisarCliente.pas' {frmPesquisarClientes},
  fPesquisarProdutos in 'Forms\fPesquisarProdutos.pas' {frmPesquisarProdutos},
  fCadastroVenda in 'Forms\fCadastroVenda.pas' {frmCadastroVenda},
  fPesquisarVenda in 'Forms\fPesquisarVenda.pas' {frmPesquisarVenda},
  fItensVenda in 'Forms\fItensVenda.pas' {frmItensVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfigBanco, frmConfigBanco);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPesquisarVenda, frmPesquisarVenda);
  Application.CreateForm(TfrmItensVenda, frmItensVenda);
  Application.Run;
end.
