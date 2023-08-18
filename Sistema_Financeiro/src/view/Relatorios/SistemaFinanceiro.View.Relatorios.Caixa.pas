unit SistemaFinanceiro.View.Relatorios.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelCaixa = class(TfrmRelatorioPadrao)
    rllblId: TRLLabel;
    rllblNDoc: TRLLabel;
    rllblTipo: TRLLabel;
    rllblValor: TRLLabel;
    rllblData: TRLLabel;
    rldbtId: TRLDBText;
    rldbtNDoc: TRLDBText;
    rldbtData: TRLDBText;
    rldbtTipo: TRLDBText;
    rldbtValor: TRLDBText;
    DataSourceCaixa: TDataSource;
    RLBand1: TRLBand;
    rllblContador: TRLLabel;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCaixa: TfrmRelCaixa;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Utilitarios;

procedure TfrmRelCaixa.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceCaixa.DataSet.RecordCount);

end;

end.
