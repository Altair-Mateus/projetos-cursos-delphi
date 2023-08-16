unit SistemaFinanceiro.View.Relatorios.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.RelatoriosPadrao,
  RLReport, Data.DB, RLFilters, RLPDFFilter;

type
  TfrmRelUsuarios = class(TfrmRelatorioPadrao)
    DataSourceUsuarios: TDataSource;
    rldbtNome: TRLDBText;
    rldbtLogin: TRLDBText;
    rldbtStatus: TRLDBText;
    rllblNome: TRLLabel;
    rllblLogin: TRLLabel;
    rllblStatus: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelUsuarios: TfrmRelUsuarios;

implementation

{$R *.dfm}

end.
