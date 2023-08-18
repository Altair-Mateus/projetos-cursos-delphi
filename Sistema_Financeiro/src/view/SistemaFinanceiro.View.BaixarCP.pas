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
    gbDetalhes: TGroupBox;
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
    lblObs: TLabel;
    lblValor: TLabel;
    edtObs: TEdit;
    edtValor: TEdit;
    lblId: TLabel;
    lblIdConta: TLabel;
    lblData: TLabel;
    datePgto: TDateTimePicker;
    lblValorRestante: TLabel;
    lblVRestante: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    FID : Integer;

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
    raise Exception.Create('ID do contas a pagar Inv�lido!');
  end;

  ContaPagar := dmCPagar.GetCP(FID);
  try

    //  Se o status j� for P ir� ignorar
    if ContaPagar.Status = 'P' then
    begin
      raise Exception.Create('N�o � poss�vel baixar uma conta j� Paga!');
    end;

    //  Se o status j� for C ir� ignorar
    if ContaPagar.Status = 'C' then
    begin
      raise Exception.Create('N�o � poss�vel baixar uma conta cancelada!');
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
      lblDoc.Caption := 'N�o Informado';
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

begin

  //  Valida��es dos campos
  if Trim(edtObs.Text) = '' then
  begin
    edtObs.SetFocus;
    Application.MessageBox('A observa��o n�o pode estar vazia!', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if datePgto.Date > Date then
  begin
    datePgto.SetFocus;
    Application.MessageBox('A data de pagamento n�o pode ser maior que a data atual', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  ValorAbater := 0;
  TryStrToCurr(edtValor.Text, ValorAbater);

  if ValorAbater <= 0  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor inv�lido!', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if ValorAbater > dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency  then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor pago n�o pode ser maior que o valor da parcela!', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  CpDetalhe := TModelCpDetalhe.Create;
  try

    CpDetalhe.IdCP     := FID;
    CpDetalhe.Detalhes := Trim(edtObs.Text);
    CpDetalhe.Valor    := ValorAbater;
    CpDetalhe.Data     := datePgto.Date;
    CpDetalhe.Usuario  := dmUsuarios.GetUsuarioLogado.IdUsuarioLogado;

    try

      dmCPagar.BaixarCP(CpDetalhe);
      Application.MessageBox('Conta baixada com sucesso!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;

    except on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento!', MB_OK + MB_ICONWARNING);
    end;

  finally
    CpDetalhe.Free;
  end;

end;

procedure TfrmBaixarCP.EditKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada � o Enter
    //  Cancela o efeito do enter
    Key := #0;
    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmBaixarCP.edtValorExit(Sender: TObject);
begin
  edtValor.Text := TUtilitario.FormatarValor(edtValor.Text);

end;

procedure TfrmBaixarCP.edtValorKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada � o Enter
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
  datePgto.Date := now;

end;

end.
