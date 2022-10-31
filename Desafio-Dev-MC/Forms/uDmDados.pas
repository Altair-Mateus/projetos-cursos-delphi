unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  fConfigBanco, uBiblioteca, Vcl.Forms;

type
  TdmDados = class(TDataModule)
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    //  Carrega o banco de dados
    procedure CarregaBanco;

  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.CarregaBanco;
begin

  //  Verifica a conexão com o banco atraves do config.ini
  try

    FDConnection.Params.Database := getValorIni(ExtractFilePath(Application.ExeName) + 'config.ini', 'CONFIGURACAO', 'LOCAL_DB');
    FDConnection.Connected := True;
  except

    frmConfigBanco.ShowModal;

  end;

end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  CarregaBanco;
end;

end.
