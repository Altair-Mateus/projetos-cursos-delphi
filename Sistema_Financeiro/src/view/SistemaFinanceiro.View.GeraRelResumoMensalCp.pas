unit SistemaFinanceiro.View.GeraRelResumoMensalCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.FaturaCartao,
  SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.Relatorios.ResumoMensalCp;

type
  TfrmGeraRelResumoMensalCp = class(TForm)
    pnlGeral: TPanel;
    pnlFiltros: TPanel;
    pnlBotoes: TPanel;
    dateIni: TDateTimePicker;
    lblDtIni: TLabel;
    lblDtFinal: TLabel;
    dateFinal: TDateTimePicker;
    edtCodFornec: TEdit;
    lblFornec: TLabel;
    lblFatura: TLabel;
    edtCodFatCartao: TEdit;
    btnPesqFornec: TButton;
    btnPesqFatCartao: TButton;
    ImageList1: TImageList;
    lblStatus: TLabel;
    cbStatus: TComboBox;
    gbData: TGroupBox;
    rbDtCompra: TRadioButton;
    rbDtVenc: TRadioButton;
    rbDtPag: TRadioButton;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    btnCancelar: TButton;
    pnlTitulo: TPanel;
    pnlCheckBox: TPanel;
    checkNaoConsideraFat: TCheckBox;
    checkVencidas: TCheckBox;
    checkParciais: TCheckBox;
    checkAgrupaFatura: TCheckBox;
    checkTracoLinha: TCheckBox;
    checkDestacaLinha: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesqFornecClick(Sender: TObject);
    procedure btnPesqFatCartaoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure checkNaoConsideraFatClick(Sender: TObject);

  private
    { Private declarations }
    procedure GeraRelatorio;
    procedure GeraConsulta;
    procedure GeraImpressao;

  public
    { Public declarations }
  end;

var
  frmGeraRelResumoMensalCp: TfrmGeraRelResumoMensalCp;

implementation

uses
    System.DateUtils, SistemaFinanceiro.Model.dmCPagar;

{$R *.dfm}

procedure TfrmGeraRelResumoMensalCp.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeraRelResumoMensalCp.btnImprimirClick(Sender: TObject);
begin

  GeraConsulta;

  GeraImpressao;

end;

procedure TfrmGeraRelResumoMensalCp.btnPesqFornecClick(Sender: TObject);
begin

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtCodFornec.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  edtCodFornec.SetFocus;

end;

procedure TfrmGeraRelResumoMensalCp.btnVisualizarClick(Sender: TObject);
begin

  GeraConsulta;

  GeraRelatorio;

end;

procedure TfrmGeraRelResumoMensalCp.checkNaoConsideraFatClick(Sender: TObject);
begin

  if checkNaoConsideraFat.Checked then
  begin

    btnPesqFatCartao.Enabled := False;
    edtCodFatCartao.Enabled  := False;
    edtCodFatCartao.Clear;

    checkAgrupaFatura.Checked := False;
    checkAgrupaFatura.Enabled := False;

  end
  else
  begin

    btnPesqFatCartao.Enabled  := True;
    edtCodFatCartao.Enabled   := True;
    checkAgrupaFatura.Enabled := True;

  end;

end;

procedure TfrmGeraRelResumoMensalCp.btnPesqFatCartaoClick(Sender: TObject);
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtCodFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;

    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

  edtCodFatCartao.SetFocus;

end;

procedure TfrmGeraRelResumoMensalCp.FormCreate(Sender: TObject);
begin

  //  Define as datas previamente
  dateIni.Date   := StartOfTheYear(Now);
  dateFinal.Date := EndOfTheYear(Now);

end;

procedure TfrmGeraRelResumoMensalCp.GeraConsulta;
var
  SQL            : String;
  LFiltro        : String;
  LExtract       : String;
  LSelectExtract : String;
  LOrdem         : String;
  LJoin          : String;

begin

  //  Validações
  if dateIni.Date > dateFinal.Date then
  begin

    dateFinal.SetFocus;
    Application.MessageBox('Data Inicial não pode ser maior que a data Final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if cbStatus.ItemIndex < 0 then
  begin

    cbStatus.SetFocus;
    Application.MessageBox('Selecione um tipo de STATUS!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  LFiltro        := '';
  SQL            := '';
  LExtract       := '';
  LSelectExtract := '';
  LOrdem         := '';
  LJoin          := '';

  // Agrupa por Fatura
  if checkAgrupaFatura.Checked then
  begin
    LSelectExtract := LSelectExtract + ' FT.NOME AS FATURA, ';
    LJoin          := LJoin          + ' INNER JOIN FATURA_CARTAO FT ON CP.ID_FATURA = FT.ID_FT ';
    LExtract       := LExtract       + ' CP.ID_FATURA, FT.NOME, ';
    LOrdem         := LOrdem         + ' CP.ID_FATURA, ';
  end;

  //  Pesquisa por data
  if rbDtCompra.Checked then
  begin

    LFiltro        := LFiltro        + ' AND CP.DATA_COMPRA BETWEEN :DTINI AND :DTFIM ';
    LExtract       := LExtract       + ' EXTRACT(MONTH FROM CP.DATA_COMPRA), EXTRACT(YEAR FROM CP.DATA_COMPRA) ';
    LSelectExtract := LSelectExtract + ' EXTRACT(MONTH FROM CP.DATA_COMPRA) || ''/'' || EXTRACT(YEAR FROM CP.DATA_COMPRA) AS ano_mes ';
    LOrdem         := LOrdem         + ' EXTRACT(YEAR FROM CP.DATA_COMPRA), EXTRACT(MONTH FROM CP.DATA_COMPRA) ';

  end
  else if rbDtVenc.Checked then
  begin

    LFiltro        := LFiltro        + ' AND CP.DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';
    LExtract       := LExtract       + ' EXTRACT(MONTH FROM CP.DATA_VENCIMENTO), EXTRACT(YEAR FROM CP.DATA_VENCIMENTO) ';
    LSelectExtract := LSelectExtract + ' EXTRACT(MONTH FROM CP.DATA_VENCIMENTO) || ''/'' || EXTRACT(YEAR FROM CP.DATA_VENCIMENTO) AS ano_mes ';
    LOrdem         := LOrdem         + ' EXTRACT(YEAR FROM CP.DATA_VENCIMENTO), EXTRACT(MONTH FROM CP.DATA_VENCIMENTO) ';

  end
  else
  begin

    LFiltro        := LFiltro        + ' AND CP.DATA_PAGAMENTO BETWEEN :DTINI AND :DTFIM ';
    LExtract       := LExtract       + ' EXTRACT(MONTH FROM CP.DATA_PAGAMENTO), EXTRACT(YEAR FROM CP.DATA_PAGAMENTO) ';
    LSelectExtract := LSelectExtract + ' EXTRACT(MONTH FROM CP.DATA_PAGAMENTO) || ''/'' || EXTRACT(YEAR FROM CP.DATA_PAGAMENTO) AS ano_mes ';
    LOrdem         := LOrdem         + ' EXTRACT(YEAR FROM CP.DATA_PAGAMENTO), EXTRACT(MONTH FROM CP.DATA_PAGAMENTO) ';

  end;


  //  Pesquisa por status
  case cbStatus.ItemIndex of
    1 : LFiltro := LFiltro + ' AND CP.STATUS = ''P'' ';
    2 : LFiltro := LFiltro + ' AND CP.STATUS = ''A'' ';
    3 : LFiltro := LFiltro + ' AND CP.STATUS = ''C'' ';
  end;


  //  Pesquisa por FORNECEDORES
  if Trim(edtCodFornec.Text) <> '' then
    LFiltro := LFiltro + ' AND CP.ID_FORNECEDOR = :ID_FORNEC ';


  //  Pesquisa por Fatura de Cartao
  if Trim(edtCodFatCartao.Text) <> '' then
    LFiltro := LFiltro + ' AND CP.ID_FATURA = :ID_FT ';


  //  Pesquisa parciais
  if checkParciais.Checked then
    LFiltro := LFiltro + ' AND CP.PARCIAL = ''S'' ';

  //  Pesquisa vencidas
  if checkVencidas.Checked then
    LFiltro := LFiltro + ' AND CP.STATUS = ''A'' AND CP.DATA_VENCIMENTO < :DTATUAL ';

  //  Não considera faturas
  if checkNaoConsideraFat.Checked then
    LFiltro := LFiltro + ' AND FATURA_CART = ''N'' ';


  SQL := 'SELECT ' + LSelectExtract + ', SUM(VALOR_PARCELA) AS TOTAL_MENSAL, ' +
         ' COUNT(*) AS QTD FROM CONTAS_PAGAR CP ' + LJoin + ' WHERE 1 = 1 ' + LFiltro +
         'GROUP BY ' + LExtract +
         'ORDER BY ' + LOrdem;

  dmCPagar.FDQueryRelatorios.Close;
  dmCPagar.FDQueryRelatorios.SQL.Clear;
  dmCPagar.FDQueryRelatorios.Params.Clear;
  dmCPagar.FDQueryRelatorios.SQL.Add(SQL);

  //  Criando os parametros
  dmCPagar.FDQueryRelatorios.ParamByName('DTINI').AsDate := dateIni.Date;
  dmCPagar.FDQueryRelatorios.ParamByName('DTFIM').AsDate := dateFinal.Date;

  if Trim(edtCodFornec.Text) <> '' then
    dmCPagar.FDQueryRelatorios.ParamByName('ID_FORNEC').AsInteger := StrToInt(Trim(edtCodFornec.Text));

  if Trim(edtCodFatCartao.Text) <> '' then
    dmCPagar.FDQueryRelatorios.ParamByName('ID_FT').AsInteger := StrToInt(Trim(edtCodFatCartao.Text));

  if checkVencidas.Checked then
    dmCPagar.FDQueryRelatorios.ParamByName('DTATUAL').AsDate:= Now;


  dmCPagar.FDQueryRelatorios.Prepare;
  dmCPagar.FDQueryRelatorios.Open();



end;

procedure TfrmGeraRelResumoMensalCp.GeraImpressao;
begin

  //  Cria o form
  frmRelMensalCp := TfrmRelMensalCp.Create(Self);

  try

    frmRelMensalCp.dsRelResumoMensal.DataSet := dmCPagar.FDQueryRelatorios;

    //  Imprime
    frmRelMensalCp.RLReport.Print;

  finally

    FreeAndNil(frmRelMensalCp);

  end;

end;

procedure TfrmGeraRelResumoMensalCp.GeraRelatorio;
begin

  //  Cria o form
  frmRelMensalCp := TfrmRelMensalCp.Create(Self);

  if checkAgrupaFatura.Checked then
    frmRelMensalCp.Fatura := True;

  if checkTracoLinha.Checked then
    frmRelMensalCp.TracoLinha := True;

  if checkDestacaLinha.Checked then
    frmRelMensalCp.DestacaLinha := True;

  try

    frmRelMensalCp.dsRelResumoMensal.DataSet := dmCPagar.FDQueryRelatorios;

    //  Mostra a pre visualização
    frmRelMensalCp.RLReport.Preview();

  finally

    FreeAndNil(frmRelMensalCp);

  end;

end;

end.
