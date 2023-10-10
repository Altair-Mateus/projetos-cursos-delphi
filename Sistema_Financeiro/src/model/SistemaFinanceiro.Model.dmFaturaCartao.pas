unit SistemaFinanceiro.Model.dmFaturaCartao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmFaturaCartao = class(TDataModule)
    FDQueryFaturaCartao: TFDQuery;
    cdsFaturaCartao: TClientDataSet;
    DataSetProviderFaturaCartao: TDataSetProvider;
    cdsFaturaCartaoID_FT: TIntegerField;
    cdsFaturaCartaoNOME: TWideStringField;
    cdsFaturaCartaoOBSERVACAO: TWideStringField;
    cdsFaturaCartaoDIA_VCTO: TIntegerField;
    cdsFaturaCartaoDATA_CADASTRO: TSQLTimeStampField;
    cdsFaturaCartaoDATA_ALTERACAO: TSQLTimeStampField;
    cdsFaturaCartaoSTATUS_FT: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GetNomeFatCartao(IdFatCartao : String) : String;
    function GetDataVcto(IdFatCartao : String) : Integer;
    function GetStatusFatCartao(IdFatCartao : String) : boolean;
    function GetCpFat(IdFtCartao: Integer): Boolean;

  end;

var
  dmFaturaCartao: TdmFaturaCartao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TdmFaturaCartao }

procedure TdmFaturaCartao.GeraCodigo;
var
  FDQueryId : TFDQuery;
  cod : Integer;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(Self);

  try

    //  Estabelece conexao com o BD
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID_FT) AS ID FROM FATURA_CARTAO');

    //  Ultimo cod usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsFaturaCartaoID_FT.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TdmFaturaCartao.GetCpFat(IdFtCartao: Integer): Boolean;
var
  FDQueryCpFt : TFDQuery;

begin

  Result := False;
  FDQueryCpFt := TFDQuery.Create(nil);

  try
    //  Estabelece a conexao com o banco
    FDQueryCpFt.Connection := DataModule1.FDConnection;

    FDQueryCpFt.Close;
    FDQueryCpFt.SQL.Clear;
    FDQueryCpFt.SQL.Add('SELECT * FROM CONTAS_PAGAR WHERE ID_FATURA = :ID');

    FDQueryCpFt.ParamByName('ID').AsInteger := IdFtCartao;

    FDQueryCpFt.Open();

    if not FDQueryCpFt.IsEmpty then
    begin
      Result := True;
    end;


  finally

    FDQueryCpFt.Close;
    FDQueryCpFt.Free;

  end

end;

function TdmFaturaCartao.GetDataVcto(IdFatCartao: String): Integer;
var
  FDQueryDia: TFDQuery;

begin

  Result := 0;

  //  Criando a query
  FDQueryDia := TFDQuery.Create(nil);

  try

    //  Definindo a conexão
    FDQueryDia.Connection := DataModule1.FDConnection;

    FDQueryDia.Close;
    FDQueryDia.SQL.Clear;
    FDQueryDia.SQL.Add('SELECT DIA_VCTO FROM FATURA_CARTAO WHERE ID_FT = :ID');

    FDQueryDia.ParamByName('ID').AsString := IdFatCartao;

    FDQueryDia.Open();

    Result := FDQueryDia.FieldByName('DIA_VCTO').AsInteger;

  finally

    FDQueryDia.Close;
    FDQueryDia.Free;

  end;

end;

function TdmFaturaCartao.GetNomeFatCartao(IdFatCartao : String) : String;
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
    FDQueryNome.SQL.Add('SELECT NOME FROM FATURA_CARTAO WHERE ID_FT = :ID');

    FDQueryNome.ParamByName('ID').AsString := IdFatCartao;

    FDQueryNome.Open();

    Result := FDQueryNome.FieldByName('NOME').AsString;

  finally

    FDQueryNome.Close;
    FDQueryNome.Free;

  end;


end;

function TdmFaturaCartao.GetStatusFatCartao(IdFatCartao: String): boolean;
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
    FDQueryStatus.SQL.Add('SELECT STATUS_FT FROM FATURA_CARTAO WHERE ID_FT = :ID');

    FDQueryStatus.ParamByName('ID').AsString := IdFatCartao;

    FDQueryStatus.Open;

    if FDQueryStatus.FieldByName('STATUS_FT').AsString = 'I' then
    begin
      Result := False;
    end
    else if FDQueryStatus.FieldByName('STATUS_FT').AsString = 'A' then
    begin
      Result := True;
    end;


   finally

    FDQueryStatus.Close;
    FDQueryStatus.Free;

   end;



end;

end.
