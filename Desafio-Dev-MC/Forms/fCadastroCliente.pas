unit fCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uDmDados, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroCliente = class(TfrmCadastroPai)
    FDQueryCadastroCODIGO: TIntegerField;
    FDQueryCadastroNOME: TWideStringField;
    FDQueryCadastroENDERECO: TWideStringField;
    FDQueryCadastroBAIRRO: TWideStringField;
    FDQueryCadastroCIDADE: TWideStringField;
    FDQueryCadastroCEP: TWideStringField;
    FDQueryCadastroUF: TWideStringField;
    FDQueryCadastroFONE: TWideStringField;
    FDQueryCadastroCELULAR: TWideStringField;
    FDQueryCadastroEMAIL: TWideStringField;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelCodigo: TLabel;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelBairro: TLabel;
    DBEditBairro: TDBEdit;
    LabelCidade: TLabel;
    DBEditCidade: TDBEdit;
    LabelCep: TLabel;
    DBEditCep: TDBEdit;
    LabelUf: TLabel;
    DBEditUf: TDBEdit;
    LabelFone: TLabel;
    DBEditFone: TDBEdit;
    LabelCelular: TLabel;
    DBEditCelular: TDBEdit;
    LabelEmail: TLabel;
    DBEditEmail: TDBEdit;
    DBEditCodigo: TDBEdit;
    FDQueryCliente: TFDQuery;
    FDQueryClienteMAX: TIntegerField;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure limpa;
    procedure geraCodigo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.geraCodigo;
var
  cod: integer;

begin

  cod := 0;

  //  Abre a query
  FDQueryCadastro.Open();

  //  Ve o ultimo registro
  FDQueryCadastro.Last();

  //  Pega o último código gerado e soma + 1
  cod := FDQueryCadastro.FieldByName('CODIGO').AsInteger + 1;

  //  Insere o registro no final da tabela
  FDQueryCadastro.Append();

  //  Seta no edit o codigo gerado
  DBEditCodigo.Text := IntToStr(cod);

  //  Posiciona o cursor
  DBEditNome.SetFocus;

end;

procedure TfrmCadastroCliente.limpa;
var
  i: integer;
begin

  //  Limpa os campos
  for i := 0 to frmCadastroCliente.ComponentCount -1 do
  begin
    if frmCadastroCliente.Components[i] is TDBEdit then
      TDBEdit(frmCadastroCliente.Components[i]).Clear

  end;



end;

procedure TfrmCadastroCliente.BitBtnNovoClick(Sender: TObject);
begin
inherited;

  //  Limpa os Dbedits
  limpa;

  //  Gera codigo do cadastro
  geraCodigo;

end;

end.
