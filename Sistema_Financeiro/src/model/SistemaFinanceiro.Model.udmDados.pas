unit SistemaFinanceiro.Model.udmDados;
interface
uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Forms;
type
  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
    const ARQUIVOCONFIGURACAO = 'ConfigBanco.ini';

  public
    { Public declarations }
    procedure ConectarBd;
    procedure DesconectarBd;
    procedure Conexao;

  end;
var
  DataModule1: TDataModule1;

implementation

uses
  System.SysUtils;
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.ConectarBd;
begin

  FDConnection.Connected := True;

end;

procedure TDataModule1.Conexao;
begin

  if FileExists(ARQUIVOCONFIGURACAO) then
  begin
    FDConnection.Params.LoadFromFile(ARQUIVOCONFIGURACAO);
  end
  else
  begin

    FDConnection.Params.Database := ExtractFilePath(Application.ExeName) + 'dados\SISTEMAFINANCEIRO.FDB';

    FDConnection.Params.SaveToFile(ARQUIVOCONFIGURACAO);

  end;

end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin

  //  Chama a procedure que le as info do .ini
  Conexao;

  //  Conecta no banco
  ConectarBd;

end;

procedure TDataModule1.DesconectarBd;
begin
  FDConnection.Connected := False;
end;

end.
