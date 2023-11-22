unit SistemaFinanceiro.View.BxMultiCP.InfosBx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.FrPgto,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmInfoBxMultCp = class(TForm)
    pnlGeral: TPanel;
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    ImageList1: TImageList;
    edtCodFrPgto: TEdit;
    btnPesqFrPgto: TButton;
    pnlInfos: TPanel;
    pnlImgInfos: TPanel;
    Image1: TImage;
    pnlFrPgto: TPanel;
    pnlImgFrPgto: TPanel;
    imgPgto: TImage;
    lblNomeFrPgto: TLabel;
    Label1: TLabel;
    datePgto: TDateTimePicker;
    lblValor: TLabel;
    edtValor: TEdit;
    checkDesconto: TCheckBox;
    lblDesconto: TLabel;
    edtPorcDesc: TEdit;
    lblValorDesc: TLabel;
    edtValorDesc: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnPesqFrPgtoClick(Sender: TObject);
    procedure edtCodFrPgtoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure checkDescontoClick(Sender: TObject);
    procedure edtPorcDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPorcDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FCodFrPgto: Integer;
    FValorDesc: Currency;
    FDataPgto: TDate;
    FValorPago: Currency;
    FValorCpSel: Currency;
    FDtCpMaisAnt: TDate;

    procedure BuscaNomeFrPgto;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPressValor(Sender: TObject; var Key: Char);
    function CalcValorDesc : Currency;
    function CalcPorcentDesc : Currency;
    procedure SetValorPago(const Value: Currency);
    procedure SetDtCpMaisAnt(const Value: TDate);

  public
    { Public declarations }
    property CodFrPgto   : Integer  read FCodFrPgto;
    property ValorPago   : Currency read FValorPago write SetValorPago;
    property ValorDesc   : Currency read FValorDesc;
    property DataPgto    : TDate    read FDataPgto;
    property DtCpMaisAnt : TDate read FDtCpMaisAnt write SetDtCpMaisAnt;

  end;

var
  frmInfoBxMultCp: TfrmInfoBxMultCp;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFrPgto, SistemaFinanceiro.Utilitarios;

{ TfrmFrPgtoBxMultCp }



procedure TfrmInfoBxMultCp.btnCancelarClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmInfoBxMultCp.btnConfirmarClick(Sender: TObject);
begin

  //  Validaçoes
  if not TryStrToInt(edtCodFrPgto.Text, FCodFrPgto) then
  begin

    Application.MessageBox('Forma de Pagamento não informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
    edtCodFrPgto.SetFocus;
  
  end;

  if (not TryStrToCurr(edtValor.Text, FValorPago)) or (FValorPago <= 0)  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;


  if FValorPago > FValorCpSel then
  begin

    edtValor.SetFocus;
    Application.MessageBox('Valor pago não pode ser maior que o valor das parcelas!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

    edtValor.Text := CurrToStr(FValorPago);

  end;

  if checkDesconto.Checked then
  begin

    if (not TryStrToCurr(edtValorDesc.Text, FValorDesc)) or (FValorDesc > FValorCpSel) then
    begin

      edtValorDesc.SetFocus;
      Application.MessageBox('Valor de desconto inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;

    end;

  end;

  if datePgto.Date < FDtCpMaisAnt then
  begin

    datePgto.SetFocus;
    Application.MessageBox('A data de pagamento não pode ser menor que a data da compra!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;

  ModalResult := mrOk;

end;

procedure TfrmInfoBxMultCp.btnPesqFrPgtoClick(Sender: TObject);
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

procedure TfrmInfoBxMultCp.BuscaNomeFrPgto;
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

function TfrmInfoBxMultCp.CalcPorcentDesc: Currency;
var
  ValorFinal : Currency;
  PorcentDesc : Currency;
  ValorDesc : Currency;
  ValorCp : Currency;

begin

  ValorCp     := FValorCpSel;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;
  Result      := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if PorcentDesc > 0 then
    begin

      //  Calcula o valor do desconto
      ValorDesc := (PorcentDesc / 100) * ValorCp;

      //  Atribui o valor do desconto ao campo
      edtValorDesc.Text := CurrToStr(ValorDesc);

      //  Calcula o valor final
      ValorFinal := ValorCp - ValorDesc;

      //  retorna o valor final
      Result := ValorFinal;

    end;


end;

function TfrmInfoBxMultCp.CalcValorDesc: Currency;
var
  ValorCp     : Currency;
  ValorDesc   : Currency;
  ValorFinal : Currency;
  PorcentDesc : Currency;

begin

  Result := 0;

  ValorCp     := FValorCpSel;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if ValorDesc > 0 then
  begin

    //  Calcula a porcentagem de desconto
    PorcentDesc := (ValorDesc / ValorCp) * 100;

    //  Atribui a porcentagem no campo
    edtPorcDesc.Text := CurrToStr(PorcentDesc);

    //  Calcula o valor final
    ValorFinal := ValorCp - ValorDesc;

    //  retorna o valor final
    Result := ValorFinal;

  end;

end;

procedure TfrmInfoBxMultCp.checkDescontoClick(Sender: TObject);
begin

  if checkDesconto.Checked then
  begin

    //  Libera e mostra os campos do desconto
    edtValorDesc.Enabled := True;
    edtValorDesc.Visible := True;
    edtPorcDesc.Visible  := True;
    edtPorcDesc.Enabled  := True;
    lblDesconto.Visible  := True;
    lblValorDesc.Visible := True;

  end
  else
  begin

    //  Bloqueia e oculta os campos do desconto
    edtValorDesc.Enabled := False;
    edtValorDesc.Visible := False;
    edtPorcDesc.Visible  := False;
    edtPorcDesc.Enabled  := False;
    lblDesconto.Visible  := False;
    lblValorDesc.Visible := False;


  end;
end;

procedure TfrmInfoBxMultCp.edtCodFrPgtoExit(Sender: TObject);
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

procedure TfrmInfoBxMultCp.edtPorcDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmInfoBxMultCp.edtPorcDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmInfoBxMultCp.edtValorDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmInfoBxMultCp.edtValorDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmInfoBxMultCp.edtValorExit(Sender: TObject);
begin
  edtValor.Text := TUtilitario.FormatarValor(Trim(edtValor.Text));
end;

procedure TfrmInfoBxMultCp.FormCreate(Sender: TObject);
begin

  datePgto.Date := Now;

  //  Coloca no KeyPress o enter para ir para o proximo campo
  datePgto.OnKeyPress      := EditKeyPress;
  edtValor.OnKeyPress      := KeyPressValor;
  edtValorDesc.OnKeyPress  := KeyPressValor;
  edtPorcDesc.OnKeyPress   := KeyPressValor;
  edtCodFrPgto.OnKeyPress  := EditKeyPress;

end;

procedure TfrmInfoBxMultCp.FormShow(Sender: TObject);
begin

  //  Coloca o valor pago previamente como o valor total das contas selecionadas
  edtValor.Text := CurrToStr(FValorPago);

  //  Armazena o valor das CPs Selecionadas
  FValorCpSel := FValorPago;

end;

procedure TfrmInfoBxMultCp.keyPressvalor(Sender: TObject; var Key: Char);
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

procedure TfrmInfoBxMultCp.SetDtCpMaisAnt(const Value: TDate);
begin
  FDtCpMaisAnt := Value;
end;

procedure TfrmInfoBxMultCp.SetValorPago(const Value: Currency);
begin
  FValorPago := Value;
end;

procedure TfrmInfoBxMultCp.EditKeyPress(Sender: TObject; var Key: Char);
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
