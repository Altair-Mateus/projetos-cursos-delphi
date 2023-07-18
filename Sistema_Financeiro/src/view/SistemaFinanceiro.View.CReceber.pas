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

procedure TfrmContasReceber.CadParcelamento;
begin

end;

procedure TfrmContasReceber.CadParcelaUnica;
begin

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
