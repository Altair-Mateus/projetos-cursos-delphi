unit SistemaFinanceiro.Model.dmCPagar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient;

type
  TDataModuleCPagar = class(TDataModule)
    FDQueryCPagar: TFDQuery;
    DataSetProviderCPagar: TDataSetProvider;
    ClientDataSetCPagar: TClientDataSet;
    ClientDataSetCPagarID: TIntegerField;
    ClientDataSetCPagarNUMERO_DOC: TWideStringField;
    ClientDataSetCPagarDESCRICAO: TWideStringField;
    ClientDataSetCPagarPARCELA: TIntegerField;
    ClientDataSetCPagarVALOR_PARCELA: TFMTBCDField;
    ClientDataSetCPagarVALOR_COMPRA: TFMTBCDField;
    ClientDataSetCPagarVALOR_ABATIDO: TFMTBCDField;
    ClientDataSetCPagarDATA_COMPRA: TDateField;
    ClientDataSetCPagarDATA_CADASTRO: TDateField;
    ClientDataSetCPagarDATA_VENCIMENTO: TDateField;
    ClientDataSetCPagarDATA_PAGAMENTO: TDateField;
    ClientDataSetCPagarSTATUS: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
  end;

var
  DataModuleCPagar: TDataModuleCPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModuleCPagar }

procedure TDataModuleCPagar.GeraCodigo;
var
  FDQueryCPagar : TFDQuery;
  cod : integer;

begin

  cod := 0;
  FDQueryCPagar := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryCPagar.Connection := DataModule1.FDConnection;

    FDQueryCPagar.Close;
    FDQueryCPagar.SQL.Clear;
    FDQueryCPagar.Open('SELECT MAX(ID) AS ID FROM CONTAS_PAGAR');

    //  Ultimo codigo usado + 1
    cod := FDQueryCPagar.FieldByName('ID').AsInteger + 1;

    ClientDataSetCPagarid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryCPagar.Append;

  finally

    FDQueryCPagar.Close;
    FDQueryCPagar.Free;

  end;

end;

end.
