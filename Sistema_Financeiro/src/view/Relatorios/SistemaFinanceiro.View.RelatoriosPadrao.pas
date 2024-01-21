unit SistemaFinanceiro.View.RelatoriosPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelatorioPadrao = class(TForm)
    RLReport: TRLReport;
    rlbCab: TRLBand;
    rllblNomeEmp: TRLLabel;
    rlbTitulo: TRLBand;
    rllblTitulo: TRLLabel;
    rlbNomeColunas: TRLBand;
    rlbDados: TRLBand;
    rlbRodape: TRLBand;
    rlsiData: TRLSystemInfo;
    rlsiHora: TRLSystemInfo;
    rlsiNumPag: TRLSystemInfo;
    rlsiLastPage: TRLSystemInfo;
    rllblNomeUser: TRLLabel;
    RLPDFFilter: TRLPDFFilter;
    procedure RLReportBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPadrao: TfrmRelatorioPadrao;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmUsuarios;

procedure TfrmRelatorioPadrao.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

  rllblNomeUser.Caption := Format('Impresso por %s', [dmUsuarios.GetUsuarioLogado.Nome]);

end;

end.
