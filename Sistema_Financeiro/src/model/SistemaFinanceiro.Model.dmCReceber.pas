unit SistemaFinanceiro.Model.dmCReceber;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCReceber = class(TDataModule)
    FDQueryCReceber: TFDQuery;
    cdsCReceber: TClientDataSet;
    DataSetProviderCReceber: TDataSetProvider;
    cdsCReceberID: TIntegerField;
    cdsCReceberNUMERO_DOCUMENTO: TWideStringField;
    cdsCReceberDESCRICAO: TWideStringField;
    cdsCReceberPARCELA: TIntegerField;
    cdsCReceberVALOR_PARCELA: TFMTBCDField;
    cdsCReceberVALOR_VENDA: TFMTBCDField;
    cdsCReceberVALOR_ABATIDO: TFMTBCDField;
    cdsCReceberDATA_COMPRA: TDateField;
    cdsCReceberDATA_CADASTRO: TDateField;
    cdsCReceberDATA_VENCIMENTO: TDateField;
    cdsCReceberDATA_RECEBIMENTO: TDateField;
    cdsCReceberSTATUS: TWideStringField;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GeraCodigo;

  end;

var
  dmCReceber: TdmCReceber;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TdmCReceber }

procedure TdmCReceber.GeraCodigo;
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
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CONTAS_RECEBER');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsCReceberID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;


end;

end.
