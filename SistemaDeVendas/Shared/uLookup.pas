unit uLookup;

interface

uses
  System.SysUtils, System.Classes, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TDataModuleLookup = class(TDataModule)
    FDQueryEstados: TFDQuery;
    DataSourceEstados: TDataSource;
    FDTransaction: TFDTransaction;
    DataSourceCidade: TDataSource;
    FDQueryCidade: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleLookup: TDataModuleLookup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
