unit SistemaFinanceiro.View.Relatorios.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelClientes = class(TfrmRelatorioPadrao)
    rllblCod: TRLLabel;
    rldbtId: TRLDBText;
    RLBand1: TRLBand;
    rllblContador: TRLLabel;
    rllblNome: TRLLabel;
    rllblTelefone: TRLLabel;
    rllblCelular: TRLLabel;
    DataSourceClientes: TDataSource;
    rldbtNome: TRLDBText;
    rldbtTelefone: TRLDBText;
    rldbtCelular: TRLDBText;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

{$R *.dfm}

procedure TfrmRelClientes.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

   //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceClientes.DataSet.RecordCount);

end;

end.
