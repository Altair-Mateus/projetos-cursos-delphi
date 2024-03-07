unit SistemaFinanceiro.View.GeraRelResumoMensalCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.Clientes,
  SistemaFinanceiro.View.Relatorios.ResumoMensalCr;

type
  TfrmGeraRelResumoMensalCr = class(TForm)
    ImageList1: TImageList;
    pnlGeral: TPanel;
    pnlFiltros: TPanel;
    lblDtIni: TLabel;
    lblDtFinal: TLabel;
    lblCodCliente: TLabel;
    lblStatus: TLabel;
    dateIni: TDateTimePicker;
    dateFinal: TDateTimePicker;
    edtCodCliente: TEdit;
    btnPesqCliente: TButton;
    cbStatus: TComboBox;
    gbData: TGroupBox;
    rbDtVenda: TRadioButton;
    rbDtVenc: TRadioButton;
    rbDtPag: TRadioButton;
    pnlBotoes: TPanel;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    btnCancelar: TButton;
    pnlTitulo: TPanel;
    pnlCheckBox: TPanel;
    checkVencidas: TCheckBox;
    checkParciais: TCheckBox;
    checkTracoLinha: TCheckBox;
    checkDestacaLinha: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure GeraRelatorio;
    procedure GeraConsulta;
    procedure GeraImpressao;

  public
    { Public declarations }
  end;

var
  frmGeraRelResumoMensalCr: TfrmGeraRelResumoMensalCr;

implementation

uses
  System.DateUtils, SistemaFinanceiro.Model.dmCReceber;

{$R *.dfm}

procedure TfrmGeraRelResumoMensalCr.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeraRelResumoMensalCr.btnImprimirClick(Sender: TObject);
begin

  GeraConsulta;
  GeraImpressao;

end;

procedure TfrmGeraRelResumoMensalCr.btnPesqClienteClick(Sender: TObject);
begin

  //  Cria o form
  frmCliente := TfrmCliente.Create(Self);

  try

    //  Exibe o form
    frmCliente.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtCodCliente.Text := frmCliente.DataSourceCliente.DataSet.FieldByName('ID_CLI').AsString;

    //  Libera da  memoria
    FreeAndNil(frmCliente);

  end;

  edtCodCliente.SetFocus;

end;

procedure TfrmGeraRelResumoMensalCr.btnVisualizarClick(Sender: TObject);
begin

  GeraConsulta;
  GeraRelatorio;

end;

procedure TfrmGeraRelResumoMensalCr.FormCreate(Sender: TObject);
begin

  //  Define as datas previamente

  dateIni.Date   := StartOfTheYear(Now);
  dateFinal.Date := EndOfTheYear(Now);

end;

procedure TfrmGeraRelResumoMensalCr.GeraConsulta;
var
  SQL            : String;
  LFiltro        : String;
  LExtract       : String;
  LSelectExtract : String;
  LOrdem         : String;

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

  //  Pesquisa por data
  if rbDtVenda.Checked then
  begin

    LFiltro        := LFiltro + ' AND CR.DATA_VENDA BETWEEN :DTINI AND :DTFIM ';
    LExtract       := ' EXTRACT(MONTH FROM CR.DATA_VENDA), EXTRACT(YEAR FROM CR.DATA_VENDA) ';
    LSelectExtract := ' EXTRACT(MONTH FROM CR.DATA_VENDA) || ''/'' || EXTRACT(YEAR FROM CR.DATA_VENDA) AS ano_mes ';
    LOrdem         := ' EXTRACT(YEAR FROM CR.DATA_VENDA), EXTRACT(MONTH FROM CR.DATA_VENDA) ';

  end
  else if rbDtVenc.Checked then
  begin

    LFiltro        := LFiltro + ' AND CR.DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';
    LExtract       := ' EXTRACT(MONTH FROM CR.DATA_VENCIMENTO), EXTRACT(YEAR FROM CR.DATA_VENCIMENTO) ';
    LSelectExtract := ' EXTRACT(MONTH FROM CR.DATA_VENCIMENTO) || ''/'' || EXTRACT(YEAR FROM CR.DATA_VENCIMENTO) AS ano_mes ';
    LOrdem         := ' EXTRACT(YEAR FROM CR.DATA_VENCIMENTO), EXTRACT(MONTH FROM CR.DATA_VENCIMENTO) ';

  end
  else
  begin

    LFiltro        := LFiltro + ' AND CR.DATA_RECEBIMENTO BETWEEN :DTINI AND :DTFIM ';
    LExtract       := ' EXTRACT(MONTH FROM CR.DATA_RECEBIMENTO), EXTRACT(YEAR FROM CR.DATA_RECEBIMENTO) ';
    LSelectExtract := ' EXTRACT(MONTH FROM CR.DATA_RECEBIMENTO) || ''/'' || EXTRACT(YEAR FROM CR.DATA_RECEBIMENTO) AS ano_mes ';
    LOrdem         := ' EXTRACT(YEAR FROM CR.DATA_RECEBIMENTO), EXTRACT(MONTH FROM CR.DATA_RECEBIMENTO) ';

  end;

  //  Pesquisa por status
  case cbStatus.ItemIndex of
    1 : LFiltro := LFiltro + ' AND CR.STATUS = ''P'' ';
    2 : LFiltro := LFiltro + ' AND CR.STATUS = ''A'' ';
    3 : LFiltro := LFiltro + ' AND CR.STATUS = ''C'' ';
  end;


  //  Pesquisa por FORNECEDORES
  if Trim(edtCodCliente.Text) <> '' then
    LFiltro := LFiltro + ' AND CR.ID_CLIENTE= :ID_CLI ';

  //  Pesquisa parciais
  if checkParciais.Checked then
    LFiltro := LFiltro + ' AND CR.PARCIAL = ''S'' ';

  //  Pesquisa vencidas
  if checkVencidas.Checked then
    LFiltro := LFiltro + ' AND CR.STATUS = ''A'' AND CR.DATA_VENCIMENTO < :DTATUAL ';



  SQL := 'SELECT ' + LSelectExtract + ', SUM(VALOR_PARCELA) AS TOTAL_MENSAL,' +
         ' COUNT(*) AS QTD FROM CONTAS_RECEBER CR WHERE 1 = 1' + LFiltro +
         'GROUP BY ' + LExtract +
         'ORDER BY ' + LOrdem;

  dmCReceber.FDQueryRelatorios.Close;
  dmCReceber.FDQueryRelatorios.SQL.Clear;
  dmCReceber.FDQueryRelatorios.Params.Clear;
  dmCReceber.FDQueryRelatorios.SQL.Add(SQL);

  //  Criando os parametros
  dmCReceber.FDQueryRelatorios.ParamByName('DTINI').AsDate := dateIni.Date;
  dmCReceber.FDQueryRelatorios.ParamByName('DTFIM').AsDate := dateFinal.Date;

  if Trim(edtCodCliente.Text) <> '' then
    dmCReceber.FDQueryRelatorios.ParamByName('ID_CLI').AsInteger := StrToInt(Trim(edtCodCliente.Text));

  if checkVencidas.Checked then
    dmCReceber.FDQueryRelatorios.ParamByName('DTATUAL').AsDate:= Now;


  dmCReceber.FDQueryRelatorios.Prepare;
  dmCReceber.FDQueryRelatorios.Open();

end;

procedure TfrmGeraRelResumoMensalCr.GeraImpressao;
begin

  //  Cria o form
  frmRelMensalCr := TfrmRelMensalCr.Create(Self);

  try

    frmRelMensalCr.dsRelResumoMensal.DataSet := dmCReceber.FDQueryRelatorios;

    //  Imprime
    frmRelMensalCr.RLReport.Print;

  finally

    FreeAndNil(frmRelMensalCr);

  end;

end;

procedure TfrmGeraRelResumoMensalCr.GeraRelatorio;
begin

   //  Cria o form
  frmRelMensalCr := TfrmRelMensalCr.Create(Self);

   if checkTracoLinha.Checked then
    frmRelMensalCr.TracoLinha := True;

  if checkDestacaLinha.Checked then
    frmRelMensalCr.DestacaLinha := True;

  try

    frmRelMensalCr.dsRelResumoMensal.DataSet := dmCReceber.FDQueryRelatorios;

    //  Mostra a pre visualização
    frmRelMensalCr.RLReport.Preview();

  finally

    FreeAndNil(frmRelMensalCr);

  end;

end;

end.
