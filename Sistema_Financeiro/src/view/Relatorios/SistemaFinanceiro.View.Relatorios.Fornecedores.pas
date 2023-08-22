unit SistemaFinanceiro.View.Relatorios.Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelFornecedores = class(TfrmRelatorioPadrao)
    rllblCod: TRLLabel;
    rllblNome: TRLLabel;
    rllblTelefone: TRLLabel;
    rllblCelular: TRLLabel;
    rldbtId: TRLDBText;
    rldbtNome: TRLDBText;
    rldbtTelefone: TRLDBText;
    rldbtCelular: TRLDBText;
    RLBand1: TRLBand;
    rllblContador: TRLLabel;
    DataSourceFornecedores: TDataSource;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFornecedores: TfrmRelFornecedores;

implementation

{$R *.dfm}

procedure TfrmRelFornecedores.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceFornecedores.DataSet.RecordCount);

end;

end.
