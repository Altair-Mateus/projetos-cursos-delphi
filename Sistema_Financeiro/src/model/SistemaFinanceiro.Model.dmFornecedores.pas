unit SistemaFinanceiro.Model.dmFornecedores;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmFornecedores = class(TDataModule)
    FDQueryFornecedores: TFDQuery;
    DataSetProviderFornecedores: TDataSetProvider;
    cdsFornecedores: TClientDataSet;
    cdsFornecedoresID: TIntegerField;
    cdsFornecedoresRAZAO_SOCIAL: TWideStringField;
    cdsFornecedoresTIPO: TWideStringField;
    cdsFornecedoresNOME_FANTASIA: TWideStringField;
    cdsFornecedoresENDERECO: TWideStringField;
    cdsFornecedoresN_LOGRADOURO: TWideStringField;
    cdsFornecedoresBAIRRO: TWideStringField;
    cdsFornecedoresCIDADE: TWideStringField;
    cdsFornecedoresESTADO: TWideStringField;
    cdsFornecedoresTELEFONE: TWideStringField;
    cdsFornecedoresCELULAR: TWideStringField;
    cdsFornecedoresEMAIL: TWideStringField;
    cdsFornecedoresCPF: TWideStringField;
    cdsFornecedoresCNPJ: TWideStringField;
    cdsFornecedoresCOMPLEMENTO: TWideStringField;
    cdsFornecedoresDATA_CADASTRO: TSQLTimeStampField;
    cdsFornecedoresDATA_ALTERACAO: TSQLTimeStampField;
    cdsFornecedoresCEP: TWideStringField;
    cdsFornecedoresIE: TWideStringField;
    cdsFornecedoresSTATUS_FOR: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GetNomeFornecedor(IdFornecedor : String) : String;
    function GetCpFornec(IdFornec : Integer) : Boolean;
    function GetStatus(IdFornec : String) : Boolean;

  end;

var
  dmFornecedores: TdmFornecedores;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModule2 }

procedure TdmFornecedores.GeraCodigo;
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
     FDQueryId.Open('SELECT MAX(ID_FORNEC) AS ID FROM FORNECEDORES');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsFornecedoresID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append()
    ;
  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;


end;

function TdmFornecedores.GetCpFornec(IdFornec: Integer): Boolean;
var
  FDQueryCpFornec : TFDQuery;

begin

  Result := False;
  FDQueryCpFornec := TFDQuery.Create(nil);

  try
    //  Estabelece a conexao com o banco
    FDQueryCpFornec.Connection := DataModule1.FDConnection;
    FDQueryCpFornec.Close;
    FDQueryCpFornec.SQL.Clear;
    FDQueryCpFornec.SQL.Add('SELECT * FROM CONTAS_PAGAR WHERE ID_FORNECEDOR = :IDFORNEC');

    FDQueryCpFornec.ParamByName('IDFORNEC').AsInteger := IdFornec;

    FDQueryCpFornec.Open();

    if not FDQueryCpFornec.IsEmpty then
    begin
      Result := True;
    end;


  finally

    FDQueryCpFornec.Close;
    FDQueryCpFornec.Free;

  end

end;

function TdmFornecedores.GetNomeFornecedor(IdFornecedor: String): String;
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
    FDQueryNome.SQL.Add('SELECT RAZAO_SOCIAL FROM FORNECEDORES WHERE ID_FORNEC = :ID');

    FDQueryNome.ParamByName('ID').AsString := IdFornecedor;

    FDQueryNome.Open();

    Result := FDQueryNome.FieldByName('RAZAO_SOCIAL').AsString;

  finally

    FDQueryNome.Close;
    FDQueryNome.Free;

  end;

end;

function TdmFornecedores.GetStatus(IdFornec: String): Boolean;
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
    FDQueryStatus.SQL.Add('SELECT STATUS_FOR FROM FORNECEDORES WHERE ID_FORNEC = :ID');

    FDQueryStatus.ParamByName('ID').AsString := IdFornec;

    FDQueryStatus.Open;

    if FDQueryStatus.FieldByName('STATUS_FOR').AsString = 'I' then
    begin
      Result := False;
    end
    else if FDQueryStatus.FieldByName('STATUS_FOR').AsString = 'A' then
    begin
      Result := True;
    end;


   finally

    FDQueryStatus.Close;
    FDQueryStatus.Free;

   end;



end;

end.
