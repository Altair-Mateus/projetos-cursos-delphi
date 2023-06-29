unit SistemaFinanceiro.Model.dmCaixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  SistemaFinanceiro.Model.Entidades.ResumoCaixa;

type
  TDataModuleCaixa = class(TDataModule)
    FDQueryCaixa: TFDQuery;
    DataSetProviderCaixa: TDataSetProvider;
    ClientDataSetCaixa: TClientDataSet;
    ClientDataSetCaixaid: TIntegerField;
    ClientDataSetCaixadata_cadastro: TDateField;
    ClientDataSetCaixavalor: TFMTBCDField;
    ClientDataSetCaixanumero_doc: TWideStringField;
    ClientDataSetCaixadescricao: TWideStringField;
    ClientDataSetCaixatipo: TWideStringField;
  private
    { Private declarations }

    function GetSaldoAnteriorCaixa(Data : TDate) : Currency;
    function GetTotalEntradasCaixa(DataInicial, DataFinal : TDate) : Currency;
    function GetTotalSaidasCaixa(DataInicial, DataFinal : TDate) : Currency;

  public
    { Public declarations }

    procedure GeraCodigo;

    function ResumoCaixa(DataInicial, DataFinal : TDate ) : TModelResumoCaixa;

  end;

var
  DataModuleCaixa: TDataModuleCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModule2 }

procedure TDataModuleCaixa.GeraCodigo;
var
  cod: Integer;
  FDQueryId: TFDQuery;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CAIXA');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    ClientDataSetCaixaid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TDataModuleCaixa.GetSaldoAnteriorCaixa(Data: TDate): Currency;
var
  FDQueryCaixa : TFDQuery;
  TotalEntradas : Currency;
  TotalSaidas : Currency;

begin

  Result := 0;
  FDQueryCaixa := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryCaixa.Connection := DataModule1.FDConnection;

    //  Pegando o valor total de entradas
    FDQueryCaixa.Close;
    FDQueryCaixa.SQL.Clear;
    FDQueryCaixa.SQL.Add('SELECT COALESCE(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''R'' ');
    FDQueryCaixa.SQL.Add(' AND DATA_CADASTRO < :DATA ');

    FDQueryCaixa.ParamByName('DATA').AsDate := Data;

    FDQueryCaixa.Open();
    TotalEntradas :=  FDQueryCaixa.FieldByName('VALOR').AsCurrency;


    //  Pegando o valor total de saidas
    FDQueryCaixa.Close;
    FDQueryCaixa.SQL.Clear;
    FDQueryCaixa.SQL.Add('SELECT COALESCE(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''D'' ');
    FDQueryCaixa.SQL.Add(' AND DATA_CADASTRO < :DATA ');

    FDQueryCaixa.ParamByName('DATA').AsDate := Data;

    FDQueryCaixa.Open();
    TotalSaidas :=  FDQueryCaixa.FieldByName('VALOR').AsCurrency;


  finally

    FDQueryCaixa.Close;
    FDQueryCaixa.Free;

  end;

  Result := TotalEntradas - TotalSaidas;


end;

function TDataModuleCaixa.GetTotalEntradasCaixa(DataInicial,
  DataFinal: TDate): Currency;
var
  FDqueryCaixa : TFDQuery;

begin

  Result := 0;
   FDqueryCaixa := TFDQuery.Create(nil);

   try

    //  Estabelece a conexao com o banco
    FDqueryCaixa.Connection := DataModule1.FDConnection;

    FDqueryCaixa.Close;
    FDqueryCaixa.SQL.Clear;

    FDqueryCaixa.SQL.Add('SELECT COALESCE(SUM(VALOR), 0 ) AS VALOR FROM CAIXA WHERE TIPO = ''R'' ');
    FDqueryCaixa.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATA_INICIAL AND :DATA_FINAL');

    FDqueryCaixa.ParamByName('DATA_INICIAL').AsDate := DataInicial;
    FDqueryCaixa.ParamByName('DATA_FINAL').AsDate := DataFinal;

    FDqueryCaixa.Open;

    Result := FDqueryCaixa.FieldByName('VALOR').AsCurrency;

   finally

    FDqueryCaixa.Close;
    FDqueryCaixa.Free;

   end;



end;

function TDataModuleCaixa.GetTotalSaidasCaixa(DataInicial,
  DataFinal: TDate): Currency;
var
 FDqueryCaixa : TFDQuery;

begin

  Result := 0;
  FDqueryCaixa := TFDQuery.Create(nil);

  try

    //  Estabelece a conexão com a query
    FDqueryCaixa.Connection := DataModule1.FDConnection;

    FDqueryCaixa.Close;
    FDqueryCaixa.SQL.Clear;
    FDqueryCaixa.SQL.Add('SELECT COALESCE(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''D'' ');
    FDqueryCaixa.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATA_INICIAL AND :DATA_FINAL');

    FDqueryCaixa.ParamByName('DATA_INICIAL').AsDate := DataInicial;
    FDqueryCaixa.ParamByName('DATA_FINAL').AsDate := DataFinal;

    FDqueryCaixa.Open;

    Result := FDqueryCaixa.FieldByName('VALOR').AsCurrency;

  finally

    FDqueryCaixa.Close;
    FDqueryCaixa.Free;

  end;

end;

function TDataModuleCaixa.ResumoCaixa(DataInicial,
  DataFinal: TDate): TModelResumoCaixa;
begin

  if DataInicial > DataFinal then
  begin

    raise Exception.Create('Data inicial não pode ser maior que a data final!');

  end;

  Result := TModelResumoCaixa.Create;

  try

    Result.SaldoInicial  := GetSaldoAnteriorCaixa(DataInicial);
    Result.TotalEntradas := GetTotalEntradasCaixa(DataInicial, DataFinal);
    Result.TotalSaidas   := GetTotalSaidasCaixa(DataInicial, DataFinal);

  except

    Result.Free;
    raise;

  end;

end;

end.
