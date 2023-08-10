unit SistemaFinanceiro.View.CPagar;
interface
uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.WinXCtrls, Datasnap.DBClient, System.SysUtils,
  SistemaFinanceiro.View.BaixarCP, Vcl.Menus;
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

  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure CadParcelaUnica;
    procedure CadParcelamento;
    procedure EditarRegCPagar;
    procedure ExibeTelaBaixar;

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
  System.DateUtils, SistemaFinanceiro.View.Principal;

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

procedure TfrmContasPagar.btnCancelarClick(Sender: TObject);
begin

  inherited;
  //  Cancelando inclusão
  dmCPagar.cdsCPagar.Cancel;

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
  ValorParcela := (Trunc(ValorCompra / QtdParcelas * 100) / 100);

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

    //  Define o numero do doc
    if not (edtNDoc.Text = '') then
    begin
      cdsParcelasDocumento.AsString := Trim(edtNDoc.Text) + '-' + IntToStr(Contador);
    end;

    cdsParcelas.Post;

  end;

  //  Bloqueia os edits
  edtQtdParcelas.Enabled := False;
  edtIntervaloDias.Enabled := False;

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

  toggleParcelamento.State := tssOff;
  toggleParcelamento.Enabled := True;

  edtParcela.Enabled := False;
  edtValorParcela.Enabled := False;

  //  Seta parcela previamente como 1
  edtParcela.Text := '1';

  //  Esvaziando data set de parcelas
  cdsParcelas.EmptyDataSet;

end;

procedure TfrmContasPagar.btnLimparClick(Sender: TObject);
begin
  inherited;

  //  Esvaziando data set de parcelas
  cdsParcelas.EmptyDataSet;

  //  Libera os edits
  edtQtdParcelas.Enabled := True;
  edtIntervaloDias.Enabled := True;

  edtQtdParcelas.Text := '';
  edtIntervaloDias.Text := '';

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
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista
  Pesquisar;
  inherited;

  //  Atualiza relatorio tela principal
  frmPrincipal.TotalCP;

end;

procedure TfrmContasPagar.CadParcelamento;
var
  ValorCompra : Currency;

begin

  //  Valida valor da compra
  if not TryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin
  
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
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

    //  Se for parcela unica pega o mesmo valor da compra
//    edtValorParcela.Text := edtValorCompra.Text;


  end;

  //  Valida campos obrigatorios
  if Trim(memDesc.Text) = '' then
  begin
    memDesc.SetFocus;
    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
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

  //  Passando os dados para o dataset
  dmCPagar.cdsCPagarNUMERO_DOC.AsString        := Trim(edtNDoc.Text);
  dmCPagar.cdsCPagarDESCRICAO.AsString         := Trim(memDesc.Text);
  dmCPagar.cdsCPagarVALOR_COMPRA.AsCurrency    := ValorCompra;
  dmCPagar.cdsCPagarDATA_COMPRA.AsDateTime     := dateCompra.Date;
  dmCPagar.cdsCPagarPARCELA.AsInteger          := Parcela;
  dmCPagar.cdsCPagarVALOR_PARCELA.AsCurrency   := ValorParcela;
  dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime := dateVencimento.Date;

  //  Gravando no BD
  dmCPagar.cdsCPagar.Post;
  dmCPagar.cdsCPagar.ApplyUpdates(0);

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

  edtParcela.Enabled := True;
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

  //  Bloqueia o toogle
  toggleParcelamento.Enabled  := False;
  toggleParcelamento.State    := tssOff;
  CardPanelParcela.ActiveCard := cardParcelaUnica;

  //  Carrega os dados
  edtNDoc.Text         := dmCPagar.cdsCPagarNUMERO_DOC.AsString;
  memDesc.Text         := dmCPagar.cdsCPagarDESCRICAO.AsString;
  edtValorCompra.Text  := TUtilitario.FormatarValor(dmCPagar.cdsCPagarVALOR_COMPRA.AsCurrency);
  edtParcela.Text      := dmCPagar.cdsCPagarPARCELA.AsString;
  edtValorParcela.Text := TUtilitario.FormatarValor(dmCPagar.cdsCPagarVALOR_PARCELA.AsString);
  dateVencimento.Date  := dmCPagar.cdsCPagarDATA_VENCIMENTO.AsDateTime;
  dateCompra.Date      := dmCPagar.cdsCPagarDATA_COMPRA.AsDateTime;

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

procedure TfrmContasPagar.ExibeTelaBaixar;
begin

  frmBaixarCP.BaixarCP(DataSourceCPagar.DataSet.FieldByName('ID').AsInteger);
  Pesquisar;

  //  Atualiza relatorio tela principal
  frmPrincipal.TotalCP

end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;

  edtValorCompra.OnKeyPress  := TUtilitario.KeyPressValor;
  edtValorParcela.OnKeyPress := TUtilitario.KeyPressValor;

  //  Define as datas da consulta
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);

end;

procedure TfrmContasPagar.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCPagar.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCPagar.DataSet.IsEmpty;
  btnBaixarCP.Enabled := not DataSourceCPagar.DataSet.IsEmpty;

end;
procedure TfrmContasPagar.Pesquisar;
var
  LFiltroEdit: String;
  LFiltro : String;
  LOrdem : String;

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
  LFiltro := '';
  LOrdem := '';

  dmCPagar.cdsCPagar.Params.Clear;

  //  Pesquisa por tipo
  case cbStatus.ItemIndex of
    1 : LFiltro := LFiltro + ' AND STATUS = ''P'' ';
    2 : LFiltro := LFiltro + ' AND STATUS = ''A'' ';
    3 : LFiltro := LFiltro + ' AND STATUS = ''C'' ';
  end;

  //  Pesquisa por data
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin

    case cbData.ItemIndex of

      0 : LFiltro := LFiltro + ' AND DATA_COMPRA BETWEEN :DTINI AND :DTFIM ';
      1 : LFiltro := LFiltro + ' AND DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';
      2 : LFiltro := LFiltro + ' AND DATA_PAGAMENTO BETWEEN :DTINI AND :DTFIM ';
      3 : LFiltro := LFiltro + ' AND DATA_CADASTRO BETWEEN :DTINI AND :DTFIM ';

    end;

    //  Criando os parametros
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftDate, 'DTINI', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('DTINI').AsDate := dateInicial.Date;
    dmCPagar.cdsCPagar.Params.CreateParam(TFieldType.ftDate, 'DTFIM', TParamType.ptInput);
    dmCPagar.cdsCPagar.ParamByName('DTFIM').AsDate := dateFinal.Date;
  end;

  //  Ordem de pesquisa
  if rbId.Checked then
  begin
    lOrdem := ' ORDER BY ID DESC';
  end
    else if rbDataVenc.Checked then
    begin
      lOrdem := ' ORDER BY DATA_VENCIMENTO';
    end
      else if rbValorParcela.Checked then
      begin
        lOrdem := ' ORDER BY VALOR_PARCELA';
      end
        else if rbValorCompra.Checked then
        begin
          lOrdem := ' ORDER BY VALOR_COMPRA';
        end
          else if rbDataCompra.Checked then
          begin
            lOrdem := ' ORDER BY DATA_COMPRA';
          end
            else
            begin
              lOrdem := ' ORDER BY ID DESC';
            end;

  dmCPagar.cdsCPagar.Close;
  dmCPagar.cdsCPagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE 1 = 1 ' + LFiltroEdit + LFiltro + lOrdem;
  dmCPagar.cdsCPagar.Open;
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
