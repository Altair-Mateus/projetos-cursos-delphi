unit SistemaFinanceiro.Model.dmPgtoBxCp;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmPgtoBxCp = class(TDataModule)
    FDQueryPgtoBxCp: TFDQuery;
    DataSetProviderPgtoBxCp: TDataSetProvider;
    cdsPgtoBxCp: TClientDataSet;
    cdsPgtoBxCpID: TIntegerField;
    cdsPgtoBxCpID_CP: TIntegerField;
    cdsPgtoBxCpID_FR_PGTO: TIntegerField;
    cdsPgtoBxCpNR_FR: TIntegerField;
    cdsPgtoBxCpDATA_HORA: TSQLTimeStampField;
    cdsPgtoBxCpVALOR_PAGO: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;

  end;

var
  dmPgtoBxCp: TdmPgtoBxCp;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TdmPgtoBxCp }

procedure TdmPgtoBxCp.GeraCodigo;
var
  FDQueryId : TFDQuery;
  cod : Integer;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(Self);

  try

    //  Estabelece conexão com o Bd
    FDQueryId.Connection := DataModule1.FDConnection;

    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM PGTO_BX_CP');

    //  Ultimo cod usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsPgtoBxCpID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

end.
