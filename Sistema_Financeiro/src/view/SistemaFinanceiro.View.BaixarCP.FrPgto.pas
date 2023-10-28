unit SistemaFinanceiro.View.BaixarCP.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.View.FrPgto, Datasnap.DBClient;

type
  TfrmFrPgtoBaixaCp = class(TForm)
    ImageList1: TImageList;
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlForma: TPanel;
    lblCodFrPgto: TLabel;
    lblValorForma: TLabel;
    lblValorTotalCr: TLabel;
    lblValorRest: TLabel;
    lblNomeFrPgto: TLabel;
    edtCodFrPgto: TEdit;
    btnPesqFrPgto: TButton;
    edtValorForma: TEdit;
    edtValorCp: TEdit;
    edtValorRest: TEdit;
    btnAdiciona: TButton;
    btnLimpar: TButton;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    dsFrPgto: TDataSource;
    cdsFrPgto: TClientDataSet;
    cdsFrPgtoID_FR: TIntegerField;
    cdsFrPgtoNOME: TWideStringField;
    cdsFrPgtoVALORPAGO: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure edtValorFormaEnter(Sender: TObject);
    procedure edtCodFrPgtoExit(Sender: TObject);
    procedure btnPesqFrPgtoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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
    procedure FrPgtoCp(Id : Integer; ValorCr : Currency);

  end;

var
  frmFrPgtoBaixaCp: TfrmFrPgtoBaixaCp;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmFrPgto,
  SistemaFinanceiro.Model.dmPgtoBxCp;

procedure TfrmFrPgtoBaixaCp.btnAdicionaClick(Sender: TObject);
var
  ValorForma : Currency;
  ValorRest  : Currency;
  ValorCp    : Currency;

begin

  //  Valida Campos
  if (not TryStrToCurr(edtValorCp.Text, ValorCp)) or (ValorCp <= 0) then
  begin
    Application.MessageBox('Valor da Conta a Pagar Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
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

  if Trim(edtCodFrPgto.Text) = '' then
  begin

    edtCodFrPgto.SetFocus;
    Application.MessageBox('Forma de Pagamento não informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if (ValorForma > ValorCp) or (ValorForma > ValorRest) then
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

procedure TfrmFrPgtoBaixaCp.btnCancelarClick(Sender: TObject);
begin
  Modalresult := mrCancel;
end;

procedure TfrmFrPgtoBaixaCp.btnConfirmarClick(Sender: TObject);
var
  Contador   : Integer;
  TotalPgtos : Currency;
  ValorCp    : Currency;

begin

  TotalPgtos := 0;
  Contador   := 0;

  //  Valida valor CR
  if (not TryStrToCurr(edtValorCp.Text, ValorCp)) or (ValorCp <= 0) then
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

  //  Soma o total das formas de pagamento
  while not cdsFrPgto.Eof do
  begin

    TotalPgtos := TotalPgtos + cdsFrPgto.FieldByName('VALORPAGO').AsCurrency;

    cdsFrPgto.Next;

  end;

  //  Compara o valor total e o valor da conta
  if TotalPgtos < ValorCp then
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

    if dmPgtoBxCp.cdsPgtoBxCp.State in [dsBrowse, dsInactive] then
    begin
      dmPgtoBxCp.cdsPgtoBxCp.Insert;
    end;

    dmPgtoBxCp.GeraCodigo;
    dmPgtoBxCp.cdsPgtoBxCpID_CP.AsInteger       := FId;
    dmPgtoBxCp.cdsPgtoBxCpID_FR_PGTO.AsInteger  := cdsFrPgtoID_FR.AsInteger;
    dmPgtoBxCp.cdsPgtoBxCpNR_FR.AsInteger       := Contador;
    dmPgtoBxCp.cdsPgtoBxCpDATA_HORA.AsDateTime  := Now;
    dmPgtoBxCp.cdsPgtoBxCpVALOR_PAGO.AsCurrency := cdsFrPgtoVALORPAGO.AsCurrency;

    //  Gravando no banco
    dmPgtoBxCp.cdsPgtoBxCp.Post;
    dmPgtoBxCp.cdsPgtoBxCp.ApplyUpdates(0);

    cdsFrPgto.Next;

  end;

  //  Fecha a tela
  ModalResult := mrOk;

end;

procedure TfrmFrPgtoBaixaCp.btnLimparClick(Sender: TObject);
begin

  cdsFrPgto.EmptyDataSet;

  //  Reinicia o valor restante
  edtValorRest.Text := Trim(edtValorCp.Text);

  //  Limpa os campos
  edtCodFrPgto.Clear;
  edtValorForma.Clear;
  lblNomeFrPgto.Caption := '';

  edtCodFrPgto.SetFocus;

end;

procedure TfrmFrPgtoBaixaCp.btnPesqFrPgtoClick(Sender: TObject);
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

  edtCodFrPgto.SetFocus;

end;

procedure TfrmFrPgtoBaixaCp.BuscaNomeFrPgto;
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

procedure TfrmFrPgtoBaixaCp.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFrPgtoBaixaCp.edtCodFrPgtoExit(Sender: TObject);
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

procedure TfrmFrPgtoBaixaCp.edtValorFormaEnter(Sender: TObject);
begin
  //  Assume previamente o valor total da Cp
  edtValorForma.Text := edtValorRest.Text;
end;

procedure TfrmFrPgtoBaixaCp.FormCreate(Sender: TObject);
begin

  //  Coloca no KeyPress a formatação para valores
  edtValorCp.OnKeyPress    := KeyPressValor;
  edtValorRest.OnKeyPress  := KeyPressValor;
  edtValorForma.OnKeyPress := KeyPressValor;

  edtCodFrPgto.OnKeyPress := EditKeyPress;

end;

procedure TfrmFrPgtoBaixaCp.FormShow(Sender: TObject);
begin
  edtCodFrPgto.SetFocus;
end;

procedure TfrmFrPgtoBaixaCp.FrPgtoCp(Id: Integer; ValorCr: Currency);
begin

  FID := Id;

  //  Valida ID do CP
  if FID < 0 then
  begin
    raise Exception.Create('ID do contas a Pagar Inválido!');
  end;

  if ValorCr <= 0 then
  begin
    raise Exception.Create('Valor da Conta a Pagar Inválido!');
  end;

  // Puxa o valor da Cp
  edtValorCp.Text   := CurrToStr(ValorCr);
  edtValorRest.Text := CurrToStr(ValorCr);

  edtValorForma.Clear;

end;

procedure TfrmFrPgtoBaixaCp.KeyPressValor(Sender: TObject; var Key: Char);
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
