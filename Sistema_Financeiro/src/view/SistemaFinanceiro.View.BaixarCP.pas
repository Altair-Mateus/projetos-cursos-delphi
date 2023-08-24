unit SistemaFinanceiro.View.BaixarCP;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.Model.Entidades.CP,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe, Vcl.ComCtrls;
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
    lblIdCliente: TLabel;
    lblCodCliente: TLabel;
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
    procedure edtPorcDescExit(Sender: TObject);
    procedure edtValorDescExit(Sender: TObject);
    procedure edtPorcDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    FID : Integer;
    function CalcValorDesc : Currency;
    function CalcPorcentDesc : Currency;

  public
    { Public declarations }
    procedure BaixarCP(Id: Integer);
    procedure EditKeyPress(Sender: TObject; var Key: Char);

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

    if ContaPagar.Doc = '' then
    begin
      lblDoc.Caption := 'Não Informado';
    end
      else
      begin
        lblDoc.Caption := ContaPagar.Doc;
      end;

    edtObs.Text := '';
    edtValor.Text := '';

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
  if Trim(edtObs.Text) = '' then
  begin
    edtObs.SetFocus;
    Application.MessageBox('A observação não pode estar vazia!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

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
    CpDetalhe.Usuario   := dmUsuarios.GetUsuarioLogado.IdUsuarioLogado;
    CpDetalhe.ValorDesc := ValorDesc;

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

  ValorCp := dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;
  Result := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if PorcentDesc > 0 then
    begin

      //  Calcula o valor do desconto
      ValorDesc := (PorcentDesc / 100) * ValorCp;

      //  Atribui o valor do desconto ao campo
      edtValorDesc.Text := TUtilitario.FormatarValor(ValorDesc);

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
    edtPorcDesc.Text := TUtilitario.FormatarValor(PorcentDesc);

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

procedure TfrmBaixarCP.edtPorcDescExit(Sender: TObject);
begin
  edtValor.Text := TUtilitario.FormatarValor(CalcPorcentDesc);
end;

procedure TfrmBaixarCP.edtPorcDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := TUtilitario.FormatarValor(CalcPorcentDesc);
end;

procedure TfrmBaixarCP.edtValorDescExit(Sender: TObject);
begin
  edtValor.Text := TUtilitario.FormatarValor(CalcValorDesc);
end;

procedure TfrmBaixarCP.edtValorDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := TUtilitario.FormatarValor(CalcValorDesc);
end;

procedure TfrmBaixarCP.edtValorExit(Sender: TObject);
begin

  edtValor.Text := TUtilitario.FormatarValor(edtValor.Text);

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
var
  I : Integer;

begin

  //  Percorre os componentes TEdit
  for I := 0 to ComponentCount - 1 do
  begin

    if (Components[I] is TEdit) or (Components[I] is TDateTimePicker) then
    begin
      //  Cria o evento OnKeyPress para cada Edit encontrado
      TEdit(Components[I]).OnKeyPress := EditKeyPress;
    end;

  end;

  edtValor.OnKeyPress := TUtilitario.KeyPressValor;
  edtValorDesc.OnKeyPress := TUtilitario.KeyPressValor;
  edtPorcDesc.OnKeyPress := TUtilitario.KeyPressValor;
  datePgto.Date := now;

end;

end.
