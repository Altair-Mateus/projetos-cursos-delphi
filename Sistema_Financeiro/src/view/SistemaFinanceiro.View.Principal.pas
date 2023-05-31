unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, SistemaFinanceiro.View.Splash,
  SistemaFinanceiro.View.Usuarios, SistemaFinanceiro.View.Login, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

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
    procedure FormCreate(Sender: TObject);
    procedure mnuUsuariosClick(Sender: TObject);
    procedure btnusuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmUsuarios;

procedure TfrmPrincipal.btnusuariosClick(Sender: TObject);
begin
  //  Cria o Form
  frmUsuarios := TfrmUsuarios.Create(Self);

  try

    //  Exibe o Form
    frmUsuarios.ShowModal;


  finally

    //  Libera da memoria
    FreeAndNil(frmUsuarios);

  end;
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

  //  Cria o Form do splash
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

  //  Mostra o Usuario logado
  lblUserLogado.Caption := DataModuleUsuarios.GetUsuarioLogado.IdUsuarioLogado +
  ' - ' + DataModuleUsuarios.GetUsuarioLogado.NomeUsuarioLogado;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin

  //  Cria o Form
  frmUsuarios := TfrmUsuarios.Create(Self);

  try

    //  Exibe o Form
    frmUsuarios.ShowModal;


  finally

    //  Libera da memoria
    FreeAndNil(frmUsuarios);

  end;
end;

end.
