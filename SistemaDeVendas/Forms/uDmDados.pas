unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  uBiblioteca, uFormConfigBanco, Vcl.Forms;

type
  TdmDados = class(TDataModule)
    FDConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    procedure carregaBanco;

  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.carregaBanco;
begin

  try
    FDConnection.Params.Database := getValorIni(ExtractFilePath(Application.ExeName) + 'config.ini', 'CONFIGURACAO', 'LOCAL_DB');
    FDConnection.Connected := True;
  except
    FormConfigBanco.ShowModal;
  end;

end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
 CarregaBanco;
end;

end.
