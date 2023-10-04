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
    cdsFaturaCartaoDATA_CADASTRO: TDateField;
    cdsFaturaCartaoDATA_ALTERACAO: TDateField;
    cdsFaturaCartaoSTATUS_FT: TWideStringField;
    cdsFaturaCartaoDIA_VCTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFaturaCartao: TdmFaturaCartao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

end.
