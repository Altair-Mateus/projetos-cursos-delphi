unit SistemaFinanceiro.Model.dmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmClientes = class(TDataModule)
    FDQueryClientes: TFDQuery;
    DataSetProviderClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesID: TIntegerField;
    cdsClientesNOME: TWideStringField;
    cdsClientesTIPO: TWideStringField;
    cdsClientesCPF: TWideStringField;
    cdsClientesCNPJ: TWideStringField;
    cdsClientesIE: TWideStringField;
    cdsClientesENDERECO: TWideStringField;
    cdsClientesN_LOGRADOURO: TWideStringField;
    cdsClientesBAIRRO: TWideStringField;
    cdsClientesCIDADE: TWideStringField;
    cdsClientesESTADO: TWideStringField;
    cdsClientesCEP: TWideStringField;
    cdsClientesCELULAR: TWideStringField;
    cdsClientesTELEFONE: TWideStringField;
    cdsClientesCOMPLEMENTO: TWideStringField;
    cdsClientesEMAIL: TWideStringField;
    cdsClientesDATA_CADASTRO: TSQLTimeStampField;
    cdsClientesDATA_ALTERACAO: TSQLTimeStampField;
    cdsClientesSTATUS_CLI: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GetNomeCliente(IdCliente : String) : String;
    function GetCr(IdCliente : Integer) : Boolean;
    FUNCTION GetStatus(IdCliente : String) : Boolean;

  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModule2 }

procedure TdmClientes.GeraCodigo;
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
     FDQueryId.Open('SELECT MAX(ID_CLI) AS ID FROM CLIENTES');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsClientesID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();
  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TdmClientes.GetCr(IdCliente: Integer): Boolean;
var
  FDQueryCrCli : TFDQuery;

begin

  FDQueryCrCli := TFDQuery.Create(nil);

  Result := False;

  try
    //  Estabelece a conexao com o banco
    FDQueryCrCli.Connection := DataModule1.FDConnection;
    FDQueryCrCli.Close;
    FDQueryCrCli.SQL.Clear;
    FDQueryCrCli.SQL.Add('SELECT * FROM CONTAS_RECEBER WHERE ID_CLIENTE = :IDCLI');

    FDQueryCrCli.ParamByName('IDCLI').AsInteger := IdCliente;

    FDQueryCrCli.Open();

    if not FDQueryCrCli.IsEmpty then
    begin
      Result := True;
    end;


  finally

    FDQueryCrCli.Close;
    FDQueryCrCli.Free;

  end



end;

function TdmClientes.GetNomeCliente(IdCliente : String) : String;
var
  FDQueryNome : TFDQuery;

begin

  Result := '';

  //  Criando a query
  FDQueryNome := TFDQuery.Create(nil);

  try

    //  Definindo a conexão
    FDQueryNome.Connection := DataModule1.FDConnection;

    FDQueryNome.Close;
    FDQueryNome.SQL.Clear;
    FDQueryNome.SQL.Add('SELECT NOME FROM CLIENTES WHERE ID_CLI = :ID ');

    FDQueryNome.ParamByName('ID').AsString := IdCliente;

    FDQueryNome.Open();

    Result := FDQueryNome.FieldByName('NOME').AsString;

  finally

    FDQueryNome.Close;
    FDQueryNome.Free;

  end;

end;

function TdmClientes.GetStatus(IdCliente: String): Boolean;
var
  FDQueryStatus : TFDQuery;

begin

   FDQueryStatus := TFDQuery.Create(Self);
   Result := False;

   try

    //  Estabelece conexão
    FDQueryStatus.Connection := DataModule1.FDConnection;

    FDQueryStatus.Close;
    FDQueryStatus.SQL.Clear;
    FDQueryStatus.SQL.Add('SELECT STATUS_CLI FROM CLIENTES WHERE ID_CLI = :ID');

    FDQueryStatus.ParamByName('ID').AsString := IdCliente;

    FDQueryStatus.Open;

    if FDQueryStatus.FieldByName('STATUS_CLI').AsString = 'I' then
    begin
      Result := False;
    end
    else if FDQueryStatus.FieldByName('STATUS_CLI').AsString = 'A' then
    begin
      Result := True;
    end;


   finally

    FDQueryStatus.Close;
    FDQueryStatus.Free;

   end;



end;

end.
