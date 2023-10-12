unit SistemaFinanceiro.View.BxMultiplaCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.FaturaCartao, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Model.dmFaturaCartao, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBxMultiplaCP = class(TForm)
    pnlFiltros: TPanel;
    pnlContas: TPanel;
    pnlBotoes: TPanel;
    dateInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dateFinal: TDateTimePicker;
    ImageList1: TImageList;
    btnVisualizar: TButton;
    edtFornecedor: TEdit;
    lblFornecedor: TLabel;
    btnPesquisaFornecedor: TButton;
    lblNomeFornecedor: TLabel;
    lblCodFatCartao: TLabel;
    edtCodFatCartao: TEdit;
    btnPesqFat: TButton;
    lblNomeFatCartao: TLabel;
    DBGrid1: TDBGrid;
    DataSourceBxMultiplaCP: TDataSource;
    btnConfirmar: TButton;
    btnSair: TButton;
    procedure btnPesquisaFornecedorClick(Sender: TObject);
    procedure btnPesqFatClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaNomeFornecedor;
    procedure BuscaNomeFatCartao;

  public
    { Public declarations }
  end;

var
  frmBxMultiplaCP: TfrmBxMultiplaCP;

implementation

{$R *.dfm}

procedure TfrmBxMultiplaCP.btnPesqFatClick(Sender: TObject);
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

procedure TfrmBxMultiplaCP.btnPesquisaFornecedorClick(Sender: TObject);
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

procedure TfrmBxMultiplaCP.BuscaNomeFatCartao;
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

  end;

end;

procedure TfrmBxMultiplaCP.BuscaNomeFornecedor;
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

end.
