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
  FDQueryId : TFDQuery;
  cod : integer;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CONTAS_PAGAR');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsCPagarid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

end.
