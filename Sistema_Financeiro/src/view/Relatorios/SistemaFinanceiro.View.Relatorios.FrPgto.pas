unit SistemaFinanceiro.View.Relatorios.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelFrPgto = class(TfrmRelatorioPadrao)
    DataSourceFrPgto: TDataSource;
    RLBand1: TRLBand;
    rllblContador: TRLLabel;
    rllblCod: TRLLabel;
    rldbtId: TRLDBText;
    rllblNome: TRLLabel;
    rllblStatus: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFrPgto: TfrmRelFrPgto;

implementation

{$R *.dfm}

procedure TfrmRelFrPgto.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceFrPgto.DataSet.RecordCount);

end;

end.
