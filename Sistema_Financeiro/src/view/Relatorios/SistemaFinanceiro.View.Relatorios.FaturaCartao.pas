unit SistemaFinanceiro.View.Relatorios.FaturaCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelFatCartao = class(TfrmRelatorioPadrao)
    rllblCod: TRLLabel;
    rllblNome: TRLLabel;
    rllblStatus: TRLLabel;
    rldbtId: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    rllblDiaVcto: TRLLabel;
    RLDBText3: TRLDBText;
    DataSourceFatCartao: TDataSource;
    RLBand1: TRLBand;
    rllblContador: TRLLabel;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFatCartao: TfrmRelFatCartao;

implementation

{$R *.dfm}

procedure TfrmRelFatCartao.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceFatCartao.DataSet.RecordCount);

end;

end.
