unit SistemaFinanceiro.View.BaixarCR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.Model.Entidades.CR.Detalhe,
  SistemaFinanceiro.Model.Entidades.CR, SistemaFinanceiro.View.BaixarCR.FrPgto;

type
  TfrmBaixarCR = class(TForm)
    ImageList1: TImageList;
    pnlPrincipal: TPanel;
    pnlDocInfo: TPanel;
    gbDocInfo: TGroupBox;
    lblNDoc: TLabel;
    lblParc: TLabel;
    lblVenc: TLabel;
    lblVParcela: TLabel;
    lblDataVenda: TLabel;
    lblDoc: TLabel;
    lblParcela: TLabel;
    lblVencimento: TLabel;
    lblValorParcela: TLabel;
    lblDtVenda: TLabel;
    lblId: TLabel;
    lblIdConta: TLabel;
    lblValorRestante: TLabel;
    lblVRestante: TLabel;
    pnlDetalhes: TPanel;
    gbDetalhes: TGroupBox;
    lblObs: TLabel;
    lblValor: TLabel;
    lblData: TLabel;
    edtObs: TEdit;
    edtValor: TEdit;
    datePgto: TDateTimePicker;
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    lblIdCliente: TLabel;
    lblCodCliente: TLabel;
    lblDesconto: TLabel;
    edtValorDesc: TEdit;
    checkDesconto: TCheckBox;
    edtPorcDesc: TEdit;
    lblValorDesc: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure checkDescontoClick(Sender: TObject);
    procedure edtPorcDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPorcDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FID : Integer;
    DataVenda : TDateTime;
    function CalcValorDesc : Currency;
    function CalcPorcentDesc : Currency;
    procedure KeyPressValor(Sender: TObject; var Key: Char);

  public
    { Public declarations }
    procedure BaixarCR(Id: Integer);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

  end;

var
  frmBaixarCR: TfrmBaixarCR;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmUsuarios,
  SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.Model.dmCReceber;

procedure TfrmBaixarCR.BaixarCR(Id: Integer);
var
  ContaReceber : TModelCR;

begin

  FID := Id;

  //  Valida ID do CR
  if FID < 0 then
  begin
    raise Exception.Create('ID do contas a receber Inválido!');
  end;

  ContaReceber := dmCReceber.GetCR(FID);

  try

    //  Se o status já for B irá ignorar
    if ContaReceber.Status = 'P' then
    begin
      raise Exception.Create('Não é possível baixar uma conta já Paga!');
    end;

    //  Se o status já for C irá ignorar
    if ContaReceber.Status = 'C' then
    begin
      raise Exception.Create('Não é possível baixar uma conta cancelada!');
    end;



    //  Carregando dados para as labels
    lblIdConta.Caption       := IntToStr(FID);
    lblParcela.Caption       := IntToStr(ContaReceber.Parcela);
    lblVencimento.Caption    := FormatDateTime('dd/mm/yyyy', ContaReceber.DataVencimento);
    lblValorParcela.Caption  := 'R$ ' + TUtilitario.FormatarValor(ContaReceber.ValorParcela);
    lblDtVenda.Caption       := DateToStr(ContaReceber.DataVenda);
    lblValorRestante.Caption := 'R$ ' + TUtilitario.FormatarValor((ContaReceber.ValorParcela - ContaReceber.ValorAbatido));
    lblCodCliente.Caption    := IntToStr(ContaReceber.IdCliente);


    if ContaReceber.Doc = '' then
    begin
      lblDoc.Caption := 'Não Informado';
    end
      else
      begin
        lblDoc.Caption := ContaReceber.Doc;
      end;

    //  Armazena a data da venda
    DataVenda := ContaReceber.DataVenda;

    edtObs.Clear;
    edtValor.Text := CurrToStr(ContaReceber.ValorParcela);

  finally

    //  Libera da memoria
    ContaReceber.Free;

  end;

end;

procedure TfrmBaixarCR.btnCancelarClick(Sender: TObject);
begin

  ModalResult := mrCancel;

end;

procedure TfrmBaixarCR.btnConfirmarClick(Sender: TObject);
var
  CrDetalhe : TModelCrDetalhe;
  ValorAbater : Currency;
  ValorDesc : Currency;

begin

  //  Validações dos campos
  if datePgto.Date > Date then
  begin

    datePgto.SetFocus;
    Application.MessageBox('A data de pagamento não pode ser maior que a data atual!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;

  if datePgto.Date < DataVenda then
  begin

    datePgto.SetFocus;
    Application.MessageBox('A data de pagamento não pode ser menor que a data da venda!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;


  ValorAbater := 0;
  ValorDesc   := 0;


  if (not TryStrToCurr(edtValor.Text, ValorAbater)) or (ValorAbater <= 0)  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if ValorAbater > dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor pago não pode ser maior que o valor da parcela!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if checkDesconto.Checked then
  begin

    if (not TryStrToCurr(edtValorDesc.Text, ValorDesc)) or (ValorDesc > dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency) then
    begin

      edtValorDesc.SetFocus;
      Application.MessageBox('Valor de desconto inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;

    end;

  end;

  CrDetalhe := TModelCrDetalhe.Create;

  try

    CrDetalhe.IdCr       := FID;
    CrDetalhe.Detalhes   := Trim(edtObs.Text);
    CrDetalhe.Valor      := ValorAbater;
    CrDetalhe.Data       := datePgto.Date;
    CrDetalhe.Usuario    := dmUsuarios.GetUsuarioLogado.Id;
    CrDetalhe.ValorDesc  := ValorDesc;

    //  Forma de pgto
    try

      //  Cria o form
      frmFrPgtoBaixaCr:= TfrmFrPgtoBaixaCr.Create(Self);

      //  Passa as informações para a tela de pgto
      frmFrPgtoBaixaCr.FrPgtoCr(FID, ValorAbater);

      //  Exibe o form
      frmFrPgtoBaixaCr.ShowModal;

    except on E : Exception do

      Application.MessageBox(PWideChar(E.Message), 'Erro na forma de pagamento do documento!', MB_OK + MB_ICONWARNING);

    end;

    //  Verifica se deu tudo certo com as formas de pgto
    if frmFrPgtoBaixaCr.ModalResult <> mrOk then
    begin
      abort;
    end
      else
      begin
        FreeAndNil(frmFrPgtoBaixaCr);
      end;


     try

      dmCReceber.BaixarCR(CrDetalhe);
      Application.MessageBox('Conta baixada com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;

    except on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento!', MB_OK + MB_ICONWARNING);
    end;

  finally
    CrDetalhe.Free;
  end;


end;

function TfrmBaixarCR.CalcPorcentDesc: Currency;
var
  ValorFinal : Currency;
  PorcentDesc : Currency;
  ValorDesc : Currency;
  ValorCr : Currency;

begin

  ValorCr     := dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;
  Result      := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if PorcentDesc > 0 then
    begin

      //  Calcula o valor do desconto
      ValorDesc := (PorcentDesc / 100) * ValorCr;

      //  Atribui o valor do desconto ao campo
      edtValorDesc.Text := Currtostr(ValorDesc);

      //  Calcula o valor final
      ValorFinal := ValorCr - ValorDesc;

      //  retorna o valor final
      Result := ValorFinal;

    end;

end;

function TfrmBaixarCR.CalcValorDesc : Currency;
var
  ValorCr     : Currency;
  ValorDesc   : Currency;
  ValorFinal : Currency;
  PorcentDesc : Currency;

begin

  Result := 0;

  ValorCr := dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if ValorDesc > 0 then
  begin

    //  Calcula a porcentagem de desconto
    PorcentDesc := (ValorDesc / ValorCr) * 100;

    //  Atribui a porcentagem no campo
    edtPorcDesc.Text := Currtostr(PorcentDesc);

    //  Calcula o valor final
    ValorFinal := ValorCr - ValorDesc;

    //  retorna o valor final
    Result := ValorFinal;

  end;

end;

procedure TfrmBaixarCR.checkDescontoClick(Sender: TObject);
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

procedure TfrmBaixarCR.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmBaixarCR.edtPorcDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmBaixarCR.edtPorcDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmBaixarCR.edtValorDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmBaixarCR.edtValorDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmBaixarCR.edtValorExit(Sender: TObject);
begin

  edtValor.Text := TUtilitario.FormatarValor(edtValor.Text);

end;

procedure TfrmBaixarCR.FormCreate(Sender: TObject);
begin

  //  Coloca no KeyPress o enter para ir para o proximo campo
  edtObs.OnKeyPress        := EditKeyPress;
  datePgto.OnKeyPress      := EditKeyPress;
  edtValor.OnKeyPress      := KeyPressValor;
  edtValorDesc.OnKeyPress  := KeyPressValor;
  edtPorcDesc.OnKeyPress   := KeyPressValor;


  datePgto.Date := now;

end;

procedure TfrmBaixarCR.KeyPressValor(Sender: TObject; var Key: Char);
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
