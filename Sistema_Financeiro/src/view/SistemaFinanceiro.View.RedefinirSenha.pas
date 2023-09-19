unit SistemaFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.Model.Entidades.Usuario;
type
  TfrmRedefinirSenha = class(TForm)
    pnlLogin: TPanel;
    imgPessoa: TImage;
    imgCadeado: TImage;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    btnSalvar: TButton;
    Image1: TImage;
    lblUsuario: TLabel;
    lblRedefina: TLabel;
    lblSenha: TLabel;
    lblConfirmaSenha: TLabel;
    btnCancelar: TButton;
    ImageList1: TImageList;
    pnlBtns: TPanel;

    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FUsuario: TModelUsuario;

    procedure SetUsuario(const Value: TModelUsuario);
    procedure ValidaCampos;
    procedure EditKeyPress(Sender: TObject; var Key: Char);

    { Private declarations }
  public
    { Public declarations }

    property Usuario : TModelUsuario read FUsuario write SetUsuario;
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

{$R *.dfm}

uses

  SistemaFinanceiro.Model.dmUsuarios;


procedure TfrmRedefinirSenha.btnCancelarClick(Sender: TObject);
begin

  ModalResult := mrCancel;

end;

procedure TfrmRedefinirSenha.btnSalvarClick(Sender: TObject);
begin

  ValidaCampos;

  Usuario.Senha := Trim(edtSenha.Text);
  dmUsuarios.RedefinirSenha(Usuario);
  Application.MessageBox('Senha Alterada!', 'Sucesso', MB_OK + MB_ICONINFORMATION);

  ModalResult := mrOk;

end;

procedure TfrmRedefinirSenha.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRedefinirSenha.FormCreate(Sender: TObject);
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

procedure TfrmRedefinirSenha.FormShow(Sender: TObject);
begin

  //  Seta o nome do usuário
  lblUsuario.Caption := FUsuario.Nome;

end;

procedure TfrmRedefinirSenha.SetUsuario(const Value: TModelUsuario);
begin
  FUsuario := Value;
end;

procedure TfrmRedefinirSenha.ValidaCampos;
begin

  edtSenha.Text := Trim(edtSenha.Text);
  edtConfirmaSenha.Text := Trim(edtConfirmaSenha.Text);

  if edtSenha.Text = '' then
  begin

    Application.MessageBox('Informe a sua nova senha!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtSenha.SetFocus;

    abort;

  end;

  if edtConfirmaSenha.Text = '' then
  begin

    Application.MessageBox('Confirme a sua nova senha!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtConfirmaSenha.SetFocus;

    abort;

  end;

  if edtSenha.Text <> edtConfirmaSenha.Text then
  begin

    Application.MessageBox('Senha diferente da confirmação!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtConfirmaSenha.SetFocus;

    abort;

  end;



end;

end.
