unit SistemaFinanceiro.View.Relatorios.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrmRelUsuarios = class(TForm)
    RLReportUsuarios: TRLReport;
    rlbCab: TRLBand;
    rllblNomeEmp: TRLLabel;
    rlbTitulo: TRLBand;
    rllblTitulo: TRLLabel;
    rlbNomeColunas: TRLBand;
    rllblNome: TRLLabel;
    rllblLogin: TRLLabel;
    rllblStatus: TRLLabel;
    rlbDados: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    DataSourceUsuarios: TDataSource;
    rlbRodape: TRLBand;
    rlsiData: TRLSystemInfo;
    rlsiHora: TRLSystemInfo;
    rlsiNumPag: TRLSystemInfo;
    rlsiLastPage: TRLSystemInfo;
    rllblNomeUser: TRLLabel;
    procedure RLReportUsuariosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelUsuarios: TfrmRelUsuarios;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmUsuarios;

procedure TfrmRelUsuarios.RLReportUsuariosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

  rllblNomeUser.Caption := Format('Impresso por %s', [dmUsuarios.GetUsuarioLogado.NomeUsuarioLogado]);

end;

end.
