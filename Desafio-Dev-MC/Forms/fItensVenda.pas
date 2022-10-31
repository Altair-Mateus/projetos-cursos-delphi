unit fItensVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDmDados,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmItensVenda = class(TfrmCadastroPai)
    FDQueryClientes: TFDQuery;
    FDQueryVenda: TFDQuery;
    FDQueryVendaNRNOTA: TIntegerField;
    FDQueryVendaEMISSAO: TDateField;
    FDQueryVendaCLIENTE: TIntegerField;
    FDQueryVendaTIPO_VENDA: TWideStringField;
    FDQueryVendaVALOR_VENDA: TBCDField;
    FDQueryVendaOPERACAO_VENDA: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItensVenda: TfrmItensVenda;

implementation

{$R *.dfm}

end.
