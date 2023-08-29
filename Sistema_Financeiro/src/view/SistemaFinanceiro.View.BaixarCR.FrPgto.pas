unit SistemaFinanceiro.View.BaixarCR.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList, Datasnap.DBClient,
  SistemaFinanceiro.View.FrPgto;

type
  TfrmFrPgtoBaixaCr = class(TForm)
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    ImageList1: TImageList;
    pnlForma: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    dsFrPgto: TDataSource;
    cdsFrPgto: TClientDataSet;
    lblCodFrPgto: TLabel;
    edtCodFrPgto: TEdit;
    btnPesqFrPgto: TButton;
    edtValorForma: TEdit;
    lblValorForma: TLabel;
    lblValorTotalCr: TLabel;
    edtValorCr: TEdit;
    edtValorRest: TEdit;
    lblValorRest: TLabel;
    cdsFrPgtoNome: TWideStringField;
    cdsFrPgtovalorpago: TCurrencyField;
    btnAdiciona: TButton;
    btnLimpar: TButton;
    cdsFrPgtoid_fr: TIntegerField;
    lblNomeFrPgto: TLabel;
    procedure btnPesqFrPgtoClick(Sender: TObject);
    procedure edtValorFormaEnter(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure edtCodFrPgtoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FId : Integer;
    procedure BuscaNomeFrPgto;
    procedure KeyPressValor(Sender: TObject; var Key: Char);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

  public
    { Public declarations }
    procedure FrPgtoCr(Id : Integer; ValorCr : Currency);

  end;

var
  frmFrPgtoBaixaCr: TfrmFrPgtoBaixaCr;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.Entidades.CR, SistemaFinanceiro.Model.dmCReceber,
  SistemaFinanceiro.Model.dmFrPgto, SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.Model.dmPgtoBxCr;

procedure TfrmFrPgtoBaixaCr.btnAdicionaClick(Sender: TObject);
var
  ValorForma : Currency;
  ValorRest  : Currency;
  ValorCr    : Currency;

begin

  //  Valida Campos
  if (not TryStrToCurr(edtValorCr.Text, ValorCr)) or (ValorCr <= 0) then
  begin
    Application.MessageBox('Valor da Conta a Receber Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToCurr(edtValorRest.Text, ValorRest) then
  begin
    Application.MessageBox('Valor Restante Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if (not TryStrToCurr(edtValorForma.Text, ValorForma)) or (ValorForma <= 0) then
  begin
    edtValorForma.SetFocus;
    Application.MessageBox('Valor da Forma Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if (ValorForma > ValorCr) or (ValorForma > ValorRest) then
  begin

    edtValorForma.Clear;
    edtValorForma.SetFocus;
    Application.MessageBox('Valor da Forma não pode ser maior que o valor da conta!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;



  //  Calculando o valor restante
  ValorRest         := ValorRest - ValorForma;
  edtValorRest.Text := CurrToStr(ValorRest);

  //  Coloca o dataset em modo de inserção
  cdsFrPgto.Insert;

  //  Alimenta as colunas
  cdsFrPgtoid_fr.AsString       := Trim(edtCodFrPgto.Text);
  cdsFrPgtoNome.AsString        := lblNomeFrPgto.Caption;
  cdsFrPgtovalorpago.AsCurrency := ValorForma;

  // Salva no data set
  cdsFrPgto.Post;


  edtValorForma.Clear;
  edtCodFrPgto.Clear;
  edtCodFrPgto.SetFocus;
  lblNomeFrPgto.Caption:= '';

  if ValorRest = 0 then
  begin
    btnConfirmar.SetFocus;
  end;

end;

procedure TfrmFrPgtoBaixaCr.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFrPgtoBaixaCr.btnConfirmarClick(Sender: TObject);
var
  Contador   : Integer;
  TotalPgtos : Currency;
  ValorCr    : Currency;

begin

  TotalPgtos := 0;
  Contador   := 0;

  //  Valida valor CR
  if (not TryStrToCurr(edtValorCr.Text, ValorCr)) or (ValorCr <= 0) then
  begin
    Application.MessageBox('Valor da Conta a Receber Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if cdsFrPgto.IsEmpty then
  begin

    Application.MessageBox('Nenhuma forma de pagamento informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  // Coloca na primeira posição do dataset
  cdsFrPgto.First;

  //  Soma o valor de todas as formas de pagamento
  while not cdsFrPgto.Eof do
  begin

    TotalPgtos := TotalPgtos + cdsFrPgto.FieldByName('VALORPAGO').AsCurrency;

    //  Avança para o proximo
    cdsFrPgto.Next;

  end;

  //  Compara com o valor total do CR
  if TotalPgtos < ValorCr then
  begin

    Application.MessageBox('Valor das formas de pagamento menor que o valor da conta!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;



  // Coloca na primeira posição do dataset
  cdsFrPgto.First;

  //  Gravando as formas de pagamento
  while not cdsFrPgto.Eof do
  begin

    Contador := Contador + 1;

    if dmPgtoBxCr.cdsPgtoBxCr.State in [dsBrowse, dsInactive] then
    begin
      dmPgtoBxCr.cdsPgtoBxCr.Insert;
    end;

    dmPgtoBxCr.GeraCodigo;
    dmPgtoBxCr.cdsPgtoBxCrID_CR.AsInteger       := FId;
    dmPgtoBxCr.cdsPgtoBxCrID_FR_PGTO.AsInteger  := cdsFrPgtoid_fr.AsInteger;
    dmPgtoBxCr.cdsPgtoBxCrNR_FR.AsInteger       := Contador;
    dmPgtoBxCr.cdsPgtoBxCrDATA_HORA.AsDateTime  := Now;
    dmPgtoBxCr.cdsPgtoBxCrVALOR_PAGO.AsCurrency := cdsFrPgtovalorpago.AsCurrency;

    //  Gravando no banco
    dmPgtoBxCr.cdsPgtoBxCr.Post;
    dmPgtoBxCr.cdsPgtoBxCr.ApplyUpdates(0);

    cdsFrPgto.Next;

  end;

  //  Fecha a tela
  ModalResult := mrOk;

end;

procedure TfrmFrPgtoBaixaCr.btnLimparClick(Sender: TObject);
begin

  cdsFrPgto.EmptyDataSet;

  //  Reinicia o valor restante
  edtValorRest.Text := Trim(edtValorCr.Text);

  //  Limpa os campos
  edtCodFrPgto.Clear;
  edtValorForma.Clear;
  lblNomeFrPgto.Caption := '';

  edtCodFrPgto.SetFocus;

end;

procedure TfrmFrPgtoBaixaCr.btnPesqFrPgtoClick(Sender: TObject);
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

end;

procedure TfrmFrPgtoBaixaCr.BuscaNomeFrPgto;
var
  NomeFrPgto : String;

begin

  if Trim(edtCodFrPgto.Text) <> '' then
  begin

    NomeFrPgto := dmFrPgto.GetNomeFrPgto(Trim(edtCodFrPgto.Text));

    if NomeFrPgto = '' then
    begin

      Application.MessageBox('Forma de Pagamento não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFrPgto.SetFocus;
      edtCodFrPgto.Clear;

    end;

    lblNomeFrPgto.Visible := True;
    lblNomeFrPgto.Caption := NomeFrPgto;

  end;

end;

procedure TfrmFrPgtoBaixaCr.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFrPgtoBaixaCr.edtCodFrPgtoExit(Sender: TObject);
begin
  BuscaNomeFrPgto;
end;

procedure TfrmFrPgtoBaixaCr.edtValorFormaEnter(Sender: TObject);
begin

  //  Assume previamente o valor total da CR
  edtValorForma.Text := edtValorRest.Text;

end;

procedure TfrmFrPgtoBaixaCr.FormCreate(Sender: TObject);
begin

  //  Coloca no KeyPress a formatação para valores
  edtValorCr.OnKeyPress    := KeyPressValor;
  edtValorRest.OnKeyPress  := KeyPressValor;
  edtValorForma.OnKeyPress := KeyPressValor;

  edtCodFrPgto.OnKeyPress := EditKeyPress;

end;

procedure TfrmFrPgtoBaixaCr.FormShow(Sender: TObject);
begin
  edtCodFrPgto.SetFocus;
end;

procedure TfrmFrPgtoBaixaCr.FrPgtoCr(Id: Integer; ValorCr : Currency);
begin

  FID := Id;

  //  Valida ID do CR
  if FID < 0 then
  begin
    raise Exception.Create('ID do contas a receber Inválido!');
  end;

  if ValorCr <= 0 then
  begin
    raise Exception.Create('Valor da Conta a Receber Inválido!');
  end;

  // Puxa o valor da CR
  edtValorCr.Text   := CurrToStr(ValorCr);
  edtValorRest.Text := CurrToStr(ValorCr);

  edtValorForma.Clear;

end;

procedure TfrmFrPgtoBaixaCr.KeyPressValor(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada é o Enter
    //  Cancela o efeito do enter
    Key := #0;
    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  //  Se for digitado um ponto, será convertido para virgula
  if Key = FormatSettings.ThousandSeparator then
   begin
      Key := #0;
    end;

  // Permite apenas digitar os caracteres dentro do charinset
  if not (CharInSet(Key, ['0'..'9', FormatSettings.DecimalSeparator, #8, #13])) then
  begin
    Key := #0;
  end;

  // Valida se já existe o ponto decimal
  if (Key = FormatSettings.DecimalSeparator) and (pos(Key, TEdit(Sender).Text) > 0) then
  begin
    Key := #0;
  end;

end;

end.
