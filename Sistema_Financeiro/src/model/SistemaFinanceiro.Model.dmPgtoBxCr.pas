unit SistemaFinanceiro.Model.dmPgtoBxCr;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPgtoBxCr = class(TDataModule)
    FDQueryPgtoBxCr: TFDQuery;
    DataSetProviderPgtoBxCr: TDataSetProvider;
    cdsPgtoBxCr: TClientDataSet;
    cdsPgtoBxCrID: TIntegerField;
    cdsPgtoBxCrID_CR: TIntegerField;
    cdsPgtoBxCrID_FR_PGTO: TIntegerField;
    cdsPgtoBxCrNR_FR: TIntegerField;
    cdsPgtoBxCrDATA_HORA: TSQLTimeStampField;
    cdsPgtoBxCrVALOR_PAGO: TFMTBCDField;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GeraCodigo;

  end;

var
  dmPgtoBxCr: TdmPgtoBxCr;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TdmPgtoBxCr }

procedure TdmPgtoBxCr.GeraCodigo;
var
  FDQueryId : TFDQuery;
  cod : Integer;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(Self);

  try

    //  Estabele a conexão com o BD
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM PGTO_BX_CR');

    //  Ultimo cod usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsPgtoBxCrID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

end.
