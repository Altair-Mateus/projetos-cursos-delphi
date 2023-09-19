unit SistemaFinanceiro.View.CadAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.Model.Entidades.Usuario;

type
  TfrmCadAdmin = class(TForm)
    pnlLogin: TPanel;
    imgPessoa: TImage;
    imgCadeado: TImage;
    Image1: TImage;
    lbladmin: TLabel;
    lblRedefina: TLabel;
    lblSenha: TLabel;
    lblConfirmaSenha: TLabel;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    pnlBtns: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    ImageList1: TImageList;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
  public
    { Public declarations }
  end;

var
  frmCadAdmin: TfrmCadAdmin;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmUsuarios;

procedure TfrmCadAdmin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadAdmin.btnSalvarClick(Sender: TObject);
var
  Usuario : TModelUsuario;

begin

  ValidaCampos;

  Usuario := TModelUsuario.Create;

  try

    Usuario.Nome       := 'Administrador';
    Usuario.Login      := 'Admin';
    Usuario.Senha      := Trim(edtSenha.Text);
    Usuario.Senha_Temp := false;

    dmUsuarios.CadastrarUsuario(Usuario);

  finally

    Usuario.Free;

  end;

  Application.MessageBox('Administrador Cadastrado com Sucesso', 'Sucesso', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;

end;

procedure TfrmCadAdmin.ValidaCampos;
begin

  edtSenha.Text         := Trim(edtSenha.Text);
  edtConfirmaSenha.Text := Trim(edtConfirmaSenha.Text);

  if edtSenha.Text = '' then
  begin

    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua nova senha!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;

  if edtConfirmaSenha.Text = '' then
  begin

    edtConfirmaSenha.SetFocus;
    Application.MessageBox('Confirme a sua nova senha!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;

  if edtSenha.Text <> edtConfirmaSenha.Text then
  begin

    edtConfirmaSenha.SetFocus;
    Application.MessageBox('Senha diferente da confirmação!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;
end;

end.
