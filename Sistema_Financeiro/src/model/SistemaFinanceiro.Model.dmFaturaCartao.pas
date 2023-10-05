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

end.
