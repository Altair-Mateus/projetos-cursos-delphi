unit uFormCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uLookup;

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
    DBEditRazaoSocial: TDBEdit;
    Label3: TLabel;
    DBEditFantasia: TDBEdit;
    Label4: TLabel;
    DBEditCnpj: TDBEdit;
    Label5: TLabel;
    DBComboBoxTipoFJ: TDBComboBox;
    DBEditCliente: TDBEdit;
    Label6: TLabel;
    DBEditNome: TDBEdit;
    Label7: TLabel;
    DBEditEmail: TDBEdit;
    Label8: TLabel;
    DBEditSite: TDBEdit;
    Label9: TLabel;
    DBEditEndereco: TDBEdit;
    Label10: TLabel;
    DBEditComplemento: TDBEdit;
    FDQueryCadastroBAIRRO: TWideStringField;
    Label11: TLabel;
    DBEditNumero: TDBEdit;
    Label12: TLabel;
    DBEditBairro: TDBEdit;
    Label13: TLabel;
    DBEditIm: TDBEdit;
    Label14: TLabel;
    DBEditIe: TDBEdit;
    FDQueryCadastroID_CIDADE: TIntegerField;
    FDQueryCadastroID_ESTADO: TIntegerField;
    Label15: TLabel;
    Label16: TLabel;
    DBLookupComboBoxCidade: TDBLookupComboBox;
    DBLookupComboBoxEstado: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FDQueryCadastroBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

procedure TFormCadastroCliente.FDQueryCadastroBeforeEdit(DataSet: TDataSet);
begin
  inherited;

  // Coloca o cursor no campo razao social
  //  quando os componentes ja estiverem visiveis
  if Self.Visible then
  begin

    DBEditRazaoSocial.SetFocus;

  end;

end;

procedure TFormCadastroCliente.FormShow(Sender: TObject);
begin
  inherited;

  //  Abre a query de estados
  DataModuleLookup.FDQueryEstados.Open();
  //  Mostra todos os resultados da query
  DataModuleLookup.FDQueryEstados.FetchAll;

  //  Abre a query de cidades
  DataModuleLookup.FDQueryCidade.Open();
  //  Mostra todos os resultados da query
  DataModuleLookup.FDQueryCidade.FetchAll;

  //  Coloca o cursor no campo razao social
  DBEditRazaoSocial.SetFocus;


end;

end.
