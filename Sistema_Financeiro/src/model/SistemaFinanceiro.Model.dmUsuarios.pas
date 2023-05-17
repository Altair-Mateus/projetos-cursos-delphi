unit SistemaFinanceiro.Model.dmUsuarios;

interface

uses
  System.SysUtils, System.Classes, SistemaFinanceiro.Model.udmDados,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleUsuarios = class(TDataModule)
    FDQueryUsuarios: TFDQuery;
    ClientDataSetUsuarios: TClientDataSet;
    DataSetProviderUsuarios: TDataSetProvider;
    ClientDataSetUsuariosid: TIntegerField;
    ClientDataSetUsuariosdata_cadastro: TDateField;
    ClientDataSetUsuariosnome: TWideStringField;
    ClientDataSetUsuarioslogin: TWideStringField;
    ClientDataSetUsuariossenha: TWideStringField;
    ClientDataSetUsuariosstatus: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function VerificaLogin(Login: String; Id: String) : Boolean;


  end;

var
  DataModuleUsuarios: TDataModuleUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleUsuarios }

procedure TDataModuleUsuarios.GeraCodigo;
var
  cod: integer;
  FDQueryId : TFDQuery;
begin

  cod := 0;

  FDQueryId := TFDQuery.Create(nil);

  try

     //  Estabelece a conexao com o banco
     FDQueryId.Connection :=  DataModule1.FDConnection;

     FDQueryId.Close;
     FDQueryId.sql.Clear;
     FDQueryId.SQL.Add('select max(id) as id from usuarios');
     FDQueryId.Open;


    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('id').AsInteger + 1;

    ClientDataSetUsuariosid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TDataModuleUsuarios.VerificaLogin(Login, Id: String): Boolean;
var

  FDQueryLogin : TFDQuery;

begin

  Result := False;

  FDQueryLogin := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryLogin.Connection :=  DataModule1.FDConnection;

    FDQueryLogin.Close;
    FDQueryLogin.SQL.Clear;
    FDQueryLogin.SQL.Add('select id from usuarios where login = :LOGIN');

    FDQueryLogin.ParamByName('LOGIN').AsString := Login;
    FDQueryLogin.Open();

    //  Se não estiver vazia
    if not FDQueryLogin.IsEmpty then
    begin

      Result:= FDQueryLogin.FieldByName('ID').AsString <> ID;

    end;


  finally

    FDQueryLogin.Close;
    FDQueryLogin.Free;

  end;


end;

end.
