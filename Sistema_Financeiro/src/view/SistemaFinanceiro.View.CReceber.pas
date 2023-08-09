unit SistemaFinanceiro.View.CReceber;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.ComCtrls, Datasnap.DBClient,
  Vcl.Menus, SistemaFinanceiro.View.BaixarCR;
type
  TfrmContasReceber = class(TfrmCadastroPadrao)
    DataSourceCReceber: TDataSource;
    CardPanelParcela: TCardPanel;
    cardParcelaUnica: TCard;
    lblParcela: TLabel;
    lblValorParcela: TLabel;
    lblVencimento: TLabel;
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
    edtNDoc: TEdit;
    lblNDoc: TLabel;
    PopupMenu1: TPopupMenu;
    Baixar1: TMenuItem;
    gbFiltros: TGroupBox;
    rbDataVenc: TRadioButton;
    rbValorParcela: TRadioButton;
    lblDataInicial: TLabel;
    dateInicial: TDateTimePicker;
    lblDataFinal: TLabel;
    dateFinal: TDateTimePicker;
    cbData: TComboBox;
    lblData: TLabel;
    rbValorVenda: TRadioButton;
    rbDataVenda: TRadioButton;
    btnBaixarCR: TButton;
    rbId: TRadioButton;
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
    procedure btnBaixarCRClick(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);

  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure EditarRegCReceber;
    procedure CadParcelaUnica;
    procedure CadParcelamento;
    procedure ExibeTelaBaixar;

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

procedure TfrmContasReceber.Baixar1Click(Sender: TObject);
begin
  inherited;

  ExibeTelaBaixar;

end;

procedure TfrmContasReceber.btnAlterarClick(Sender: TObject);
begin

  inherited;
  EditarRegCReceber;

end;

procedure TfrmContasReceber.btnBaixarCRClick(Sender: TObject);
begin
  inherited;

  ExibeTelaBaixar;

end;

procedure TfrmContasReceber.btnCancelarClick(Sender: TObject);
begin

  inherited;

  //  Cancelando inclus�o
  dmCReceber.cdsCReceber.Cancel;

end;
procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
var
  Option : Word;
begin

  //  Se o documento j� foi baixado cancela a exclus�o
  if dmCReceber.cdsCReceberSTATUS.AsString = 'B' then
  begin
    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento j� baixado n�o pode ser cancelado!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  //  Se o documento foi cancelado, a exclus�o � cancelada
  if dmCReceber.cdsCReceberSTATUS.AsString = 'C' then
  begin
    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento j� cancelado n�o pode ser cancelado!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  option := Application.MessageBox('Deseja cancelar o registro? ', 'Confirma��o', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try
    dmCReceber.cdsCReceber.Edit;
    dmCReceber.cdsCReceberSTATUS.AsString := 'C';
    dmCReceber.cdsCReceber.Post;
    dmCReceber.cdsCReceber.ApplyUpdates(0);

    Application.MessageBox('Documento cancelado com sucesso!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
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
    Application.MessageBox('Valor da Venda Inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToInt(edtQtdParcelas.Text, QtdParcelas) then
  begin
    edtQtdParcelas.SetFocus;
    Application.MessageBox('Quantidade de Parcelas Inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToInt(edtIntervaloDias.Text, IntervaloDias) then
  begin
    edtIntervaloDias.SetFocus;
    Application.MessageBox('Intervalor de dias Inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
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

    //  Define o numero do documento
    cdsParcelasDocumento.AsString := Trim(edtNDoc.Text) + '-' + IntToStr(Contador);

    cdsParcelas.Post;

  end;

end;

procedure TfrmContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;

  //  Atualiza titulo
  lblTitulo.Caption := 'Inserindo novo Lan�amento no Contas a Receber';

  if not (dmCReceber.cdsCReceber.State in [dsInsert, dsEdit]) then
  begin

    //  Coloca o dataset em modo de inser��o de dados
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
    Application.MessageBox('Valor da Venda inv�lido!', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  //  Posiciona no reg 1 do cds
  cdsParcelas.First;

  //  Valida todos os reg do cds
  while not cdsParcelas.Eof do
  begin
    if cdsParcelasParcela.AsInteger < 0 then
    begin
      Application.MessageBox('N�mero de Parcela inv�lido!', 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    if cdsParcelasValor.AsCurrency < 0.01 then
    begin
      Application.MessageBox('Valor da Parcela inv�lido!', 'Aten��o', MB_OK + MB_ICONWARNING);
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

  Application.MessageBox('Parcelas Cadastradas com Sucesso!!', 'Aten��o', MB_OK + MB_ICONINFORMATION);

  Pesquisar;

  CardPanelPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmContasReceber.CadParcelaUnica;
var
  Parcela : Integer;
  ValorVenda : Currency;
  ValorParcela : Currency;

begin

  //  Se for um novo registro ir� gerar o c�digo, status em aberto
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

  //  Valida Campos obrigat�rios
  if Trim(memDesc.text) = '' then
  begin
    memDesc.SetFocus;
    Application.MessageBox('Campo Descri��o n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToCurr(edtValorVenda.Text, ValorVenda) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da Venda inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if dateVencimento.Date < dateVenda.Date then
  begin
    dateVencimento.SetFocus;
    Application.MessageBox('Data de vencimento n�o pode ser inferior a data de venda!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToCurr(edtValorParcela.Text, ValorParcela) then
  begin
    edtValorParcela.SetFocus;
    Application.MessageBox('Valor da Parcela inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToInt(edtParcela.Text, Parcela) then
  begin
    edtParcela.SetFocus;
    Application.MessageBox('N�mero da Parcela inv�lido!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
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
    DBGrid1.Canvas.Font.Color := clRed;  // Define a cor do texto da c�lula
  end;

  //  Altera a cor das duplicatas pagas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'P')then
  begin
    DBGrid1.Canvas.Font.Color := clHotLight;  // Define a cor do texto da c�lula
  end;

  //  Altera a cor das duplicatas canceladas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'C')then
  begin
    DBGrid1.Canvas.Font.Color := $00E68AE5;  // Define a cor do texto da c�lula
  end;

  // Desenha a c�lula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  inherited;

end;

procedure TfrmContasReceber.EditarRegCReceber;
begin

  //  Esvazia o cds
  cdsParcelas.EmptyDataSet;

  //  Se o documento j� foi baixado cancela a edi��o
  if dmCReceber.cdsCReceberSTATUS.AsString = 'B' then
  begin
    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento j� baixado n�o pode ser alterado!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  //  Se o documento foi cancelado, a edi��o � cancelada
  if dmCReceber.cdsCReceberSTATUS.AsString = 'C' then
  begin
    CardPanelPrincipal.ActiveCard := CardPesquisa;
    Application.MessageBox('Documento j� cancelado n�o pode ser alterado!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  // Coloca o dataset em modo de edi��o
  dmCReceber.cdsCReceber.Edit;

  // Coloca o numero do registro no titulo
  lblTitulo.Caption := 'Alterando Registro N� ' + dmCReceber.cdsCReceberID.AsString;

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

procedure TfrmContasReceber.ExibeTelaBaixar;
begin

 frmBaixarCR.BaixarCR(DataSourceCReceber.DataSet.FieldByName('ID').AsInteger);
 Pesquisar;

end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  edtValorVenda.OnKeyPress   := TUtilitario.KeyPressValor;
  edtValorParcela.OnKeyPress := TUtilitario.KeyPressValor;

  //  Define as datas da consulta
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);
end;

procedure TfrmContasReceber.HabilitaBotoes;
begin
  btnAlterar.Enabled := not DataSourceCReceber.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCReceber.DataSet.IsEmpty;

end;

procedure TfrmContasReceber.Pesquisar;
var
  LFiltroEdit: String;
  LFiltro : String;
  LOrdem : String;
begin

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro := '';
  LOrdem := '';

  dmCReceber.cdsCReceber.Params.Clear;

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

      0 : LFiltro := LFiltro + ' AND DATA_VENDA BETWEEN :DTINI AND :DTFIM ';
      1 : LFiltro := LFiltro + ' AND DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';
      2 : LFiltro := LFiltro + ' AND DATA_RECEBIMENTO BETWEEN :DTINI AND :DTFIM ';
      3 : LFiltro := LFiltro + ' AND DATA_CADASTRO BETWEEN :DTINI AND :DTFIM ';

    end;

    //  Criando os parametros
    dmCReceber.cdsCReceber.Params.CreateParam(TFieldType.ftDate, 'DTINI', TParamType.ptInput);
    dmCReceber.cdsCReceber.ParamByName('DTINI').AsDate := dateInicial.Date;
    dmCReceber.cdsCReceber.Params.CreateParam(TFieldType.ftDate, 'DTFIM', TParamType.ptInput);
    dmCReceber.cdsCReceber.ParamByName('DTFIM').AsDate := dateFinal.Date;
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
        else if rbValorVenda.Checked then
        begin
          lOrdem := ' ORDER BY VALOR_VENDA';
        end
          else if rbDataVenda.Checked then
          begin
            lOrdem := ' ORDER BY DATA_VENDA';
          end
            else
            begin
              lOrdem := ' ORDER BY ID DESC';
            end;




  dmCReceber.cdsCReceber.Close;
  dmCReceber.cdsCReceber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE 1 = 1 ' + LFiltroEdit + LFiltro + LOrdem;
  dmCReceber.cdsCReceber.Open;

  HabilitaBotoes;


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
