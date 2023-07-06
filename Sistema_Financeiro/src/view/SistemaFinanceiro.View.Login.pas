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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaCampos;
    procedure EditKeyPress(Sender: TObject; var Key: Char);

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

procedure TfrmLogin.EditKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    //  Verifica se a tecla pressionada é o Enter

    //  Cancela o efeito do enter
    Key := #0;

    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  I : Integer;

begin

  //  Percorre os componentes TEdit
  for I := 0 to ComponentCount - 1 do
  begin

    if Components[I] is TEdit then
    begin

      //  Cria o evento OnKeyPress para cada Edit encontrado
      TEdit(Components[I]).OnKeyPress := EditKeyPress;

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
