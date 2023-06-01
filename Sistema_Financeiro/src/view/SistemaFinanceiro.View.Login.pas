unit SistemaFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    pnlLogin: TPanel;
    imgLogo: TImage;
    lblBemVindo: TLabel;
    lblLado: TLabel;
    imgPessoa: TImage;
    EditLogin: TEdit;
    imgIniciando: TImage;
    imgLogin: TImage;
    imgCadeado: TImage;
    EditSenha: TEdit;
    btnEntrar: TButton;
    ImageList1: TImageList;
    imgSair: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses

  SistemaFinanceiro.Model.dmUsuarios;

{ TfrmLogin }

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin

  ValidaCampos;

  try

    DataModuleUsuarios.EfetuaLogin(Trim(EditLogin.Text), Trim(EditSenha.Text));
    ModalResult := mrOk;

  except

    on Erro: Exception do
    begin

      Application.MessageBox(PwideChar(Erro.Message),  'Atenção', MB_OK + MB_ICONEXCLAMATION);
      EditLogin.SetFocus;

    end;

  end;

end;

procedure TfrmLogin.imgSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.ValidaCampos;
begin

  if Trim(EditLogin.Text) = '' then
  begin

    Application.MessageBox('Campo Login não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    EditLogin.SetFocus;

    abort;

  end;

  if Trim(EditSenha.Text) = '' then
  begin

    Application.MessageBox('Campo Senha não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    EditSenha.SetFocus;

    abort;

  end;



end;

end.
