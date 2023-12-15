unit SistemaFinanceiro.View.Relatorios.ResumoMensalCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelMensalCr = class(TfrmRelatorioPadrao)
    rllblAnoMes: TRLLabel;
    rllblQtd: TRLLabel;
    rllblValorTot: TRLLabel;
    rldbtMesAno: TRLDBText;
    rldbtQtd: TRLDBText;
    rldbtValorTotal: TRLDBText;
    dsRelResumoMensal: TDataSource;
    RLBand1: TRLBand;
    rllblTotal: TRLLabel;
    rllblQuantidade: TRLLabel;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMensalCr: TfrmRelMensalCr;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Utilitarios;

procedure TfrmRelMensalCr.RLReportBeforePrint(Sender: TObject;
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
