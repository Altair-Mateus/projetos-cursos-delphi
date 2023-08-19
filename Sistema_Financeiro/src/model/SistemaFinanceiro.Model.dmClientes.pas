unit SistemaFinanceiro.Model.dmClientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmClientes = class(TDataModule)
    FDQueryClientes: TFDQuery;
    DataSetProviderClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesID: TIntegerField;
    cdsClientesNOME: TWideStringField;
    cdsClientesTIPO: TWideStringField;
    cdsClientesCPF: TWideStringField;
    cdsClientesCNPJ: TWideStringField;
    cdsClientesIE: TWideStringField;
    cdsClientesENDERECO: TWideStringField;
    cdsClientesN_LOGRADOURO: TWideStringField;
    cdsClientesBAIRRO: TWideStringField;
    cdsClientesCIDADE: TWideStringField;
    cdsClientesESTADO: TWideStringField;
    cdsClientesCEP: TWideStringField;
    cdsClientesCELULAR: TWideStringField;
    cdsClientesTELEFONE: TWideStringField;
    cdsClientesCOMPLEMENTO: TWideStringField;
    cdsClientesEMAIL: TWideStringField;
    cdsClientesDATA_CADASTRO: TSQLTimeStampField;
    cdsClientesDATA_ALTERACAO: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;

  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModule2 }

procedure TdmClientes.GeraCodigo;
var
  cod: integer;
  FDQueryId : TFDQuery;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(nil);

  try

     //  Estabelece a conexao com o banco
     FDQueryId.Connection :=  DataModule1.FDConnection;

     FDQueryId.Close;
     FDQueryId.sql.Clear;
     FDQueryId.Open('SELECT MAX(ID) AS ID FROM CLIENTES');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsClientesID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append()
    ;
  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

end.
