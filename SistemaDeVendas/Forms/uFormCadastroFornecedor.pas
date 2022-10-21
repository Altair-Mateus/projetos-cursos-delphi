unit uFormCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uLookup;

type
  TFormCadastroFornecedor = class(TFormCadastroPai)
    FDQueryCadastroID_FORNECEDOR: TIntegerField;
    FDQueryCadastroRAZAO_SOCIAL: TWideStringField;
    FDQueryCadastroFANTASIA: TWideStringField;
    FDQueryCadastroCNPJ: TWideStringField;
    FDQueryCadastroENDERECO: TWideStringField;
    FDQueryCadastroBAIRRO: TWideStringField;
    FDQueryCadastroID_CIDADE: TIntegerField;
    FDQueryCadastroID_ESTADO: TIntegerField;
    FDQueryCadastroEMAIL: TWideStringField;
    Label1: TLabel;
    DBEditIdFornecedor: TDBEdit;
    Label2: TLabel;
    DBEditRazaoSocial: TDBEdit;
    Label3: TLabel;
    DBEditFantasia: TDBEdit;
    Label4: TLabel;
    DBEditCnpj: TDBEdit;
    Label5: TLabel;
    DBEditEndereco: TDBEdit;
    Label6: TLabel;
    DBEditBairro: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEditEmail: TDBEdit;
    DBLookupComboBoxCidade: TDBLookupComboBox;
    DBLookupComboBoxEstado: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFornecedor: TFormCadastroFornecedor;

implementation

{$R *.dfm}

procedure TFormCadastroFornecedor.FormShow(Sender: TObject);
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
