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
    cdsPgtoBxCrVALOR_PAGO: TBCDField;
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

uses SistemaFinanceiro.Model.udmDados, Vcl.Dialogs;

{$R *.dfm}

{ TdmPgtoBxCr }

procedure TdmPgtoBxCr.GeraCodigo;
var
  FDQueryId : TFDQuery;

begin

  FDQueryId := TFDQuery.Create(Self);

   try
    FDQueryId.Connection := DataModule1.FDConnection;
    FDQueryId.Connection.StartTransaction;

    try

      FDQueryId.SQL.Text := 'SELECT COALESCE(MAX(ID), 0) + 1 AS NextID FROM PGTO_BX_CR';
      FDQueryId.Open;

      cdsPgtoBxCrID.AsInteger := FDQueryId.FieldByName('NextID').AsInteger;

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
