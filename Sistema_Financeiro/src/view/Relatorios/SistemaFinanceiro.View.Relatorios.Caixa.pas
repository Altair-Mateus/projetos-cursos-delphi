unit SistemaFinanceiro.View.Relatorios.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB, SistemaFinanceiro.Model.Entidades.ResumoCaixa;

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
    RLBand2: TRLBand;
    rllblVTotEnt: TRLLabel;
    rllblVTotSai: TRLLabel;
    rllblTotEnt: TRLLabel;
    rllblTotSai: TRLLabel;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ResumoCaixa(ResumoCaixa : TModelResumoCaixa);

  end;

var
  frmRelCaixa: TfrmRelCaixa;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Utilitarios;

procedure TfrmRelCaixa.ResumoCaixa(ResumoCaixa: TModelResumoCaixa);
begin
  rllblVTotEnt.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalEntradas);
  rllblVTotSai.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalSaidas);
end;

procedure TfrmRelCaixa.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceCaixa.DataSet.RecordCount);

end;

end.


uses SistemaFinanceiro.Model.Entidades.ResumoCaixa;


uses SistemaFinanceiro.Model.Entidades.ResumoCaixa;
