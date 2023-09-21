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
    lblAviso: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
    procedure EditKeyPress(Sender: TObject; var Key: Char);

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
    Usuario.Login      := 'admin';
    Usuario.Senha      := Trim(edtSenha.Text);
    Usuario.Senha_Temp := false;
    Usuario.Admin      := True;

    dmUsuarios.CadastrarUsuario(Usuario);

  finally

    Usuario.Free;

  end;

  Application.MessageBox('Administrador Cadastrado com Sucesso', 'Sucesso', MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;

end;

procedure TfrmCadAdmin.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCadAdmin.FormCreate(Sender: TObject);
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
