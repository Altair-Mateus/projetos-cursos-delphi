unit SistemaFinanceiro.View.Relatorios.Cr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLFilters, RLPDFFilter, RLReport, Data.DB;

type
  TfrmRelCr = class(TfrmRelatorioPadrao)
    rllblVencimento: TRLLabel;
    rllblNDoc: TRLLabel;
    rllblParcela: TRLLabel;
    rllblStatus: TRLLabel;
    rllblValorParcela: TRLLabel;
    rldbtDataVenc: TRLDBText;
    rldbtNDoc: TRLDBText;
    rldbtParcela: TRLDBText;
    rldbtStatus: TRLDBText;
    rldbtValorParc: TRLDBText;
    DataSourceCr: TDataSource;
    RLBand1: TRLBand;
    rllblTotal: TRLLabel;
    rllblContador: TRLLabel;
    rllblId: TRLLabel;
    rldbtId: TRLDBText;
    rllblCodCliente: TRLLabel;
    rldbtCodCliente: TRLDBText;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCr: TfrmRelCr;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Utilitarios;

procedure TfrmRelCr.RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  Soma : Currency;

begin
  inherited;

  //  Soma os valores das contas
  Soma := 0;

  //  Posiciona no primeiro dado do dataset
  DataSourceCr.DataSet.First;

  //  Soma ate o ultimo registro
  while not DataSourceCr.DataSet.Eof do
  begin

    if DataSourceCr.DataSet.FieldByName('STATUS').AsString <> 'C' then
    begin
      Soma := Soma + DataSourceCr.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;
    end;

    //  avança para o proximi
    DataSourceCr.DataSet.Next;

  end;

  //  Exibe a soma
  rllblTotal.Caption := 'Total R$ ' + TUtilitario.FormatarValor(Soma);



  //  Conta a quantidade de contas
  rllblContador.Caption := 'Total de Registros: ' + IntToStr(DataSourceCr.DataSet.RecordCount);

end;

end.
