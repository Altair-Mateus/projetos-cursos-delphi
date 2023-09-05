unit SistemaFinanceiro.Model.dmCaixa;
interface
uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  SistemaFinanceiro.Model.Entidades.ResumoCaixa, SistemaFinanceiro.Model.Entidades.LancamentoCaixa;
type
  TdmCaixa = class(TDataModule)
    FDQueryCaixa: TFDQuery;
    DataSetProviderCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    cdsCaixaORIGEM: TWideStringField;
    cdsCaixaID_ORIGEM: TIntegerField;
    cdsCaixaVALOR: TFMTBCDField;
    cdsCaixaID: TIntegerField;
    cdsCaixaNUMERO_DOC: TWideStringField;
    cdsCaixaDESCRICAO: TWideStringField;
    cdsCaixaTIPO: TWideStringField;
    cdsCaixaDATA_CADASTRO: TDateField;
  private
    { Private declarations }
    function GetSaldoAnteriorCaixa(Data : TDate) : Currency;
    function GetTotalEntradasCaixa(DataInicial, DataFinal : TDate) : Currency;
    function GetTotalSaidasCaixa(DataInicial, DataFinal : TDate) : Currency;

  public
    { Public declarations }
    procedure GeraCodigo;
    function ResumoCaixa(DataInicial, DataFinal : TDate ) : TModelResumoCaixa;
    function GeraId : Integer;
    procedure GravarLancamento(LancCaixa : TModelLancamentoCaixa; SQLGravar : TFDQuery);

  end;

var
  dmCaixa: TdmCaixa;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
uses
  SistemaFinanceiro.Model.udmDados;

{$R *.dfm}
{ TDataModule2 }

procedure TdmCaixa.GeraCodigo;
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
    cdsCaixaid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;
end;

function TdmCaixa.GeraId: Integer;
var
  FDQueryId: TFDQuery;

begin

  FDQueryId := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CAIXA');

    //  Ultimo codigo usado + 1
    Result := FDQueryId.FieldByName('ID').AsInteger + 1;

    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TdmCaixa.GetSaldoAnteriorCaixa(Data: TDate): Currency;
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

function TdmCaixa.GetTotalEntradasCaixa(DataInicial,
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

function TdmCaixa.GetTotalSaidasCaixa(DataInicial,
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

procedure TdmCaixa.GravarLancamento(LancCaixa: TModelLancamentoCaixa;
  SQLGravar: TFDQuery);
var
  SQL : String;

begin

  SQL := 'INSERT INTO CAIXA (ID, NUMERO_DOC, DESCRICAO, VALOR, TIPO, DATA_CADASTRO, ORIGEM, ID_ORIGEM) ' +
         ' VALUES (:IDCAIXA, :NDOC, :DESC, :VALOR, :TIPO, :DATA, :ORIGEM, :IDORIGEM)';

  SQLGravar.SQL.Clear;
  SQLGravar.Params.Clear;
  SQLGravar.SQL.Add(SQL);

  SQLGravar.ParamByName('IDCAIXA').AsInteger := LancCaixa.ID;
  SQLGravar.ParamByName('NDOC').AsString     := LancCaixa.NumDoc;
  SQLGravar.ParamByName('DESC').AsString     := LancCaixa.Desc;
  SQLGravar.ParamByName('VALOR').AsCurrency  := LancCaixa.Valor;
  SQLGravar.ParamByName('TIPO').AsString     := LancCaixa.Tipo;
  SQLGravar.ParamByName('DATA').AsDate       := LancCaixa.DataCadastro;
  SQLGravar.ParamByName('ORIGEM').AsString   := LancCaixa.Origem;
  SQLGravar.ParamByName('IDORIGEM').AsInteger := LancCaixa.IdOrigem;

  SQLGravar.Prepare;
  SQLGravar.ExecSQL;

end;

function TdmCaixa.ResumoCaixa(DataInicial,
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
