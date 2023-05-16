unit SistemaFinanceiro.Model.dmUsuarios;

interface

uses
  System.SysUtils, System.Classes, SistemaFinanceiro.Model.udmDados,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModuleUsuarios = class(TDataModule)
    FDQueryUsuarios: TFDQuery;
    ClientDataSetUsuarios: TClientDataSet;
    DataSetProviderUsuarios: TDataSetProvider;
    ClientDataSetUsuariosid: TIntegerField;
    ClientDataSetUsuariosdata_cadastro: TDateField;
    ClientDataSetUsuariosnome: TWideStringField;
    ClientDataSetUsuarioslogin: TWideStringField;
    ClientDataSetUsuariossenha: TWideStringField;
    ClientDataSetUsuariosstatus: TWideStringField;
    FDQueryId: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleUsuarios: TDataModuleUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
