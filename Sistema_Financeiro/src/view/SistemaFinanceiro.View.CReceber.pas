unit SistemaFinanceiro.View.CReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels;

type
  TfrmContasReceber = class(TfrmCadastroPadrao)
    DataSourceCReceber: TDataSource;
  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure EditarRegCReceber;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCReceber;

{ TfrmContasReceber }

procedure TfrmContasReceber.EditarRegCReceber;
begin

end;

procedure TfrmContasReceber.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCReceber.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCReceber.DataSet.IsEmpty;


end;

procedure TfrmContasReceber.Pesquisar;
var
  LFiltroPesquisa: String;

begin

  dmCReceber.cdsCReceber.Close;
  dmCReceber.cdsCReceber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE 1 = 1 ' + LFiltroPesquisa + ' ORDER BY 1 DESC';
  dmCReceber.cdsCReceber.Open;

  HabilitaBotoes;

  inherited;

end;

end.
