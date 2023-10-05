unit SistemaFinanceiro.View.BaixarCP;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.Model.Entidades.CP,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe, Vcl.ComCtrls,
  SistemaFinanceiro.View.BaixarCP.FrPgto;
type
  TfrmBaixarCP = class(TForm)
    pnlPrincipal: TPanel;
    pnlDocInfo: TPanel;
    pnlDetalhes: TPanel;
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    ImageList1: TImageList;
    gbDocInfo: TGroupBox;
    lblNDoc: TLabel;
    lblParc: TLabel;
    lblVenc: TLabel;
    lblVParcela: TLabel;
    lblVAbatido: TLabel;
    lblDoc: TLabel;
    lblParcela: TLabel;
    lblVencimento: TLabel;
    lblValorParcela: TLabel;
    lblValorAbatido: TLabel;
    lblId: TLabel;
    lblIdConta: TLabel;
    lblValorRestante: TLabel;
    lblVRestante: TLabel;
    lblIdFornec: TLabel;
    lblCodFornec: TLabel;
    gbDetalhes: TGroupBox;
    lblObs: TLabel;
    lblValor: TLabel;
    lblData: TLabel;
    lblDesconto: TLabel;
    lblValorDesc: TLabel;
    edtObs: TEdit;
    edtValor: TEdit;
    datePgto: TDateTimePicker;
    edtValorDesc: TEdit;
    checkDesconto: TCheckBox;
    edtPorcDesc: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure checkDescontoClick(Sender: TObject);
    procedure edtPorcDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPorcDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FID : Integer;
    function CalcValorDesc : Currency;
    function CalcPorcentDesc : Currency;
    procedure KeyPressValor(Sender: TObject; var Key: Char);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

  public
    { Public declarations }
    procedure BaixarCP(Id: Integer);

  end;
var
  frmBaixarCP: TfrmBaixarCP;

implementation
{$R *.dfm}
uses
  SistemaFinanceiro.Model.dmCPagar,
  SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.Model.dmUsuarios;

{ TfrmBaixarCP }
procedure TfrmBaixarCP.BaixarCP(Id: Integer);
var
  ContaPagar : TModelCP;

begin

  FID := ID;

  //  Valida ID do CP
  if FID < 0 then
  begin
    raise Exception.Create('ID do contas a pagar Inválido!');
  end;

  ContaPagar := dmCPagar.GetCP(FID);

  try

    //  Se o status já for P irá ignorar
    if ContaPagar.Status = 'P' then
    begin
      raise Exception.Create('Não é possível baixar uma conta já Paga!');
    end;

    //  Se o status já for C irá ignorar
    if ContaPagar.Status = 'C' then
    begin
      raise Exception.Create('Não é possível baixar uma conta cancelada!');
    end;

    //  Carregando dados para as labels
    lblIdConta.Caption       := IntToStr(FID);
    lblParcela.Caption       := IntToStr(ContaPagar.Parcela);
    lblVencimento.Caption    := FormatDateTime('dd/mm/yyyy', ContaPagar.DataVencimento);
    lblValorParcela.Caption  := 'R$ ' + TUtilitario.FormatarValor(ContaPagar.ValorParcela);
    lblValorAbatido.Caption  := 'R$ ' + TUtilitario.FormatarValor(ContaPagar.ValorAbatido);
    lblValorRestante.Caption := 'R$ ' + TUtilitario.FormatarValor((ContaPagar.ValorParcela - ContaPagar.ValorAbatido));
    lblCodFornec.Caption     := IntToStr(ContaPagar.IdFornecedor);

    if ContaPagar.Doc = '' then
    begin
      lblDoc.Caption := 'Não Informado';
    end
      else
      begin
        lblDoc.Caption := ContaPagar.Doc;
      end;

    edtObs.Clear;
    edtValor.Text := CurrToStr(ContaPagar.ValorParcela);

  finally

    //  Libera da memoria
    ContaPagar.Free;

  end;
end;

procedure TfrmBaixarCP.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBaixarCP.btnConfirmarClick(Sender: TObject);
var
  CpDetalhe : TModelCpDetalhe;
  ValorAbater : Currency;
  ValorDesc : Currency;

begin

  //  Validações dos campos
  if datePgto.Date > Date then
  begin
    datePgto.SetFocus;
    Application.MessageBox('A data de pagamento não pode ser maior que a data atual', 'Atenção', MB_OK + MB_ICONWARNING);
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

  if ValorAbater > dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor pago não pode ser maior que o valor da parcela!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if checkDesconto.Checked then
  begin

    if (not TryStrToCurr(edtValorDesc.Text, ValorDesc)) or (ValorDesc > dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency) then
    begin

      edtValorDesc.SetFocus;
      Application.MessageBox('Valor de desconto inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;

    end;

  end;

  CpDetalhe := TModelCpDetalhe.Create;

  try
    CpDetalhe.IdCP      := FID;
    CpDetalhe.Detalhes  := Trim(edtObs.Text);
    CpDetalhe.Valor     := ValorAbater;
    CpDetalhe.Data      := datePgto.Date;
    CpDetalhe.Usuario   := dmUsuarios.GetUsuarioLogado.Id;
    CpDetalhe.ValorDesc := ValorDesc;

    //  Forma de pgto
    try

      //  Cria o form
      frmFrPgtoBaixaCp:= TfrmFrPgtoBaixaCp.Create(Self);

      //  Passa as informações para a tela de pgto
      frmFrPgtoBaixaCp.FrPgtoCp(FID, ValorAbater);

      //  Exibe o form
      frmFrPgtoBaixaCp.ShowModal;

    except on E : Exception do

      Application.MessageBox(PWideChar(E.Message), 'Erro na forma de pagamento do documento!', MB_OK + MB_ICONWARNING);

    end;

    //  Verifica se deu tudo certo com as formas de pgto
    if frmFrPgtoBaixaCp.ModalResult <> mrOk then
    begin
      abort;
    end
      else
      begin
        FreeAndNil(frmFrPgtoBaixaCp);
      end;

    try

      dmCPagar.BaixarCP(CpDetalhe);
      Application.MessageBox('Conta baixada com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;

    except on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento!', MB_OK + MB_ICONWARNING);
    end;

  finally

    CpDetalhe.Free;
  end;

end;

function TfrmBaixarCP.CalcPorcentDesc: Currency;
var
  ValorFinal : Currency;
  PorcentDesc : Currency;
  ValorDesc : Currency;
  ValorCp : Currency;

begin

  ValorCp     := dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency;
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

function TfrmBaixarCP.CalcValorDesc: Currency;
var
  ValorCp     : Currency;
  ValorDesc   : Currency;
  ValorFinal : Currency;
  PorcentDesc : Currency;

begin

  Result := 0;

  ValorCp := dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency;
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

procedure TfrmBaixarCP.checkDescontoClick(Sender: TObject);
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

procedure TfrmBaixarCP.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmBaixarCP.edtPorcDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  edtValor.Text := CurrToStr(CalcPorcentDesc);

end;

procedure TfrmBaixarCP.edtPorcDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  edtValor.Text := CurrToStr(CalcPorcentDesc);

end;

procedure TfrmBaixarCP.edtValorDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  edtValor.Text := CurrToStr(CalcValorDesc);

end;

procedure TfrmBaixarCP.edtValorDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  edtValor.Text := CurrToStr(CalcValorDesc);

end;

procedure TfrmBaixarCP.edtValorExit(Sender: TObject);
begin

  edtValor.Text := TUtilitario.FormatarValor(Trim(edtValor.Text));

end;

procedure TfrmBaixarCP.edtValorKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmBaixarCP.FormCreate(Sender: TObject);
begin

  //  Coloca no KeyPress o enter para ir para o proximo campo
  edtObs.OnKeyPress        := EditKeyPress;
  datePgto.OnKeyPress      := EditKeyPress;
  edtValor.OnKeyPress      := KeyPressValor;
  edtValorDesc.OnKeyPress  := KeyPressValor;
  edtPorcDesc.OnKeyPress   := KeyPressValor;


  datePgto.Date := now;

end;

procedure TfrmBaixarCP.KeyPressValor(Sender: TObject; var Key: Char);
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
