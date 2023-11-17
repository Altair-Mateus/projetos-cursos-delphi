unit SistemaFinanceiro.View.BxMultiCP.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.FrPgto;

type
  TfrmFrPgtoBxMultCp = class(TForm)
    pnlFrPgto: TPanel;
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    ImageList1: TImageList;
    edtCodFrPgto: TEdit;
    btnPesqFrPgto: TButton;
    lblNomeFrPgto: TLabel;
    lblInfFrPgto: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnPesqFrPgtoClick(Sender: TObject);
    procedure edtCodFrPgtoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCodFrPgto: Integer;
    procedure BuscaNomeFrPgto;
    procedure EditKeyPress(Sender: TObject; var Key: Char);

    { Private declarations }


  public
    { Public declarations }
    property CodFrPgto : Integer read FCodFrPgto;

  end;

var
  frmFrPgtoBxMultCp: TfrmFrPgtoBxMultCp;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFrPgto;

{ TfrmFrPgtoBxMultCp }



procedure TfrmFrPgtoBxMultCp.btnCancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmFrPgtoBxMultCp.btnConfirmarClick(Sender: TObject);
begin

  if not TryStrToInt(edtCodFrPgto.Text, FCodFrPgto) then
  begin

    Application.MessageBox('Forma de Pagamento não informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
    edtCodFrPgto.SetFocus;
  
  end;
  

  ModalResult := mrOk;

end;

procedure TfrmFrPgtoBxMultCp.btnPesqFrPgtoClick(Sender: TObject);
begin

   //  Cria o form
  frmFrPgto := TfrmFrPgto.Create(Self);

  try

    //  Exibe o form
    frmFrPgto.ShowModal;

  finally

    //  Pega a ID da forma de pgto selecionado
    edtCodFrPgto.Text := frmFrPgto.DataSourceFrPgto.DataSet.FieldByName('ID_FR').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFrPgto);

  end;

  btnConfirmar.SetFocus;

end;

procedure TfrmFrPgtoBxMultCp.BuscaNomeFrPgto;
var
  NomeFrPgto : String;

begin

  if Trim(edtCodFrPgto.Text) <> '' then
  begin

    NomeFrPgto := dmFrPgto.GetNomeFrPgto(Trim(edtCodFrPgto.Text));

    if (Trim(edtCodFrPgto.Text) = '') or (NomeFrPgto = '') then
    begin

      Application.MessageBox('Forma de Pagamento não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFrPgto.SetFocus;
      edtCodFrPgto.Clear;

    end;

    lblNomeFrPgto.Visible := True;
    lblNomeFrPgto.Caption := NomeFrPgto;

  end;

end;

procedure TfrmFrPgtoBxMultCp.edtCodFrPgtoExit(Sender: TObject);
begin

  BuscaNomeFrPgto;

  if Trim(edtCodFrPgto.Text) <> '' then
  begin
    if dmFrPgto.GetStatus(Trim(edtCodFrPgto.Text)) = False then
    begin

      edtCodFrPgto.Clear;
      edtCodFrPgto.SetFocus;
      lblNomeFrPgto.Caption := '';
      Application.MessageBox('Forma de Pagamento não está Ativa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;
  end;

end;

procedure TfrmFrPgtoBxMultCp.FormCreate(Sender: TObject);
begin
  edtCodFrPgto.OnKeyPress := EditKeyPress;
end;

procedure TfrmFrPgtoBxMultCp.EditKeyPress(Sender: TObject; var Key: Char);
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

end.
