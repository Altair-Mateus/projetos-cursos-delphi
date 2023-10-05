unit SistemaFinanceiro.View.Principal;
interface
uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, SistemaFinanceiro.View.Splash,
  SistemaFinanceiro.View.Usuarios, SistemaFinanceiro.View.Login, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, SistemaFinanceiro.View.RedefinirSenha,
  SistemaFinanceiro.View.Caixa, SistemaFinanceiro.View.SaldoCaixa,
  SistemaFinanceiro.View.CPagar,
  SistemaFinanceiro.View.CReceber, SistemaFinanceiro.View.Clientes,
  SistemaFinanceiro.View.Fornecedores, SistemaFinanceiro.View.FrPgto,
  SistemaFinanceiro.View.CadAdmin, System.IOUtils, SistemaFinanceiro.View.Ajuda,
  SistemaFinanceiro.View.FaturaCartao;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    pnlDadosGerais: TPanel;
    pnlAtalhos: TPanel;
    pnlInfos: TPanel;
    lblUserLogado: TLabel;
    Image1: TImage;
    ImageList1: TImageList;
    btnCP: TButton;
    btnCR: TButton;
    btnCaixa: TButton;
    mnuFinanceiro: TMenuItem;
    Caixa1: TMenuItem;
    SaldodoCaixa1: TMenuItem;
    ContasaPagar1: TMenuItem;
    N1: TMenuItem;
    ContasaReceber1: TMenuItem;
    pnlSaldoParcial: TPanel;
    lblSaldoParcial: TLabel;
    lblValor: TLabel;
    imgLucro: TImage;
    imgPerda: TImage;
    lblData: TLabel;
    imgNormal: TImage;
    ImageListMenu: TImageList;
    pnlCP: TPanel;
    lblCP: TLabel;
    lblValorCP: TLabel;
    Image2: TImage;
    Label3: TLabel;
    pnlCR: TPanel;
    lblCR: TLabel;
    lblValorCR: TLabel;
    Image3: TImage;
    Label4: TLabel;
    mnuClientes: TMenuItem;
    Fornecedores1: TMenuItem;
    N2: TMenuItem;
    FormasdePagamento1: TMenuItem;
    pnlBtn: TPanel;
    pnlLogo: TPanel;
    Configuraes1: TMenuItem;
    AlterarImagemPrincipal1: TMenuItem;
    OpenDialog1: TOpenDialog;
    btnFornec: TButton;
    btnClientes: TButton;
    imgLogo: TImage;
    lblNomeSistema: TLabel;
    FaturasdeCarto1: TMenuItem;
    N3: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure mnuUsuariosClick(Sender: TObject);
    procedure btnusuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure SaldodoCaixa1Click(Sender: TObject);
    procedure btnCPClick(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCRClick(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure mnuClientesClick(Sender: TObject);
    procedure btnFornecClick(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure AlterarImagemPrincipal1Click(Sender: TObject);
    procedure mnuAjudaClick(Sender: TObject);
    procedure FaturasdeCarto1Click(Sender: TObject);


  private
    { Private declarations }
    procedure ExibeTelaUsuario;
    procedure ExibeTelaCPagar;
    procedure ExibeTelaCReceber;
    procedure ExibeTelaCaixa;
    procedure ExibeTelaSaldoCaixa;
    procedure ExibeTelaClientes;
    procedure ExibeTelaFonecedores;
    procedure ExibeTelaFrPgto;
    procedure ExibeTelaAjuda;
    procedure ExibeTelaFaturaCartao;
    procedure CarregaImgPrincipal;

  public
    { Public declarations }
    procedure ResumoMensalCaixa;
    procedure TotalCP;
    procedure TotalCR;

  end;
var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.dfm}
uses
  SistemaFinanceiro.Model.dmUsuarios,
  SistemaFinanceiro.Model.dmCaixa,
  System.DateUtils,
  SistemaFinanceiro.Model.Entidades.ResumoCaixa,
  SistemaFinanceiro.Utilitarios,
  Winapi.Windows,
  SistemaFinanceiro.Model.dmCPagar,
  SistemaFinanceiro.Model.dmCReceber,
  MidasLib;

procedure TfrmPrincipal.AlterarImagemPrincipal1Click(Sender: TObject);
var
  NomeImg, DestImg : String;

begin

  //  Setando tipos de arquivos do open dialog
  OpenDialog1.Filter := 'Imagens (*.png)|*.png';

  if OpenDialog1.Execute() then
  begin

    // pega o nome da imagem
    NomeImg := OpenDialog1.FileName;

    //  Define o destino e nome padrao
    DestImg := ExtractFilePath(Application.ExeName) + 'img_logo' + ExtractFileExt(NomeImg);

    //  Copia a logo para o local onde está o exe
    try

      CopyFile(PChar(NomeImg), Pchar(DestImg), False);

      ShowMessage('Nova logo principal Configurada!')

    except
      on E: Exception do
        ShowMessage('Erro ao copiar a imagem: ' + E.Message);

    end;
 

  end;


  //  Atualiza Logo Principal
  CarregaImgPrincipal;

end;

procedure TfrmPrincipal.btnCaixaClick(Sender: TObject);
begin
  ExibeTelaCaixa;
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  ExibeTelaClientes;
end;

procedure TfrmPrincipal.btnCPClick(Sender: TObject);
begin
  ExibeTelaCPagar;
end;

procedure TfrmPrincipal.btnCRClick(Sender: TObject);
begin
  ExibeTelaCReceber;
end;

procedure TfrmPrincipal.btnFornecClick(Sender: TObject);
begin
  ExibeTelaFonecedores
end;

procedure TfrmPrincipal.btnusuariosClick(Sender: TObject);
begin
  ExibeTelaUsuario;
end;

procedure TfrmPrincipal.Caixa1Click(Sender: TObject);
begin
  ExibeTelaCaixa;
end;

procedure TfrmPrincipal.CarregaImgPrincipal;
begin

  //  Carrega a logo da tela principal
  if FileExists('img_logo.png') then
  begin
    imgLogo.Picture.LoadFromFile('img_logo.png');
  end;


  //  Mantem sempre no tamanho
  imgLogo.Width := 300;
  imgLogo.Height := 300;

end;

procedure TfrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin
  ExibeTelaCPagar;
end;

procedure TfrmPrincipal.ContasaReceber1Click(Sender: TObject);
begin
  ExibeTelaCReceber;
end;

procedure TfrmPrincipal.ExibeTelaFrPgto;
begin

  //Cria o form
  frmFrPgto := TfrmFrPgto.Create(Self);

  try

    //  Exibe o form
    frmFrPgto.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmFrPgto);

  end;


end;

procedure TfrmPrincipal.ExibeTelaAjuda;
begin

   //Cria o form
  frmAjuda := TfrmAjuda.Create(Self);

  try

    //  Exibe o form
    frmAjuda.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmAjuda);

  end;

end;

procedure TfrmPrincipal.ExibeTelaCaixa;
begin

  //Cria o form
  frmCaixa := TfrmCaixa.Create(Self);

  try

    //  Exibe o form
    frmCaixa.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCaixa);

  end;

end;

procedure TfrmPrincipal.ExibeTelaClientes;
begin

  //  Cria o Form
  frmCliente := TfrmCliente.Create(Self);

  try

    //  Exibe o Form
    frmCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCliente);

  end;

end;

procedure TfrmPrincipal.ExibeTelaCPagar;
begin

  //  Cria o Form
  frmContasPagar := TfrmContasPagar.Create(Self);

  try

    //  Exibe o Form
    frmContasPagar.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmContasPagar);

  end;
end;

procedure TfrmPrincipal.ExibeTelaCReceber;
begin

  //  Cria o Form
  frmContasReceber := TfrmContasReceber.Create(Self);

  try

    //  Exibe o Form
    frmContasReceber.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmContasReceber);

  end
end;

procedure TfrmPrincipal.ExibeTelaFaturaCartao;
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmFaturaCartao);

  end;

end;

procedure TfrmPrincipal.ExibeTelaFonecedores;
begin

  //  Cria o Form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmFornecedores);

  end;

end;

procedure TfrmPrincipal.ExibeTelaSaldoCaixa;
begin

   //  Cria o Form
  frmSaldoCaixa := TfrmSaldoCaixa.Create(Self);

  try

    //  Exibe o form
    frmSaldoCaixa.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmSaldoCaixa);

  end;
end;

procedure TfrmPrincipal.ExibeTelaUsuario;
begin

  //  Cria o Form
  frmUsuarios := TfrmUsuarios.Create(Self);

  try

    //  Exibe o Form
    frmUsuarios.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmUsuarios);
  end
end;

procedure TfrmPrincipal.FaturasdeCarto1Click(Sender: TObject);
begin
  ExibeTelaFaturaCartao;
end;

procedure TfrmPrincipal.FormasdePagamento1Click(Sender: TObject);
begin
  ExibeTelaFrPgto;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  //  Cria o Form do splash
  frmSplash := TfrmSplash.Create(Self);

  try

    //  Exibe o form
    frmSplash.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmSplash);

  end;


  if dmUsuarios.TblUsuariosVazia = True then
  begin

    //  Cria o form
    frmCadAdmin := TfrmCadAdmin.Create(Self);

    try

      //  Exibe o form
      frmCadAdmin.ShowModal;

      if frmCadAdmin.ModalResult <> mrOk then
      begin
        Application.Terminate;
      end;

    finally

      FreeAndNil(frmCadAdmin);

    end;

  end;

  //  Cria o Form do Login
  frmLogin := TfrmLogin.Create(Self);

  try

    //  Exibe o form
    frmLogin.ShowModal;

    if frmLogin.ModalResult <> mrOk then
    begin
      Application.Terminate;
    end;

  finally

    //  Libera da memoria
    FreeAndNil(frmLogin);

  end;

  if dmUsuarios.GetUsuarioLogado.Senha_Temp then
  begin

    frmRedefinirSenha := TfrmRedefinirSenha.Create(nil);

    try

      frmRedefinirSenha.Usuario := dmUsuarios.GetUsuarioLogado;
      frmRedefinirSenha.ShowModal;

      if frmRedefinirSenha.ModalResult <> mrOk then
      begin
        Application.Terminate;
      end;

    finally
      FreeAndNil(frmRedefinirSenha);
    end;
  end;

  //  Mostra o Usuario logado
  lblUserLogado.Caption := dmUsuarios.GetUsuarioLogado.Nome;

  ResumoMensalCaixa;
  TotalCP;
  TotalCR;
  KeyPreview := True;

  CarregaImgPrincipal;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if Key = VK_F5 then
  begin

    //  Atualiza os valores da tela inicial
    ResumoMensalCaixa;
    TotalCP;
    TotalCR;

  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lblUserLogado.Caption := '';
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  ExibeTelaFonecedores;
end;

procedure TfrmPrincipal.mnuAjudaClick(Sender: TObject);
begin
  ExibeTelaAjuda;
end;

procedure TfrmPrincipal.mnuClientesClick(Sender: TObject);
begin
  ExibeTelaClientes;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  ExibeTelaUsuario;
end;

procedure TfrmPrincipal.Panel1Click(Sender: TObject);
begin
  ExibeTelaUsuario;
end;

procedure TfrmPrincipal.ResumoMensalCaixa;
var
  ResumoCaixa : TModelResumoCaixa;
  DataInicial : TDateTime;
  DataFinal   : TDateTime;

begin

  DataInicial := StartOfTheMonth(Now);
  DataFinal   := EndOfTheMonth(Now);
  ResumoCaixa := dmCaixa.ResumoCaixa(DataInicial, DataFinal);
  lblValor.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoParcial);

  if ResumoCaixa.SaldoParcial > 0 then
  begin

    imgLucro.Visible  := True;
    imgPerda.Visible  := False;
    imgNormal.Visible := False;
    pnlSaldoParcial.Color :=  $006FE76E;

  end
    else if ResumoCaixa.SaldoParcial < 0 then
    begin

      imgLucro.Visible  := False;
      imgPerda.Visible  := True;
      imgNormal.Visible := False;
      pnlSaldoParcial.Color :=  $003838F7;

    end
      else
      begin

        imgLucro.Visible  := False;
        imgPerda.Visible  := False;
        imgNormal.Visible := True;
        pnlSaldoParcial.Color :=  $0000CAE6;

      end;
end;

procedure TfrmPrincipal.SaldodoCaixa1Click(Sender: TObject);
begin
  ExibeTelaSaldoCaixa;
end;

procedure TfrmPrincipal.TotalCP;
var
  DataInicial : TDateTime;
  DataFinal   : TDateTime;
begin

  DataInicial := StartOfTheMonth(Now);
  DataFinal   := EndOfTheMonth(Now);

  lblValorCP.Caption := TUtilitario.FormatoMoeda(dmCPagar.TotalCP(DataInicial, DataFinal));

end;

procedure TfrmPrincipal.TotalCR;
var
  DataInicial : TDateTime;
  DataFinal   : TDateTime;

begin

  DataInicial := StartOfTheMonth(Now);
  DataFinal   := EndOfTheMonth(Now);

  lblValorCR.Caption := TUtilitario.FormatoMoeda(dmCReceber.TotalCR(DataInicial, DataFinal));

end;

end.
