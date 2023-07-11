unit SistemaFinanceiro.View.CPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.WinXCtrls;

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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
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

uses SistemaFinanceiro.Model.dmCPagar, SistemaFinanceiro.Utilitarios;

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
    DataModuleCPagar.ClientDataSetCPagar.Delete;
    DataModuleCPagar.ClientDataSetCPagar.ApplyUpdates(0);

  except on E: Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir registro!', MB_OK + MB_ICONERROR);

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

  inherited;

end;

procedure TfrmContasPagar.CadParcelamento;
begin

end;

procedure TfrmContasPagar.CadParcelaUnica;
begin

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
  edtNDoc.Text := DataModuleCPagar.ClientDataSetCPagarNUMERO_DOC.AsString;
  memDesc.Text := DataModuleCPagar.ClientDataSetCPagarDESCRICAO.AsString;
  edtValorCompra.Text := DataModuleCPagar.ClientDataSetCPagarVALOR_COMPRA.AsString;
  edtParcela.Text := DataModuleCPagar.ClientDataSetCPagarPARCELA.AsString;
  edtValorParcela.Text := DataModuleCPagar.ClientDataSetCPagarVALOR_PARCELA.AsString;
  dateVencimento.Date := DataModuleCPagar.ClientDataSetCPagarDATA_VENCIMENTO.AsDateTime;
  dateCompra.Date := DataModuleCPagar.ClientDataSetCPagarDATA_COMPRA.AsDateTime;


end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;

  CardPanelParcela.ActiveCard := cardParcelaUnica;

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
