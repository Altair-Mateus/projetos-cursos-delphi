unit SistemaFinanceiro.Model.dmCPagar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient;

type
  TdmCPagar = class(TDataModule)
    FDQueryCPagar: TFDQuery;
    DataSetProviderCPagar: TDataSetProvider;
    cdsCPagar: TClientDataSet;
    cdsCPagarID: TIntegerField;
    cdsCPagarNUMERO_DOC: TWideStringField;
    cdsCPagarDESCRICAO: TWideStringField;
    cdsCPagarPARCELA: TIntegerField;
    cdsCPagarVALOR_PARCELA: TFMTBCDField;
    cdsCPagarVALOR_COMPRA: TFMTBCDField;
    cdsCPagarVALOR_ABATIDO: TFMTBCDField;
    cdsCPagarDATA_COMPRA: TDateField;
    cdsCPagarDATA_CADASTRO: TDateField;
    cdsCPagarDATA_VENCIMENTO: TDateField;
    cdsCPagarDATA_PAGAMENTO: TDateField;
    cdsCPagarSTATUS: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
  end;

var
  dmCPagar: TdmCPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModuleCPagar }

procedure TdmCPagar.GeraCodigo;
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

    cdsCPagarid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryCPagar.Append;

  finally

    FDQueryCPagar.Close;
    FDQueryCPagar.Free;

  end;

end;

end.
