unit SistemaFinanceiro.Model.dmPgtoBxCp;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Vcl.Dialogs;

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
    cdsPgtoBxCpVALOR_PAGO: TBCDField;
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

begin

  FDQueryId := TFDQuery.Create(nil);

  try
    FDQueryId.Connection := DataModule1.FDConnection;
    FDQueryId.Connection.StartTransaction;

    try

      FDQueryId.SQL.Text := 'SELECT COALESCE(MAX(ID), 0) + 1 AS NextID FROM PGTO_BX_CP';
      FDQueryId.Open;

      cdsPgtoBxCpID.AsInteger := FDQueryId.FieldByName('NextID').AsInteger;

      FDQueryId.Append;

      FDQueryId.Connection.Commit;

    except

      on E: Exception do
      begin
        FDQueryId.Connection.Rollback;
        ShowMessage('Erro: ' + E.Message);
      end;

    end;
  finally
    FDQueryId.Free;
  end;


end;

end.
