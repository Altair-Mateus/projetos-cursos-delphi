unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, SistemaFinanceiro.View.Splash,
  SistemaFinanceiro.View.Usuarios, SistemaFinanceiro.View.Login, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, SistemaFinanceiro.View.RedefinirSenha,
  SistemaFinanceiro.View.Caixa, SistemaFinanceiro.View.SaldoCaixa,
  SistemaFinanceiro.View.CPagar;

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
    btnusuarios: TButton;
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
  private
    { Private declarations }
    procedure ExibeTelaUsuario;
    procedure ExibeTelaCPagar;
    procedure ExibeTelaCReceber;
    procedure ExibeTelaCaixa;
    procedure ExibeTelaSaldoCaixa;


  public
    { Public declarations }
    procedure ResumoMensalCaixa;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses

  SistemaFinanceiro.Model.dmUsuarios,
  SistemaFinanceiro.Model.dmCaixa,
  System.DateUtils, SistemaFinanceiro.Model.Entidades.ResumoCaixa,
  SistemaFinanceiro.Utilitarios;

procedure TfrmPrincipal.btnCaixaClick(Sender: TObject);
begin

  ExibeTelaCaixa;

end;

procedure TfrmPrincipal.btnCPClick(Sender: TObject);
begin

  ExibeTelaCPagar;

end;

procedure TfrmPrincipal.btnusuariosClick(Sender: TObject);
begin

  ExibeTelaUsuario;

end;

procedure TfrmPrincipal.Caixa1Click(Sender: TObject);
begin

  ExibeTelaCaixa;

end;

procedure TfrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin

  ExibeTelaCPagar;

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
  lblUserLogado.Caption := dmUsuarios.GetUsuarioLogado.NomeUsuarioLogado;


  ResumoMensalCaixa;

  KeyPreview := True;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F5 then
  begin

    //  Atualiza os valores da tela inicial
    ResumoMensalCaixa;

  end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  lblUserLogado.Caption := '';

end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
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

  if ResumoCaixa.SaldoParcial >= 0 then
  begin

    imgLucro.Visible := True;
    imgPerda.Visible := False;
    pnlSaldoParcial.Color :=  $006FE76E;

  end
    else
    begin

      imgLucro.Visible := False;
      imgPerda.Visible := True;
      pnlSaldoParcial.Color :=  $003838F7;

    end;

end;

procedure TfrmPrincipal.SaldodoCaixa1Click(Sender: TObject);
begin

  ExibeTelaSaldoCaixa;

end;

end.
