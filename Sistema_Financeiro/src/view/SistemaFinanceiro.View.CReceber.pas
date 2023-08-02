unit SistemaFinanceiro.View.CReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.ComCtrls, Datasnap.DBClient;

type
  TfrmContasReceber = class(TfrmCadastroPadrao)
    DataSourceCReceber: TDataSource;
    CardPanelParcela: TCardPanel;
    cardParcelaUnica: TCard;
    lblNDoc: TLabel;
    lblParcela: TLabel;
    lblValorParcela: TLabel;
    lblVencimento: TLabel;
    edtNDoc: TEdit;
    edtParcela: TEdit;
    edtValorParcela: TEdit;
    dateVencimento: TDateTimePicker;
    cardParcelamento: TCard;
    lblQtdParcelas: TLabel;
    lblIntervaloDias: TLabel;
    edtQtdParcelas: TEdit;
    edtIntervaloDias: TEdit;
    btnGerar: TButton;
    btnLimpar: TButton;
    DBGridParcelas: TDBGrid;
    dateVenda: TDateTimePicker;
    edtValorVenda: TEdit;
    lblDataVend: TLabel;
    lblDesc: TLabel;
    lblParcelamento: TLabel;
    lblValorVenda: TLabel;
    memDesc: TMemo;
    toggleParcelamento: TToggleSwitch;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasDocumento: TWideStringField;
    cdsParcelasVencimento: TDateField;
    cdsParcelasValor: TCurrencyField;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    gbLegenda: TGroupBox;
    lblPagas: TLabel;
    lblVencida: TLabel;
    lblCancelada: TLabel;
    lblNormal: TLabel;
    pnlPagas: TPanel;
    pnlVencida: TPanel;
    pnlNormal: TPanel;
    pnlCancelada: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
    procedure edtValorVendaExit(Sender: TObject);
    procedure edtValorParcelaExit(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure EditarRegCReceber;
    procedure CadParcelaUnica;
    procedure CadParcelamento;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmCReceber,
  SistemaFinanceiro.Utilitarios, System.DateUtils;

{ TfrmContasReceber }

procedure TfrmContasReceber.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarRegCReceber;

end;

procedure TfrmContasReceber.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclusão
  dmCReceber.cdsCReceber.Cancel;

end;

procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
var
  Option : Word;

begin

  //  Se o documento já foi baixado cancela a exclusão
  if dmCReceber.cdsCReceberSTATUS.AsString = 'B' then
  begin

    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já baixado não pode ser cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  //  Se o documento foi cancelado, a exclusão é cancelada
  if dmCReceber.cdsCReceberSTATUS.AsString = 'C' then
  begin

    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já cancelado não pode ser cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  option := Application.MessageBox('Deseja cancelar o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try

    dmCReceber.cdsCReceber.Edit;
    dmCReceber.cdsCReceberSTATUS.AsString := 'C';
    dmCReceber.cdsCReceber.Post;
    dmCReceber.cdsCReceber.ApplyUpdates(0);

    Application.MessageBox('Documento cancelado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);

    Pesquisar;

  except on e: Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao cancelar documento!', MB_OK + MB_ICONERROR);

  end;

  inherited;

end;

procedure TfrmContasReceber.btnGerarClick(Sender: TObject);
var
  QtdParcelas   : Integer;
  IntervaloDias : Integer;
  ValorVenda    : Currency;
  ValorParcela  : Currency;
  ValorResiduo  : Currency;
  Contador      : Integer;

begin

  //  Valida Campos
  if not TryStrToCurr(edtValorVenda.Text, ValorVenda) then
  begin

    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da Venda Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToInt(edtQtdParcelas.Text, QtdParcelas) then
  begin

    edtQtdParcelas.SetFocus;
    Application.MessageBox('Quantidade de Parcelas Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToInt(edtIntervaloDias.Text, IntervaloDias) then
  begin

    edtIntervaloDias.SetFocus;
    Application.MessageBox('Intervalor de dias Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;


  //  Calculando valores das parcelas
  //  Trunca o valor final das parcelas
  ValorParcela := (Trunc(ValorVenda / QtdParcelas * 100) / 100);

  //  Calcula o valor do residuo do Trunc para colocar em uma das parcelas
  ValorResiduo := ValorVenda - (ValorParcela * QtdParcelas);

  //  Esvaziando data set
  cdsParcelas.IsEmpty;

  for Contador := 1 to QtdParcelas do
  begin

    cdsParcelas.Insert;
    cdsParcelasParcela.AsInteger := Contador;

    //  Adiciona o valor do residuo na primeira parcela
    cdsParcelasValor.AsCurrency := ValorParcela + ValorResiduo;
    ValorResiduo := 0;  //  Zera o valor de residuo

    //  Define a data de vencimento
    cdsParcelasVencimento.AsDateTime := IncDay(dateVenda.Date, IntervaloDias * Contador);

    cdsParcelas.Post;


  end;


end;

procedure TfrmContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;

  //  Atualiza titulo
  lblTitulo.Caption := 'Inserindo novo Lançamento no Contas a Receber';

  if not (dmCReceber.cdsCReceber.State in [dsInsert, dsEdit]) then
  begin

    //  Coloca o dataset em modo de inserção de dados
    dmCReceber.cdsCReceber.Insert;

  end;

  //  Gera a id
  dmCReceber.GeraCodigo;

  //  Posiciona o foco no 1 campo
  memDesc.SetFocus;

  //  Seta previamente as datas
  dateVenda.Date := now;
  dateVencimento.Date := now + 7;

  toggleParcelamento.State := tssOff;
  toggleParcelamento.Enabled := True;

  //  Seta previamente a parcela
  edtParcela.Text := '1';

  //  Esvazia o dataset das parcelas
  cdsParcelas.EmptyDataSet;

end;

procedure TfrmContasReceber.btnLimparClick(Sender: TObject);
begin
  inherited;

  //  Esvazia o dataset das parcelas
  cdsParcelas.EmptyDataSet;

end;

procedure TfrmContasReceber.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasReceber.btnSalvarClick(Sender: TObject);
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
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista
  Pesquisar;


  inherited;

end;

procedure TfrmContasReceber.CadParcelamento;
var
  ValorVenda : Currency;

begin

  //  Valida valor da venda
  if not TryStrToCurr(edtValorVenda.Text, ValorVenda) then
  begin

    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da Venda inválido!', 'Atenção', MB_OK + MB_ICONWARNING);

    abort;

  end;

  //  Posiciona no reg 1 do cds
  cdsParcelas.First;

  //  Valida todos os reg do cds
  while not cdsParcelas.Eof do
  begin

    if cdsParcelasParcela.AsInteger < 0 then
    begin

      Application.MessageBox('Número de Parcela inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;

    end;

    if cdsParcelasValor.AsCurrency < 0.01 then
    begin

      Application.MessageBox('Valor da Parcela inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort

    end;

    cdsParcelas.Next;

  end;

  //  Posiciona no reg 1 do cds
  cdsParcelas.First;

  //  Gravando Parcelas
  while not cdsParcelas.Eof do
  begin

    if dmCReceber.cdsCReceber.State in [dsBrowse, dsInactive] then
    begin
      dmCReceber.cdsCReceber.Insert;
    end;

    dmCReceber.GeraCodigo;
    dmCReceber.cdsCReceberDATA_CADASTRO.AsDateTime   := now;
    dmCReceber.cdsCReceberSTATUS.AsString            := 'A';
    dmCReceber.cdsCReceberVALOR_ABATIDO.AsCurrency   := 0;
    dmCReceber.cdsCReceberNUMERO_DOCUMENTO.AsString  := cdsParcelasDOCUMENTO.AsString;
    dmCReceber.cdsCReceberDESCRICAO.AsString         := Format('%s - Parcela %d', [memDesc.Text, cdsParcelasPARCELA.AsInteger]);
    dmCReceber.cdsCReceberVALOR_VENDA.AsCurrency     := ValorVenda;
    dmCReceber.cdsCReceberDATA_VENDA.AsDateTime      := dateVenda.Date;
    dmCReceber.cdsCReceberPARCELA.AsInteger          := cdsParcelasPARCELA.AsInteger;
    dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency   := cdsParcelasVALOR.AsCurrency;
    dmCReceber.cdsCReceberDATA_VENCIMENTO.AsDateTime := cdsParcelasVENCIMENTO.AsDateTime;

    //  Gravando no banco
    dmCReceber.cdsCReceber.Post;
    dmCReceber.cdsCReceber.ApplyUpdates(0);

    cdsParcelas.Next;

  end;


  Application.MessageBox('Parcelas Cadastradas com Sucesso!!', 'Atenção', MB_OK + MB_ICONINFORMATION);

  Pesquisar;

  CardPanelPrincipal.ActiveCard := CardPesquisa;

end;

procedure TfrmContasReceber.CadParcelaUnica;
var
  Parcela : Integer;
  ValorVenda : Currency;
  ValorParcela : Currency;

begin

  //  Se for um novo registro irá gerar o código, status em aberto
  //  e setar 0 no valor abatido
  if DataSourceCReceber.State in [dsInsert] then
  begin

    //  gera a id
    dmCReceber.GeraCodigo;

    dmCReceber.cdsCReceberDATA_CADASTRO.AsDateTime := now;
    dmCReceber.cdsCReceberSTATUS.AsString := 'A';
    dmCReceber.cdsCReceberVALOR_ABATIDO.AsCurrency := 0;

    //  Se for parcela unica pega o mesmo valor da compra
    edtValorParcela.Text := edtValorVenda.Text;

  end;

  //  Valida Campos obrigatórios
  if Trim(memDesc.text) = '' then
  begin

    memDesc.SetFocus;
    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToCurr(edtValorVenda.Text, ValorVenda) then
  begin

    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da Venda inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if dateVencimento.Date < dateVenda.Date then
  begin

    dateVencimento.SetFocus;
    Application.MessageBox('Data de vencimento não pode ser inferior a data de venda!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToCurr(edtValorParcela.Text, ValorParcela) then
  begin

    edtValorParcela.SetFocus;
    Application.MessageBox('Valor da Parcela inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  if not TryStrToInt(edtParcela.Text, Parcela) then
  begin

    edtParcela.SetFocus;
    Application.MessageBox('Número da Parcela inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  //  Passando os dados para o dataset
  dmCReceber.cdsCReceberNUMERO_DOCUMENTO.AsString  := Trim(edtNDoc.text);
  dmCReceber.cdsCReceberDESCRICAO.AsString         := Trim(memDesc.Text);
  dmCReceber.cdsCReceberPARCELA.AsInteger          := Parcela;
  dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency   := ValorParcela;
  dmCReceber.cdsCReceberVALOR_VENDA.AsCurrency     := ValorVenda;
  dmCReceber.cdsCReceberDATA_VENCIMENTO.AsDateTime := dateVencimento.Date;
  dmCReceber.cdsCReceberDATA_VENDA.AsDateTime      := dateVenda.Date;

  //  Gravando no BD
  dmCReceber.cdsCReceber.Post;
  dmCReceber.cdsCReceber.ApplyUpdates(0);

end;

procedure TfrmContasReceber.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarRegCReceber;

end;

procedure TfrmContasReceber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //  Altera a cor das duplicatas vencidas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
      (DBGrid1.DataSource.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < Date)
      and (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'A')then
  begin
    DBGrid1.Canvas.Font.Color := clRed;  // Define a cor do texto da célula
  end;

  //  Altera a cor das duplicatas pagas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'P')then
  begin
    DBGrid1.Canvas.Font.Color := clHotLight;  // Define a cor do texto da célula
  end;

  //  Altera a cor das duplicatas canceladas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'C')then
  begin
    DBGrid1.Canvas.Font.Color := $00E68AE5;  // Define a cor do texto da célula
  end;

  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  inherited;

end;

procedure TfrmContasReceber.EditarRegCReceber;
begin

  //  Esvazia o cds
  cdsParcelas.EmptyDataSet;

  //  Se o documento já foi baixado cancela a edição
  if dmCReceber.cdsCReceberSTATUS.AsString = 'B' then
  begin

    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já baixado não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  //  Se o documento foi cancelado, a edição é cancelada
  if dmCReceber.cdsCReceberSTATUS.AsString = 'C' then
  begin

    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já cancelado não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

  // Coloca o dataset em modo de edição
  dmCReceber.cdsCReceber.Edit;

  // Coloca o numero do registro no titulo
  lblTitulo.Caption := 'Alterando Registro Nº ' + dmCReceber.cdsCReceberID.AsString;

  //  Bloqueia o toogle
  toggleParcelamento.Enabled  := False;
  toggleParcelamento.State    := tssOff;
  CardPanelParcela.ActiveCard := cardParcelaUnica;

  //  Carrega os dados
  memDesc.Text         := dmCReceber.cdsCReceberDESCRICAO.AsString;
  edtValorVenda.Text   := TUtilitario.FormatarValor(dmCReceber.cdsCReceberVALOR_VENDA.AsCurrency);
  dateVenda.Date       := dmCReceber.cdsCReceberDATA_VENDA.AsDateTime;
  edtNDoc.Text         := dmCReceber.cdsCReceberNUMERO_DOCUMENTO.AsString;
  edtParcela.Text      := dmCReceber.cdsCReceberPARCELA.AsString;
  edtValorParcela.Text := TUtilitario.FormatarValor(dmCReceber.cdsCReceberVALOR_PARCELA.AsCurrency);
  dateVencimento.Date  := dmCReceber.cdsCReceberDATA_VENCIMENTO.AsDateTime;

end;

procedure TfrmContasReceber.edtValorParcelaExit(Sender: TObject);
begin
  inherited;

  edtValorParcela.Text := TUtilitario.FormatarValor(edtValorParcela.Text);

end;

procedure TfrmContasReceber.edtValorVendaExit(Sender: TObject);
begin
  inherited;

  edtValorVenda.Text := TUtilitario.FormatarValor(edtValorVenda.Text);

end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;

  edtValorVenda.OnKeyPress   := TUtilitario.KeyPressValor;
  edtValorParcela.OnKeyPress := TUtilitario.KeyPressValor;

end;

procedure TfrmContasReceber.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCReceber.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCReceber.DataSet.IsEmpty;


end;

procedure TfrmContasReceber.Pesquisar;
var
  LFiltroPesquisa: String;
  LFiltroTipo : String;

begin

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  case cbStatus.ItemIndex of

    1 : LFiltroTipo := ' AND STATUS = ''P'' ';
    2 : LFiltroTipo := ' AND STATUS = ''A'' ';
    3 : LFiltroTipo := ' AND STATUS = ''C'' ';

  end;

  dmCReceber.cdsCReceber.Close;
  dmCReceber.cdsCReceber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE 1 = 1 ' + LFiltroPesquisa + LFiltroTipo + ' ORDER BY 1 DESC';
  dmCReceber.cdsCReceber.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmContasReceber.toggleParcelamentoClick(Sender: TObject);
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
