unit uFormCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormCadastroCliente = class(TFormCadastroPai)
    FDQueryCadastroID_CLIENTE: TIntegerField;
    FDQueryCadastroRAZAO_SOCIAL: TWideStringField;
    FDQueryCadastroFANTASIA: TWideStringField;
    FDQueryCadastroCPF_CNPJ: TWideStringField;
    FDQueryCadastroTIPO_FJ: TWideStringField;
    FDQueryCadastroNOME: TWideStringField;
    FDQueryCadastroEMAIL: TWideStringField;
    FDQueryCadastroSITE: TWideStringField;
    FDQueryCadastroENDERECO: TWideStringField;
    FDQueryCadastroCOMPLEMENTO: TWideStringField;
    FDQueryCadastroNUMERO: TWideStringField;
    FDQueryCadastroIE: TWideStringField;
    FDQueryCadastroIM: TWideStringField;
    FDQueryCadastroDT_EXCLUIDO: TDateField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBComboBoxTipoFJ: TDBComboBox;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    FDQueryCadastroBAIRRO: TWideStringField;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

end.
