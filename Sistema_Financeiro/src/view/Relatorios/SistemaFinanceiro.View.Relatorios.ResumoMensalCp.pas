unit SistemaFinanceiro.View.Relatorios.ResumoMensalCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelMensalCp = class(TfrmRelatorioPadrao)
    dsRelResumoMensal: TDataSource;
    rllblValorTot: TRLLabel;
    rllblAnoMes: TRLLabel;
    rldbtMesAno: TRLDBText;
    rldbtValorTotal: TRLDBText;
    rllblQtd: TRLLabel;
    rldbtQtd: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMensalCp: TfrmRelMensalCp;

implementation

{$R *.dfm}

end.
