unit SistemaFinanceiro.View.CPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.WinXCtrls, Datasnap.DBClient, System.SysUtils;

type
  TfrmContasPagar = class(TfrmCadastroPadrao)
    DataSourceCPagar: TDataSource;
    lblDesc: TLabel;
    memDesc: TMemo;
    dateCompra: TDateTimePicker;
    lblDataCompra: TLabel;
    edtValorCompra: TEdit;
    lblValorCompra: TLabel;
    toggleParcelamento: TToggleSwitch;
    lblParcelamento: TLabel;
    CardPanelParcela: TCardPanel;
    cardParcelaUnica: TCard;
    cardParcelamento: TCard;
    lblNDoc: TLabel;
    edtNDoc: TEdit;
    lblParcela: TLabel;
    edtParcela: TEdit;
    edtValorParcela: TEdit;
    lblValorParcela: TLabel;
    dateVencimento: TDateTimePicker;
    lblVencimento: TLabel;
    edtQtdParcelas: TEdit;
    lblQtdParcelas: TLabel;
    edtIntervaloDias: TEdit;
    lblIntervaloDias: TLabel;
    btnGerar: TButton;
    btnLimpar: TButton;
    DBGridParcelas: TDBGrid;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelasPARCELA: TIntegerField;
    cdsParcelasVALOR: TCurrencyField;
    cdsParcelasVENCIMENTO: TDateField;
    cdsParcelasDOCUMENTO: TWideStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure CadParcelaUnica;
    procedure CadParcelamento;
    procedure EditarRegCPagar;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCPagar, SistemaFinanceiro.Utilitarios,
  System.DateUtils;

{ TfrmCadastroPadrao1 }

procedure TfrmContasPagar.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarRegCPagar;

end;

procedure TfrmContasPagar.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclusão
  DataModuleCPagar.ClientDataSetCPagar.Cancel;

end;

procedure TfrmContasPagar.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  //  Se o documento já foi baixado cancela a exclusão
  if DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString = 'B' then
  begin

    Application.MessageBox('Documento já baixado não pode ser excluído!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  //  Se o documento foi cancelado, a exclusão é cancelada
  if DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString = 'C' then
  begin

    Application.MessageBox('Documento já cancelado não pode ser excluído!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try

    //  Excluindo registro
//    DataModuleCPagar.ClientDataSetCPagar.Delete;

    DataModuleCPagar.ClientDataSetCPagar.Edit;
    DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString := 'C';
    DataModuleCPagar.ClientDataSetCPagar.Post;
    DataModuleCPagar.ClientDataSetCPagar.ApplyUpdates(0);

    Application.MessageBox('Documento cancelado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);

    Pesquisar;

  except on E: Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao cancelar documento!', MB_OK + MB_ICONERROR);

  end;


end;

procedure TfrmContasPagar.btnGerarClick(Sender: TObject);
var
  QtdParcelas   : Integer;
  IntervaloDias : Integer;
  ValorCompra   : Currency;
  ValorParcela  : Currency;
  ValorResiduo  : Currency;
  Contador      : Integer;

begin

  //  Valida campos
  if not TryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin

    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToInt(edtQtdParcelas.Text, QtdParcelas) then
  begin

    edtParcela.SetFocus;
    Application.MessageBox('Números de Parcelas Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToInt(edtIntervaloDias.Text, IntervaloDias) then
  begin

    edtIntervaloDias.SetFocus;
    Application.MessageBox('Intervalo de dias Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;


  //  Calculando valores das parcelas
  //  Trunca o valor final das parcelas
  ValorParcela := (Trunc(ValorCompra / QtdParcelas * 100)) / 100;

  //  Calcula o valor do residuo do Trunc para colocar em uma das parcelas
  ValorResiduo := ValorCompra - (ValorParcela * QtdParcelas);


  //  Esvaziando data set
  cdsParcelas.EmptyDataSet;

  for Contador := 1 to QtdParcelas do
  begin

    cdsParcelas.Insert;
    cdsParcelasPARCELA.AsInteger := Contador;

    //  Adiciona o valor do residuo na primeira parcela
    cdsParcelasVALOR.AsCurrency  := ValorParcela + ValorResiduo;
    ValorResiduo := 0;  //  Zera o valor de residuo

    //  Define a data de vencimento
    cdsParcelasVENCIMENTO.AsDateTime := IncDay(dateCompra.Date, IntervaloDias *  Contador);

    cdsParcelas.Post;

  end;


end;

procedure TfrmContasPagar.btnIncluirClick(Sender: TObject);
begin
  inherited;

  toggleParcelamento.State := tssOff;

  lblTitulo.Caption := 'Inserindo um novo lançamento no Contas a Pagar';

  if not (DataModuleCPagar.ClientDataSetCPagar.State in [dsInsert, dsEdit]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    DataModuleCPagar.ClientDataSetCPagar.Insert;

  end;

  DataModuleCPagar.GeraCodigo;

  memDesc.SetFocus;

 

end;

procedure TfrmContasPagar.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.btnSalvarClick(Sender: TObject);
begin

  if toggleParcelamento.State = tssOff then
  begin

    CadParcelaUnica;

  end
    else
    begin
      CadParcelamento;
    end;

  //  Retorna ao card de pesquisa
  CardPanelParcela.ActiveCard := CardPesquisa;

  //  Atualiza a lista
  Pesquisar;

  inherited;

end;

procedure TfrmContasPagar.CadParcelamento;
var
  Parcela : Integer;
  ValorCompra : Currency;
  ValorParcela : Currency;

begin

  //  Valida campos obrigatorios
  if Trim(memDesc.Text) = '' then
  begin

    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    memDesc.SetFocus;

    abort;
  end;

  if not TryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin

    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  if not TryStrToInt(edtQtdParcelas.Text, Parcela) then
  begin

    edtQtdParcelas.SetFocus;
    Application.MessageBox('Número de parcelas Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  if dateVencimento.Date < dateCompra.Date then
  begin

    dateVencimento.SetFocus;
    Application.MessageBox('Data de vencimento não pode ser inferior a data de compra!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

end;

procedure TfrmContasPagar.CadParcelaUnica;
var
  Parcela : Integer;
  ValorCompra : Currency;
  ValorParcela : Currency;

begin

  //  Valida campos obrigatorios
  if Trim(memDesc.Text) = '' then
  begin

    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    memDesc.SetFocus;

    abort;
  end;

  if not TryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin

    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  if not TryStrToInt(edtParcela.Text, Parcela) then
  begin

    edtParcela.SetFocus;
    Application.MessageBox('Número da parcela Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  if dateVencimento.Date < dateCompra.Date then
  begin

    dateVencimento.SetFocus;
    Application.MessageBox('Data de vencimento não pode ser inferior a data de compra!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToCurr(edtValorParcela.Text, ValorParcela) then
  begin

    edtValorParcela.SetFocus;
    Application.MessageBox('Valor da parcela Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;


  //  Se for um novo registro irá gerar o código, status em aberto
  //  e setar 0 no valor abatido
  if DataSourceCPagar.State in [dsInsert] then
  begin

    DataModuleCPagar.GeraCodigo;
    DataModuleCPagar.ClientDataSetCPagarDATA_CADASTRO.AsDateTime := now;
    DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString          := 'A';
    DataModuleCPagar.ClientDataSetCPagarVALOR_ABATIDO.AsCurrency := 0;

  end;

  //  Passando os dados para o dataset
  DataModuleCPagar.ClientDataSetCPagarNUMERO_DOC.AsString        := Trim(edtNDoc.Text);
  DataModuleCPagar.ClientDataSetCPagarDESCRICAO.AsString         := Trim(memDesc.Text);
  DataModuleCPagar.ClientDataSetCPagarVALOR_COMPRA.AsCurrency    := ValorCompra;
  DataModuleCPagar.ClientDataSetCPagarDATA_COMPRA.AsDateTime     := dateCompra.Date;
  DataModuleCPagar.ClientDataSetCPagarPARCELA.AsCurrency         := Parcela;
  DataModuleCPagar.ClientDataSetCPagarVALOR_PARCELA.AsCurrency   := ValorParcela;
  DataModuleCPagar.ClientDataSetCPagarDATA_VENCIMENTO.AsDateTime := dateVencimento.Date;

  //  Gravando no BD
  DataModuleCPagar.ClientDataSetCPagar.Post;
  DataModuleCPagar.ClientDataSetCPagar.ApplyUpdates(0);


end;

procedure TfrmContasPagar.EditarRegCPagar;
begin

  //  Se o documento já foi baixado cancela a edição
  if DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString = 'B' then
  begin

    Application.MessageBox('Documento já baixado não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;

  //  Se o documento foi cancelado, a edição é cancelada
  if DataModuleCPagar.ClientDataSetCPagarSTATUS.AsString = 'C' then
  begin

    Application.MessageBox('Documento já cancelado não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;
  end;


  // Coloca o dataset em modo de edição
  DataModuleCPagar.ClientDataSetCPagar.Edit;

  // Coloca o numero do registro no titulo
  lblTitulo.Caption := 'Alterando Registro Nº ' + DataModuleCPagar.ClientDataSetCPagarID.AsString;

  //  Carrega os dados
  edtNDoc.Text         := DataModuleCPagar.ClientDataSetCPagarNUMERO_DOC.AsString;
  memDesc.Text         := DataModuleCPagar.ClientDataSetCPagarDESCRICAO.AsString;
  edtValorCompra.Text  := DataModuleCPagar.ClientDataSetCPagarVALOR_COMPRA.AsString;
  edtParcela.Text      := DataModuleCPagar.ClientDataSetCPagarPARCELA.AsString;
  edtValorParcela.Text := DataModuleCPagar.ClientDataSetCPagarVALOR_PARCELA.AsString;
  dateVencimento.Date  := DataModuleCPagar.ClientDataSetCPagarDATA_VENCIMENTO.AsDateTime;
  dateCompra.Date      := DataModuleCPagar.ClientDataSetCPagarDATA_COMPRA.AsDateTime;


end;

procedure TfrmContasPagar.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCPagar.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCPagar.DataSet.IsEmpty;

end;

procedure TfrmContasPagar.Pesquisar;
var
  LFiltroPesquisa: String;

begin

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  DataModuleCPagar.ClientDataSetCPagar.Close;
  DataModuleCPagar.ClientDataSetCPagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE 1 = 1 ' + LFiltroPesquisa + ' ORDER BY 1';
  DataModuleCPagar.ClientDataSetCPagar.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmContasPagar.toggleParcelamentoClick(Sender: TObject);
begin
  inherited;

   if toggleParcelamento.State = tssOff then
  begin

    CardPanelParcela.ActiveCard := cardParcelaUnica;
  end
    else if toggleParcelamento.State = tssOn then
         begin
           CardPanelParcela.ActiveCard := cardParcelamento;
         end;
end;

end.
