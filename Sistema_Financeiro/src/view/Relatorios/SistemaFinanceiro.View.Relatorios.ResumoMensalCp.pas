unit SistemaFinanceiro.View.Relatorios.ResumoMensalCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB, RLXLSFilter;

type
  TfrmRelMensalCp = class(TfrmRelatorioPadrao)
    dsRelResumoMensal: TDataSource;
    rllblValorTot: TRLLabel;
    rllblAnoMes: TRLLabel;
    rldbtMesAno: TRLDBText;
    rldbtValorTotal: TRLDBText;
    rllblQtd: TRLLabel;
    rldbtQtd: TRLDBText;
    RLBand1: TRLBand;
    rllblTotal: TRLLabel;
    rllblQuantidade: TRLLabel;
    rllblFatCartao: TRLLabel;
    rldbtFatCartao: TRLDBText;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FFatura: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property Fatura: Boolean read FFatura write FFatura;
  end;

var
  frmRelMensalCp: TfrmRelMensalCp;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Utilitarios;

procedure TfrmRelMensalCp.rlbDadosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  if FFatura then
  begin
    rllblFatCartao.Visible := True;
    rldbtFatCartao.Visible := True;
  end;


end;

procedure TfrmRelMensalCp.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  Soma : Currency;
  Qtd  : Integer;

begin
  inherited;

  Soma := 0;
  Qtd  := 0;

  //  Posiciona no primeiro dado do dataset
  dsRelResumoMensal.DataSet.First;

  //  Soma ate o ultimo registro
  while not dsRelResumoMensal.DataSet.Eof do
  begin

    Soma := Soma + dsRelResumoMensal.DataSet.FieldByName('TOTAL_MENSAL').AsCurrency;
    Qtd  := Qtd  +  dsRelResumoMensal.DataSet.FieldByName('QTD').AsInteger;

    //  avança para o proximi
    dsRelResumoMensal.DataSet.Next;

  end;

  //  Exibe a soma
  rllblTotal.Caption := 'Total: ' + TUtilitario.FormatoMoeda(Soma);


  //  Conta a quantidade de contas
  rllblQuantidade.Caption := 'Total de Contas: ' + IntToStr(qtd);

end;

end.
