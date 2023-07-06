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
    Edit1: TEdit;
    Edit3: TEdit;
    lblValorParcela: TLabel;
    dateVencimento: TDateTimePicker;
    lblVencimento: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    Label2: TLabel;
    btnGerar: TButton;
    btnLimpar: TButton;
    DBGridParcelas: TDBGrid;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
    procedure HabilitaBotoes;

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

  memDesc.SetFocus;
end;

procedure TfrmContasPagar.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

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

procedure TfrmContasPagar.ValidaCampos;
begin

end;

end.
