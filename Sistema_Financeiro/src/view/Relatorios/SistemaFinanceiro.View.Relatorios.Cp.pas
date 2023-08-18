unit SistemaFinanceiro.View.Relatorios.Cp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelCp = class(TfrmRelatorioPadrao)
    rllblId: TRLLabel;
    rllblNDoc: TRLLabel;
    rllblVencimento: TRLLabel;
    rllblParcela: TRLLabel;
    rllblStatus: TRLLabel;
    rllblValorParcela: TRLLabel;
    rldbtId: TRLDBText;
    rldbtNDoc: TRLDBText;
    rldbtDataVenc: TRLDBText;
    rldbtParcela: TRLDBText;
    rldbtStatus: TRLDBText;
    rldbtValorParc: TRLDBText;
    RLBand1: TRLBand;
    rllblTotal: TRLLabel;
    rllblContador: TRLLabel;
    DataSourceCp: TDataSource;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCp: TfrmRelCp;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Utilitarios;

procedure TfrmRelCp.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  Soma : Currency;

begin
  inherited;

  //  Soma os valores das contas
  Soma := 0;

  //  Posiciona no primeiro dado do dataset
  DataSourceCp.DataSet.First;

  //  Soma ate o ultimo registro
  while not DataSourceCp.DataSet.Eof do
  begin

    if DataSourceCp.DataSet.FieldByName('STATUS').AsString <> 'C' then
    begin
      Soma := Soma + DataSourceCp.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;
    end;

    //  avança para o proximo
    DataSourceCp.DataSet.Next;

  end;

  //  Exibe a soma
  rllblTotal.Caption := 'Total R$ ' + TUtilitario.FormatarValor(Soma);

  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceCp.DataSet.RecordCount);

end;

end.
