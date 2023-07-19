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

procedure TfrmContasReceber.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclusão
  dmCReceber.cdsCReceber.Cancel;

end;

procedure TfrmContasReceber.btnGerarClick(Sender: TObject);
var
  QtdParcelas   : Integer;
  IntervaloDias : Integer;
  ValorVenda   : Currency;
  ValorParcela  : Currency;
  ValorResiduo  : Currency;
  Contador      : Integer;

begin


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
  cdsParcelas.IsEmpty;

end;

procedure TfrmContasReceber.btnLimparClick(Sender: TObject);
begin
  inherited;

  //  Esvazia o dataset das parcelas
  cdsParcelas.IsEmpty;

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

procedure TfrmContasReceber.EditarRegCReceber;
begin

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

begin

  dmCReceber.cdsCReceber.Close;
  dmCReceber.cdsCReceber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE 1 = 1 ' + LFiltroPesquisa + ' ORDER BY 1 DESC';
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
