unit fCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Buttons, Vcl.ExtCtrls, uDmDados, System.ImageList,
  Vcl.ImgList;

type
  TfrmCadastroProdutos = class(TfrmCadastroPai)
    FDQueryCadastroCODIGO: TIntegerField;
    FDQueryCadastroDESCRICAO: TWideStringField;
    FDQueryCadastroREFERENCIA: TWideStringField;
    FDQueryCadastroUNIDADE: TWideStringField;
    FDQueryCadastroDATA_VENDA: TDateField;
    FDQueryCadastroPRECO_VENDA: TBCDField;
    FDQueryCadastroSALDO: TBCDField;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelDescricao: TLabel;
    DBEditDescricao: TDBEdit;
    LabelReferencia: TLabel;
    DBEditreferencia: TDBEdit;
    LabelUnidade: TLabel;
    LabelDataVenda: TLabel;
    DBEditDataVenda: TDBEdit;
    LabelPrecoVenda: TLabel;
    DBEditPrecoVenda: TDBEdit;
    LabelSaldo: TLabel;
    DBEditSaldo: TDBEdit;
    DBComboBox1: TDBComboBox;
    FDQueryProduto: TFDQuery;
    FDQueryProdutoMAX: TIntegerField;
    procedure limpa;
    procedure geraCodigo;
    procedure BitBtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

{ TfrmCadastroPai1 }

procedure TfrmCadastroProdutos.BitBtnNovoClick(Sender: TObject);
begin
  inherited;

  //  Limpa os Dbedits
  limpa;

  //  Gera codigo do cadastro
  geraCodigo;

end;

procedure TfrmCadastroProdutos.geraCodigo;
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
  DBEditDescricao.SetFocus;

end;

procedure TfrmCadastroProdutos.limpa;
var
  i: integer;
begin

  //  Limpa os campos
  for i := 0 to frmCadastroProdutos.ComponentCount -1 do
  begin
    if frmCadastroProdutos.Components[i] is TDBEdit then
      TDBEdit(frmCadastroProdutos.Components[i]).Clear

  end;
end;

end.
