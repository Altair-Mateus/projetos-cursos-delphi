unit SistemaFinanceiro.View.CPagar;
interface
uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.WinXCtrls, Datasnap.DBClient, System.SysUtils,
  SistemaFinanceiro.View.BaixarCP, Vcl.Menus, SistemaFinanceiro.View.CpDetalhe,
  Vcl.Imaging.pngimage, SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.FaturaCartao, SistemaFinanceiro.View.BxMultiplaCp;
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
    cbStatus: TComboBox;
    lblStatus: TLabel;
    gbLegenda: TGroupBox;
    pnlPagas: TPanel;
    lblPagas: TLabel;
    pnlVencida: TPanel;
    lblVencida: TLabel;
    lblCancelada: TLabel;
    lblNormal: TLabel;
    pnlNormal: TPanel;
    pnlCancelada: TPanel;
    edtNDoc: TEdit;
    lblNDoc: TLabel;
    gbFiltros: TGroupBox;
    rbDataVenc: TRadioButton;
    rbValorParcela: TRadioButton;
    rbValorCompra: TRadioButton;
    rbDataCompra: TRadioButton;
    rbId: TRadioButton;
    cbData: TComboBox;
    lblData: TLabel;
    dateFinal: TDateTimePicker;
    lblDataFinal: TLabel;
    lblDataInicial: TLabel;
    dateInicial: TDateTimePicker;
    btnBaixarCP: TButton;
    btnDetalhes: TButton;
    Image2: TImage;
    lblCP: TLabel;
    lblDiaFixo: TLabel;
    edtDiaFixoVcto: TEdit;
    checkDiaFixoVcto: TCheckBox;
    pnlParciais: TPanel;
    checkParciais: TCheckBox;
    checkVencidas: TCheckBox;
    lblFornecedor: TLabel;
    edtFornecedor: TEdit;
    btnPesquisaFornecedor: TButton;
    lblNomeFornecedor: TLabel;
    lblFornecedorFiltro: TLabel;
    edtFiltroFornecedor: TEdit;
    btnPesqFornecedor: TButton;
    lblFatura: TLabel;
    toggleFatura: TToggleSwitch;
    lblCodFatCartao: TLabel;
    edtCodFatCartao: TEdit;
    btnPesqFat: TButton;
    lblNomeFatCartao: TLabel;
    btnPesqFtCartao: TButton;
    edtFiltroFatCartao: TEdit;
    lblCodFtCartao: TLabel;
    pnlAviso: TPanel;
    pnlImgAviso: TPanel;
    lblAvisoFatura: TLabel;
    imgAviso: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnBxMultipla: TButton;
    pnlTotais: TPanel;
    lblQtdCp: TLabel;
    lblTotalCpGrid: TLabel;
    lblTQtdCo: TLabel;
    lblTValorCp: TLabel;
    CheckFatVirada: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorCompraExit(Sender: TObject);
    procedure edtValorParcelaExit(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure btnBaixarCPClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceCPagarDataChange(Sender: TObject; Field: TField);
    procedure btnDetalhesClick(Sender: TObject);
    procedure cbStatusClick(Sender: TObject);
    procedure cbDataClick(Sender: TObject);
    procedure rbDataVencClick(Sender: TObject);
    procedure rbDataCompraClick(Sender: TObject);
    procedure rbIdClick(Sender: TObject);
    procedure rbValorParcelaClick(Sender: TObject);
    procedure rbValorCompraClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure checkParciaisClick(Sender: TObject);
    procedure checkDiaFixoVctoClick(Sender: TObject);
    procedure btnPesquisaFornecedorClick(Sender: TObject);
    procedure btnPesqFornecedorClick(Sender: TObject);
    procedure edtFiltroFornecedorChange(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure dateInicialChange(Sender: TObject);
    procedure dateFinalChange(Sender: TObject);
    procedure toggleFaturaClick(Sender: TObject);
    procedure btnPesqFatClick(Sender: TObject);
    procedure edtCodFatCartaoExit(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtFiltroFatCartaoChange(Sender: TObject);
    procedure btnPesqFtCartaoClick(Sender: TObject);
    procedure btnBxMultiplaClick(Sender: TObject);

  private
    { Private declarations }
    DataVctoFat : Integer;

    procedure HabilitaBotoes;
    procedure CadParcelaUnica;
    procedure CadParcelamento;
    procedure EditarRegCPagar;
    procedure ExibeTelaBaixar;
    procedure ExibeTelaBxMultipla;
    procedure ExibeDetalhe;
    procedure BuscaNomeFornecedor;
    procedure BuscaNomeFatCartao;
    procedure KeyPressValor(Sender: TObject; var Key: Char);
    procedure GeraParcelas;
    procedure FatCartaoAtiva;
    procedure CalcCpGrid;
    procedure CalcQtdCpGrid;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmContasPagar: TfrmContasPagar;

implementation
{$R *.dfm}
uses
  SistemaFinanceiro.Model.dmCPagar,
  SistemaFinanceiro.Utilitarios,
  System.DateUtils, SistemaFinanceiro.View.Principal,
  SistemaFinanceiro.View.Relatorios.Cp, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Model.dmFaturaCartao;

{ TfrmCadastroPadrao1 }
procedure TfrmContasPagar.Baixar1Click(Sender: TObject);
begin

  inherited;
  ExibeTelaBaixar;

end;

procedure TfrmContasPagar.btnAlterarClick(Sender: TObject);
begin

  inherited;
  EditarRegCPagar;

end;

procedure TfrmContasPagar.btnBaixarCPClick(Sender: TObject);
begin

  inherited;
  ExibeTelaBaixar;

end;

procedure TfrmContasPagar.btnBxMultiplaClick(Sender: TObject);
begin

  ExibeTelaBxMultipla;

end;

procedure TfrmContasPagar.btnCancelarClick(Sender: TObject);
begin

  inherited;
  //  Cancelando inclusão
  dmCPagar.cdsCPagar.Cancel;

end;

procedure TfrmContasPagar.btnDetalhesClick(Sender: TObject);
begin
  inherited;

  if DataSourceCPagar.DataSet.FieldByName('STATUS').AsString <> 'P' then
  begin

    Application.MessageBox('Conta não paga, realize a baixa para ver os detalhes!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  ExibeDetalhe;

end;

procedure TfrmContasPagar.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  //  Se o documento já foi baixado cancela a exclusão
  if dmCPagar.cdsCPagarSTATUS.AsString = 'P' then
  begin
    Application.MessageBox('Documento já pago não pode ser cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  //  Se o documento foi cancelado, a exclusão é cancelada
  if dmCPagar.cdsCPagarSTATUS.AsString = 'C' then
  begin
    Application.MessageBox('Documento já cancelado não pode ser cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  option := Application.MessageBox('Deseja cancelar o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try
    dmCPagar.cdsCPagar.Edit;
    dmCPagar.cdsCPagarSTATUS.AsString := 'C';
    dmCPagar.cdsCPagar.Post;
    dmCPagar.cdsCPagar.ApplyUpdates(0);

    Application.MessageBox('Documento cancelado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);

    Pesquisar;

    //  Atualiza o relatorio na tela inicial
    frmPrincipal.TotalCP;

  except on E: Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao cancelar documento!', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmContasPagar.btnGerarClick(Sender: TObject);
begin
  GeraParcelas;
end;

procedure TfrmContasPagar.btnImprimirClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmRelCp := TfrmRelCp.Create(Self);

  try

    frmRelCp.DataSourceCp.DataSet := DataSourceCPagar.DataSet;

    //  Mostra a pre visualização
    frmRelCp.RLReport.Preview();

  finally

    FreeAndNil(frmRelCp);

  end;

  Pesquisar;

end;

procedure TfrmContasPagar.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo um novo lançamento no Contas a Pagar';

  if not (dmCPagar.cdsCPagar.State in [dsInsert, dsEdit]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    dmCPagar.cdsCPagar.Insert;

  end;

  memDesc.SetFocus;

  //  Coloca a data atual no datetimepicker
  dateCompra.Date := now;
  dateVencimento.Date := now + 7;

  //  Seta parcela previamente como 1
  edtParcela.Text := '1';

  //  Esvaziando data set de parcelas
  cdsParcelas.EmptyDataSet;

  //  Liberacoes e bloqueios
  edtQtdParcelas.Enabled     := True;
  edtIntervaloDias.Enabled   := True;
  edtDiaFixoVcto.Enabled     := False;
  checkDiaFixoVcto.Checked   := False;
  checkDiaFixoVcto.Enabled   := True;
  CheckFatVirada.Checked     := False;
  btnGerar.Enabled           := True;
  btnLimpar.Enabled          := False;
  toggleFatura.State         := tssOff;
  toggleParcelamento.State   := tssOff;
  toggleParcelamento.Enabled := True;
  edtParcela.ReadOnly        := True;
  edtValorParcela.ReadOnly   := True;
  lblNomeFornecedor.Visible  := False;
  lblNomeFatCartao.Visible   := False;


end;

procedure TfrmContasPagar.btnLimparClick(Sender: TObject);
begin
  inherited;

  //  Esvaziando data set de parcelas
  cdsParcelas.EmptyDataSet;

  //  Liberações
  edtQtdParcelas.Enabled   := True;
  btnGerar.Enabled         := True;
  btnLimpar.Enabled        := False;

  edtQtdParcelas.Clear;

  if DataVctoFat = 0 then
  begin

    checkDiaFixoVcto.Checked := False;
    checkDiaFixoVcto.Enabled := True;
    edtDiaFixoVcto.Enabled   := True;
    edtIntervaloDias.Enabled := True;
    edtIntervaloDias.Clear;
    edtDiaFixoVcto.Clear;

  end;

end;

procedure TfrmContasPagar.btnPesqFatClick(Sender: TObject);
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtCodFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;
    edtCodFatCartao.SetFocus;

    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

end;

procedure TfrmContasPagar.btnPesqFornecedorClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtFiltroFornecedor.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  Pesquisar;

end;

procedure TfrmContasPagar.btnPesqFtCartaoClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtFiltroFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;

    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

  Pesquisar;

end;

procedure TfrmContasPagar.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.btnPesquisaFornecedorClick(Sender: TObject);
begin

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtFornecedor.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  edtFornecedor.SetFocus;

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
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista
  Pesquisar;
  inherited;

  //  Atualiza relatorio tela principal
  frmPrincipal.TotalCP;

end;

procedure TfrmContasPagar.BuscaNomeFatCartao;
var
  NomeFatCartao : String;

begin

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    NomeFatCartao := dmFaturaCartao.GetNomeFatCartao(Trim(edtCodFatCartao.Text));

    if NomeFatCartao = '' then
    begin

      Application.MessageBox('Fatura de Cartão não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFatCartao.SetFocus;
      edtCodFatCartao.Clear;
      abort;

    end;

    lblNomeFatCartao.Caption := NomeFatCartao;
    lblNomeFatCartao.Visible := True;

    DataVctoFat := dmFaturaCartao.GetDataVcto(Trim(edtCodFatCartao.Text));
    dateVencimento.Date := EncodeDate(YearOf(dateVencimento.Date), MonthOf(dateVencimento.Date), DataVctoFat);

  end;


end;

procedure TfrmContasPagar.BuscaNomeFornecedor;
var
  NomeFornecedor : String;

begin

  if Trim(edtFornecedor.Text) <> '' then
  begin

    NomeFornecedor := dmFornecedores.GetNomeFornecedor(Trim(edtFornecedor.Text));

    if NomeFornecedor = '' then
    begin

      Application.MessageBox('Fornecedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtFornecedor.SetFocus;
      edtFornecedor.Clear;

    end;

    lblNomeFornecedor.Visible := True;
    lblNomeFornecedor.Caption := NomeFornecedor;

  end;

end;

procedure TfrmContasPagar.CadParcelamento;
var
  ValorCompra : Currency;
  IdFornecedor : Integer;

begin

  //  Valida valor da compra
  if not TryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin
  
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;  
  
  end;

  if not TryStrToInt(edtFornecedor.Text, IdFornecedor) then
  begin

    edtFornecedor.SetFocus;
    Application.MessageBox('Campo FORNECEDOR não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  //  Posiciona no primeiro registro do cds
  cdsParcelas.First;

  if cdsParcelas.IsEmpty then
  begin

    edtQtdParcelas.SetFocus;
    Application.MessageBox('Parcelas não geradas!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;

  end;

  //  Valida todos os registros do cds
  while not cdsParcelas.Eof do
  begin

    if cdsParcelasPARCELA.AsInteger < 0 then
    begin
      Application.MessageBox('Número de Parcela Inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;
    end;

    if cdsParcelasVALOR.AsCurrency < 0.01 then
    begin
      Application.MessageBox('Valor da Parcela Inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
      abort;
    end;

    //  Avança para o próximo registro
    cdsParcelas.Next;

  end;

   //  Posiciona no primeiro registro do cds
  cdsParcelas.First;

  //  Gravando Parcelas
  while not cdsParcelas.Eof do
  begin

    if dmCPagar.cdsCPagar.State in [dsBrowse, dsInactive] then
    begin
      dmCPagar.cdsCPagar.Insert;
    end;

    dmCPagar.GeraCodigo;
    dmCPagar.cdsCPagarDATA_CADASTRO.AsDateTime   := now;
    dmCPagar.cdsCPagarSTATUS.AsString            := 'A';
    dmCPagar.cdsCPagarVALOR_ABATIDO.AsCurrency   := 0;
    dmCPagar.cdsCPagarNUMERO_DOC.AsString        := cdsParcelasDOCUMENTO.AsString;
    dmCPagar.cdsCPagarDESCRICAO.AsString         := Format('%s - Parcela %d', [memDesc.Text, cdsParcelasPARCELA.AsInteger]);
    dmCPagar.cdsCPagarVALOR_COMPRA.AsCurrency    := ValorCompra;
    dmCPagar.cdsCPagarDATA_COMPRA.AsDateTime     := dateCompra.Date;
    dmCPagar.cdsCPagarPARCELA.AsInteger          := cdsParcelasPARCELA.AsInteger;
    dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency   := cdsParcelasVALOR.AsCurrency;
    dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime := cdsParcelasVENCIMENTO.AsDateTime;
    dmCPagar.cdsCPagarPARCIAL.AsString           := 'N';
    dmCPagar.cdsCPagarID_FORNECEDOR.AsInteger    := IdFornecedor;

    if toggleFatura.State = tssOff then
    begin

      dmCPagar.cdsCPagarFATURA_CART.AsString := 'N';

    end
      else
      begin

        dmCPagar.cdsCPagarFATURA_CART.AsString := 'S';
        dmCPagar.cdsCPagarID_FATURA.AsString   := Trim(edtCodFatCartao.Text);

      end;

    //  Gravando no banco
    dmCPagar.cdsCPagar.Post;
    dmCPagar.cdsCPagar.ApplyUpdates(0);

    cdsParcelas.Next;

  end;

  Application.MessageBox('Parcelas Cadastradas com Sucesso!!', 'Atenção', MB_OK + MB_ICONINFORMATION);

  Pesquisar;

  CardPanelPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmContasPagar.CadParcelaUnica;
var
  Parcela : Integer;
  ValorCompra : Currency;
  ValorParcela : Currency;
  IdFornecedor : Integer;

begin

  //  Se for um novo registro irá gerar o código, status em aberto
  //  e setar 0 no valor abatido
  if DataSourceCPagar.State in [dsInsert] then
  begin

    //  gera a id
    dmCPagar.GeraCodigo;

    dmCPagar.cdsCPagarDATA_CADASTRO.AsDateTime := now;
    dmCPagar.cdsCPagarSTATUS.AsString          := 'A';
    dmCPagar.cdsCPagarVALOR_ABATIDO.AsCurrency := 0;

  end;

  //  Valida campos obrigatorios
  if Trim(memDesc.Text) = '' then
  begin
    memDesc.SetFocus;
    Application.MessageBox('Campo DESCRICAO não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToInt(edtFornecedor.Text, IdFornecedor) then
  begin

    edtFornecedor.SetFocus;
    Application.MessageBox('Campo FORNECEDOR não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if (not TryStrToCurr(edtValorCompra.Text, ValorCompra)) or (ValorCompra <= 0) then
  begin

    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if (not TryStrToInt(edtParcela.Text, Parcela)) or (Parcela <= 0) then
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

  if dateCompra.Date > Now then
  begin

    dateCompra.SetFocus;
    Application.MessageBox('Data de compra não pode ser maior que a data atual!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if not TryStrToCurr(edtValorParcela.Text, ValorParcela) then
  begin

    edtValorParcela.SetFocus;
    Application.MessageBox('Valor da parcela Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  //  Passando os dados para o dataset
  dmCPagar.cdsCPagarNUMERO_DOC.AsString        := Trim(edtNDoc.Text);
  dmCPagar.cdsCPagarDESCRICAO.AsString         := Trim(memDesc.Text);
  dmCPagar.cdsCPagarVALOR_COMPRA.AsCurrency    := ValorCompra;
  dmCPagar.cdsCPagarDATA_COMPRA.AsDateTime     := dateCompra.Date;
  dmCPagar.cdsCPagarPARCELA.AsInteger          := Parcela;
  dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency   := ValorParcela;
  dmCPagar.cdsCPagarPARCIAL.AsString           := 'N';
  dmCPagar.cdsCPagarID_FORNECEDOR.AsInteger    := IdFornecedor;

  //  Verifica se é fatura, se for a data de vcto
  //  será pega a da fatura
  if (toggleFatura.State = tssOn) and (edtCodFatCartao.Text <> '') then
  begin

      if CheckFatVirada.Checked then
      begin

        dateVencimento.Date := IncMonth(dateVencimento.Date, 1);

      end;

      dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime := EncodeDate(YearOf(dateVencimento.Date), MonthOf(dateVencimento.Date), DataVctoFat);

  end
  else
  begin

    dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime := dateVencimento.Date;

  end;



  if toggleFatura.State = tssOff then
  begin

    dmCPagar.cdsCPagarFATURA_CART.AsString := 'N';

  end
    else
    begin

      dmCPagar.cdsCPagarFATURA_CART.AsString := 'S';
      dmCPagar.cdsCPagarID_FATURA.AsString   := Trim(edtCodFatCartao.Text);

    end;


  //  Gravando no BD
  dmCPagar.cdsCPagar.Post;
  dmCPagar.cdsCPagar.ApplyUpdates(0);

end;

procedure TfrmContasPagar.CalcCpGrid;
var
  TotalCp: Currency;

begin

  TotalCp := 0;

  //  Percorre e soma
  with DBGrid1.DataSource.DataSet do
  begin

    //  Desativa o controle
    DisableControls;

    //  Posiciona no primeiro reg
    First;

    while not Eof do
    begin

      TotalCp := TotalCp + FieldByName('VALOR_PARCELA').AsCurrency;

      Next;

    end;

    //  Reativa o controle
    EnableControls;

    lblTotalCpGrid.Caption := TUtilitario.FormatoMoeda(TotalCp);

  end;

end;

procedure TfrmContasPagar.CalcQtdCpGrid;
var
  QtdCp: Integer;

begin

  QtdCp := 0;

  //  Realiza a conta
  QtdCp := DBGrid1.DataSource.DataSet.RecordCount;

  //  Exibe na label
  lblQtdCp.Caption := IntToStr(QtdCp);

end;

procedure TfrmContasPagar.cbDataClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.cbStatusClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.checkDiaFixoVctoClick(Sender: TObject);
begin
  inherited;

    if checkDiaFixoVcto.Checked then
  begin

    edtDiaFixoVcto.Visible   := True;
    edtDiaFixoVcto.Enabled   := True;
    lblDiaFixo.Visible       := True;
    edtIntervaloDias.Enabled := False;
    edtIntervaloDias.Text    := '30';
    Label9.Visible           := True;

    edtDiaFixoVcto.SetFocus;

  end
  else
  begin

    edtDiaFixoVcto.Visible   := False;
    edtDiaFixoVcto.Enabled   := False;
    lblDiaFixo.Visible       := False;
    edtIntervaloDias.Enabled := True;
    edtIntervaloDias.Clear;
    Label9.Visible           := False;

  end;


end;

procedure TfrmContasPagar.checkParciaisClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.DataSourceCPagarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  btnDetalhes.Enabled := DataSourceCPagar.DataSet.FieldByName('STATUS').AsString = 'P';
  btnBaixarCP.Enabled := DataSourceCPagar.DataSet.FieldByName('STATUS').AsString = 'A';

end;

procedure TfrmContasPagar.dateFinalChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.dateInicialChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarRegCPagar;

end;

procedure TfrmContasPagar.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmContasPagar.EditarRegCPagar;
begin

  edtParcela.Enabled      := True;
  edtValorParcela.Enabled := True;

  //  Esvaziando data set de parcelas
  cdsParcelas.EmptyDataSet;

  //  Se o documento já foi baixado cancela a edição
  if dmCPagar.cdsCPagarSTATUS.AsString = 'P' then
  begin

    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já pago não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
    
  end;

  //  Se o documento foi cancelado, a edição é cancelada
  if dmCPagar.cdsCPagarSTATUS.AsString = 'C' then
  begin
    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento já cancelado não pode ser alterado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
 
  end;

  // Coloca o dataset em modo de edição
  dmCPagar.cdsCPagar.Edit;

  // Coloca o numero do registro no titulo
  lblTitulo.Caption := 'Alterando Registro Nº ' + dmCPagar.cdsCPagarID.AsString;

  //  Bloqueia o toogle de parcelamento
  toggleParcelamento.Enabled  := False;
  toggleParcelamento.State    := tssOff;
  CardPanelParcela.ActiveCard := cardParcelaUnica;
  edtParcela.ReadOnly         := True;
  CheckFatVirada.Visible      := False;

  edtValorParcela.ReadOnly := False;

  //  Carrega os dados
  edtNDoc.Text         := dmCPagar.cdsCPagarNUMERO_DOC.AsString;
  memDesc.Text         := dmCPagar.cdsCPagarDESCRICAO.AsString;
  edtValorCompra.Text  := TUtilitario.FormatarValor(dmCPagar.cdsCPagarVALOR_COMPRA.AsCurrency);
  edtParcela.Text      := dmCPagar.cdsCPagarPARCELA.AsString;
  edtValorParcela.Text := TUtilitario.FormatarValor(dmCPagar.cdsCPagarVALOR_PARCELA.AsString);
  dateVencimento.Date  := dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime;
  dateCompra.Date      := dmCPagar.cdsCPagarDATA_COMPRA.AsDateTime;
  edtFornecedor.Text   := dmCPagar.cdsCPagarID_FORNECEDOR.AsString;

  //  Verifica se a CP foi vinculado a uma fatura de cartão
  if dmCPagar.cdsCPagarFATURA_CART.AsString = 'S' then
  begin

    toggleFatura.State       := tssOn;
    lblCodFatCartao.Visible  := True;
    lblNomeFatCartao.Visible := True;
    edtCodFatCartao.Visible  := True;
    btnPesqFat.Visible       := True;

    edtCodFatCartao.Text := dmCPagar.cdsCPagarID_FATURA.AsString;
    BuscaNomeFatCartao;

  end
    else
    begin

      toggleFatura.State    := tssOff;
      edtCodFatCartao.Clear;

    end;


  BuscaNomeFornecedor;

end;

procedure TfrmContasPagar.edtCodFatCartaoExit(Sender: TObject);
begin
  inherited;

  BuscaNomeFatCartao;

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    if dmFaturaCartao.GetStatusFatCartao(Trim(edtCodFatCartao.Text)) = False then
    begin

      edtCodFatCartao.Clear;
      edtCodFatCartao.SetFocus;
      lblNomeFatCartao.Caption := '';
      Application.MessageBox('Fatura de Cartão não está Ativa, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;

  end;

  if toggleParcelamento.State = tssOn then
  begin

    FatCartaoAtiva;

  end;

  if edtQtdParcelas.Text <> '' then
  begin

    GeraParcelas;

  end;

end;

procedure TfrmContasPagar.edtFiltroFatCartaoChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.edtFiltroFornecedorChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.edtFornecedorExit(Sender: TObject);
begin
  inherited;

  BuscaNomeFornecedor;

  if Trim(edtFornecedor.Text) <> '' then
  begin

    if dmFornecedores.GetStatus(Trim(edtFornecedor.Text)) = False then
    begin

      edtFornecedor.Clear;
      edtFornecedor.SetFocus;
      lblNomeFornecedor.Caption := '';
      Application.MessageBox('Fornecedor não está Ativo, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;


  end;

end;


procedure TfrmContasPagar.edtPesquisarChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.edtValorCompraExit(Sender: TObject);
begin
  inherited;

  edtValorCompra.Text := TUtilitario.FormatarValor(edtValorCompra.Text);

  if dmCPagar.cdsCPagar.State in [dsInsert] then
  begin

    //  Se ao inserir Parcela unica pega o mesmo valor da venda
    edtValorParcela.Text := TUtilitario.FormatarValor(edtValorCompra.Text);

  end;

end;

procedure TfrmContasPagar.edtValorParcelaExit(Sender: TObject);
begin
  inherited;
  edtValorParcela.Text := TUtilitario.FormatarValor(edtValorParcela.Text);

end;

procedure TfrmContasPagar.ExibeDetalhe;
begin

  // cria o form
  frmCpDetalhe := TfrmCpDetalhe.Create(Self);
  try

    frmCpDetalhe.ExibirCPDetalhes(DataSourceCPagar.DataSet.FieldByName('ID').AsInteger);

    //  Exibe o form
    frmCpDetalhe.ShowModal;

  finally

    FreeAndNil(frmCpDetalhe);

  end;


end;

procedure TfrmContasPagar.ExibeTelaBaixar;
begin

  // Cria o form
  frmBaixarCP := TfrmBaixarCP.Create(Self);

  try

    frmBaixarCP.BaixarCP(DataSourceCPagar.DataSet.FieldByName('ID').AsInteger);

    //  Exibe o form
    frmBaixarCP.ShowModal;

  finally

    FreeAndNil(frmBaixarCP);

  end;


  Pesquisar;

  //  Atualiza relatorio tela principal
  frmPrincipal.TotalCP;
  frmPrincipal.ResumoMensalCaixa;

end;

procedure TfrmContasPagar.ExibeTelaBxMultipla;
begin

   // Cria o form
  frmBxMultiplaCP := TfrmBxMultiplaCP.Create(Self);

  try

    //  Exibe o form
    frmBxMultiplaCP.ShowModal;

  finally

    FreeAndNil(frmBxMultiplaCP);

  end;

  Pesquisar;

  //  Atualiza relatorio tela principal
  frmPrincipal.TotalCP;
  frmPrincipal.ResumoMensalCaixa;

end;

procedure TfrmContasPagar.FatCartaoAtiva;
begin

  if toggleFatura.State = tssOn then
  begin

    checkDiaFixoVcto.Checked := True;
    checkDiaFixoVcto.Enabled := False;
    edtDiaFixoVcto.Text      := IntToStr(DataVctoFat);
    edtDiaFixoVcto.Enabled   := False;

  end;

end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;

  edtValorCompra.OnKeyPress  := KeyPressValor;
  edtValorParcela.OnKeyPress := KeyPressValor;


  //  Define as datas da consulta
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);



end;

procedure TfrmContasPagar.GeraParcelas;
var
  QtdParcelas   : Integer;
  IntervaloDias : Integer;
  ValorCompra   : Currency;
  ValorParcela  : Currency;
  ValorResiduo  : Currency;
  Contador      : Integer;
  AuxContador   : Integer;
  DiaFixoVcto   : Integer;

begin

  //  Valida campos
  if (not TryStrToCurr(edtValorCompra.Text, ValorCompra)) or (ValorCompra <= 0) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if dateCompra.Date > Now then
  begin

    dateCompra.SetFocus;
    Application.MessageBox('Data de compra não pode ser maior que a data atual!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if not TryStrToInt(edtQtdParcelas.Text, QtdParcelas) then
  begin
    edtQtdParcelas.SetFocus;
    Application.MessageBox('Números de Parcelas Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if QtdParcelas <= 1 then
  begin
    edtQtdParcelas.SetFocus;
    Application.MessageBox('Para gerar parcelas a quantidade deve ser maior que 1!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;


  if not TryStrToInt(edtIntervaloDias.Text, IntervaloDias) then
  begin
    edtIntervaloDias.SetFocus;
    Application.MessageBox('Intervalo de dias Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if checkDiaFixoVcto.Checked then
  begin
    if (not TryStrToInt(edtDiaFixoVcto.Text, DiaFixoVcto)) or (DiaFixoVcto > 28)  or (DiaFixoVcto < 1) then
    begin
        edtDiaFixoVcto.SetFocus;
        Application.MessageBox('Dia fixo de vencimento Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;
    end;
  end;

  //  Calculando valores das parcelas
  //  Trunca o valor final das parcelas
  ValorParcela := (Trunc(ValorCompra / QtdParcelas * 100) / 100);

  //  Calcula o valor do residuo do Trunc para colocar em uma das parcelas
  ValorResiduo := ValorCompra - (ValorParcela * QtdParcelas);

  //  Esvaziando data set
  cdsParcelas.EmptyDataSet;

  AuxContador := 1;

  for Contador := 1 to QtdParcelas do
  begin

    cdsParcelas.Insert;
    cdsParcelasPARCELA.AsInteger := Contador;

    //  Adiciona o valor do residuo na primeira parcela
    cdsParcelasVALOR.AsCurrency  := ValorParcela + ValorResiduo;
    ValorResiduo := 0;  //  Zera o valor de residuo



    //  Define a data de vencimento
    //  Se for fatura, sera pego o dia de vcto
    //  a data cadastrada na fatura
    if (toggleFatura.State = tssOn) and (edtCodFatCartao.Text <> '') then
    begin

      FatCartaoAtiva;

      if (CheckFatVirada.Checked) and (AuxContador = 1) then
      begin

        Inc(AuxContador);

      end;

      cdsParcelasVENCIMENTO.AsDateTime := EncodeDate(YearOf(IncDay(dateCompra.Date, IntervaloDias *  AuxContador)), MonthOf(IncDay(dateCompra.Date, 30 *  AuxContador)), DataVctoFat);

    end
    else
    begin

      //  Se tiver dia de vencimento fixo
      if checkDiaFixoVcto.Checked then
      begin

        cdsParcelasVENCIMENTO.AsDateTime := EncodeDate(YearOf(IncDay(dateCompra.Date, IntervaloDias *  AuxContador)), MonthOf(IncDay(dateCompra.Date, 30 *  AuxContador)), DiaFixoVcto);

      end
      else
      begin
        cdsParcelasVENCIMENTO.AsDateTime := IncDay(dateCompra.Date, IntervaloDias *  AuxContador);
      end;

    end;


    //  Define o numero do doc
    if not (edtNDoc.Text = '') then
    begin
      cdsParcelasDocumento.AsString := Trim(edtNDoc.Text) + '-' + IntToStr(Contador);
    end;

    cdsParcelas.Post;

    Inc(AuxContador);

  end;

  //  Bloqueios
  edtQtdParcelas.Enabled   := False;
  edtIntervaloDias.Enabled := False;
  edtDiaFixoVcto.Enabled   := False;
  checkDiaFixoVcto.Enabled := False;
  btnGerar.Enabled         := False;
  btnLimpar.Enabled        := True;

end;

procedure TfrmContasPagar.HabilitaBotoes;
begin

  btnAlterar.Enabled  := not DataSourceCPagar.DataSet.IsEmpty;
  btnExcluir.Enabled  := not DataSourceCPagar.DataSet.IsEmpty;
  btnBaixarCP.Enabled := not DataSourceCPagar.DataSet.IsEmpty;
  btnDetalhes.Enabled := not DataSourceCPagar.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceCPagar.DataSet.IsEmpty;

end;

procedure TfrmContasPagar.KeyPressValor(Sender: TObject; var Key: Char);
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

procedure TfrmContasPagar.Pesquisar;
var
  LFiltroEdit: String;
  LFiltro    : String;
  LOrdem     : String;

begin

  //  Validações
  if dateInicial.Date > dateFinal.Date then
  begin

    dateFinal.SetFocus;
    Application.MessageBox('Data Inicial não pode ser maior que a data Final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbStatus.ItemIndex < 0 then
  begin

    cbStatus.SetFocus;
    Application.MessageBox('Selecione um tipo de STATUS!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbData.ItemIndex < 0 then
   begin

    cbData.SetFocus;
    Application.MessageBox('Selecione um tipo de DATA!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro     := '';
  LOrdem      := '';

  //  Limpa os parametros do cds
  dmCPagar.cdsCPagar.Params.Clear;

  //  Pesquisa por tipo
  case cbStatus.ItemIndex of
    1 : LFiltro := LFiltro + ' AND CP.STATUS = ''P'' ';
    2 : LFiltro := LFiltro + ' AND CP.STATUS = ''A'' ';
    3 : LFiltro := LFiltro + ' AND CP.STATUS = ''C'' ';
  end;

  //  Pesquisa por data
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin

    case cbData.ItemIndex of

      0 : LFiltro := LFiltro + ' AND CP.DATA_COMPRA BETWEEN :DTINI AND :DTFIM ';
      1 : LFiltro := LFiltro + ' AND CP.DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';
      2 : LFiltro := LFiltro + ' AND CP.DATA_PAGAMENTO BETWEEN :DTINI AND :DTFIM ';

    end;


    //  Criando os parametros
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftDate, 'DTINI', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('DTINI').AsDate := dateInicial.Date;
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftDate, 'DTFIM', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('DTFIM').AsDate := dateFinal.Date;

  end;

   //  Pesquisa parciais
    if checkParciais.Checked then
    begin

      LFiltro := LFiltro + ' AND CP.PARCIAL = ''S'' ';

    end;

    //  Pesquisa vencidas
    if checkVencidas.Checked then
    begin

      LFiltro := LFiltro + ' AND CP.STATUS = ''A'' AND CP.DATA_VENCIMENTO < :DATUAL ';

      //  Criando os parametros
      dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftDate, 'DATUAL', TParamType.ptInput);
      dmCPagar.cdsCPagar.ParamByName('DATUAL').AsDate := NOW;

    end;

  //  Pesquisa por FORNECEDORES
  if Trim(edtFiltroFornecedor.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FORNECEDOR = :ID ';

    //  Criando os parametros
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftString, 'ID', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('ID').AsString := Trim(edtFiltroFornecedor.Text);

  end;

  //  Pesquisa por Fatura de Cartao
  if Trim(edtFiltroFatCartao.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FATURA = :ID_FT ';

    //  Criando os parametros
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftString, 'ID_FT', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('ID_FT').AsString := Trim(edtFiltroFatCartao.Text);

  end;

  //  Ordem de pesquisa
  if rbId.Checked then
  begin
    lOrdem := ' ORDER BY CP.ID DESC';
  end
    else if rbDataVenc.Checked then
    begin
      lOrdem := ' ORDER BY CP.DATA_VENCIMENTO';
    end
      else if rbValorParcela.Checked then
      begin
        lOrdem := ' ORDER BY CP.VALOR_PARCELA DESC';
      end
        else if rbValorCompra.Checked then
        begin
          lOrdem := ' ORDER BY CP.VALOR_COMPRA DESC';
        end
          else if rbDataCompra.Checked then
          begin
            lOrdem := ' ORDER BY CP.DATA_COMPRA DESC';
          end
            else
            begin
              lOrdem := ' ORDER BY CP.ID DESC';
            end;

  dmCPagar.cdsCPagar.Close;
  dmCPagar.cdsCPagar.CommandText := 'SELECT CP.*, F.RAZAO_SOCIAL FROM CONTAS_PAGAR CP ' +
                                    'LEFT JOIN FORNECEDORES F ON CP.ID_FORNECEDOR = F.ID_FORNEC WHERE 1 = 1 ' +
                                    LFiltroEdit + LFiltro + lOrdem;
  dmCPagar.cdsCPagar.Open;


  HabilitaBotoes;

  //  Calcula a quantidade e valor
  CalcCpGrid;
  CalcQtdCpGrid;

  //  Posiciona no primeiro registro
  DataSourceCPagar.DataSet.First;

  inherited;

end;

procedure TfrmContasPagar.rbDataCompraClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.rbDataVencClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.rbIdClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.rbValorCompraClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.rbValorParcelaClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmContasPagar.toggleFaturaClick(Sender: TObject);
begin
  inherited;

  if toggleFatura.State = tssOff then
  begin

    //  Oculta as info de fatura
    lblCodFatCartao.Visible  := False;
    lblNomeFatCartao.Visible := False;
    edtCodFatCartao.Visible  := False;
    btnPesqFat.Visible       := False;

    DataVctoFat := 0;

    if toggleParcelamento.State = tssOn then
    begin

      checkDiaFixoVcto.Checked := False;
      checkDiaFixoVcto.Enabled := True;
      edtDiaFixoVcto.Clear;
      edtDiaFixoVcto.Enabled   := True;

    end;

    pnlAviso.Visible := False;
    CheckFatVirada.Visible := False;

  end
    else if toggleFatura.State = tssOn then
         begin

          //  Oculta as info de fatura
          lblCodFatCartao.Visible := True;
          edtCodFatCartao.Visible := True;
          btnPesqFat.Visible      := True;

          edtCodFatCartao.SetFocus;

          pnlAviso.Visible := True;

          if not (dmCPagar.cdsCPagar.State in [dsEdit]) then
            CheckFatVirada.Visible := True;

         end;


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

          FatCartaoAtiva;

         end;
end;

end.
