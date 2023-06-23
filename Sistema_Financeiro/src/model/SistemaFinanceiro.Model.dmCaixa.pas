unit SistemaFinanceiro.Model.dmCaixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

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



  public
    { Public declarations }

    procedure GeraCodigo;

  end;

var
  DataModuleCaixa: TDataModuleCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

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

end.
