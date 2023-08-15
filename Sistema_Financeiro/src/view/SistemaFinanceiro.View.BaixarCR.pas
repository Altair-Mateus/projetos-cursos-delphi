unit SistemaFinanceiro.View.BaixarCR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.Model.Entidades.CR.Detalhe,
  SistemaFinanceiro.Model.Entidades.CR;

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
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FID : Integer;

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
    lblValorAbatido.Caption  := 'R$ ' + TUtilitario.FormatarValor(ContaReceber.ValorAbatido);
    lblValorRestante.Caption := 'R$ ' + TUtilitario.FormatarValor((ContaReceber.ValorParcela - ContaReceber.ValorAbatido));

    if ContaReceber.Doc = '' then
    begin
      lblDoc.Caption := 'Não Informado';
    end
      else
      begin
        lblDoc.Caption := ContaReceber.Doc;
      end;

    edtObs.Text := '';
    edtValor.Text := '';

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
  TryStrToCurr(edtValor.Text, ValorAbater);
  if ValorAbater <= 0  then
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
  CrDetalhe := TModelCrDetalhe.Create;
  try
    CrDetalhe.IdCr     := FID;
    CrDetalhe.Detalhes := Trim(edtObs.Text);
    CrDetalhe.Valor    := ValorAbater;
    CrDetalhe.Data     := datePgto.Date;
    CrDetalhe.Usuario  := dmUsuarios.GetUsuarioLogado.IdUsuarioLogado;
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

procedure TfrmBaixarCR.FormCreate(Sender: TObject);
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
