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
    DBComboBoxUn: TDBComboBox;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);

  private
    { Private declarations }
    procedure limpaCampos;
    procedure geraCodigo;
    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

{ TfrmCadastroPai1 }

procedure TfrmCadastroProdutos.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Fecha a tela
  frmCadastroProdutos.Close;

end;

procedure TfrmCadastroProdutos.BitBtnNovoClick(Sender: TObject);
begin
  inherited;

  //  Limpa os Dbedits
  limpaCampos;

  //  Gera codigo do cadastro
  geraCodigo;

end;

procedure TfrmCadastroProdutos.BitBtnSalvarClick(Sender: TObject);
begin

  //  Valida os campos
  ValidaCampos;

  //  Executa o codigo da heranca
  inherited;

  //  Limpa os campos
  limpaCampos;

end;

procedure TfrmCadastroProdutos.geraCodigo;
var
  cod: integer;
  FDQueryProduto: TFDQuery;
begin

  cod := 0;

  //  Cria query
  FDQueryProduto := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryProduto.Connection := dmDados.FDConnection;

    //  Ve o ultimo codigo usado
    FDQueryProduto.Close;
    FDQueryProduto.SQL.Clear;
    FDQueryProduto.SQL.Add(' select max(codigo) as codigo' );
    FDQueryProduto.SQL.Add(' from produtos ');
    FDQueryProduto.Open;

    //  Ultimo codigo usado + 1
    cod := FDQueryProduto.FieldByName('codigo').AsInteger + 1;

    //  Insere o registro no final da tabela
    FDQueryProduto.Append();

    //  Seta no edit o codigo gerado
    DBEditCodigo.Text := IntToStr(cod);

    //  Posiciona o cursor
    DBEditDescricao.SetFocus;

  finally

    //  Libera da memoria
    FDQueryProduto.free;

  end;




end;

procedure TfrmCadastroProdutos.limpaCampos;
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

procedure TfrmCadastroProdutos.ValidaCampos;
begin

  //  Valida se os campos obrigatorios
  //  foram preenchidos
  if DBEditDescricao.Text = EmptyStr then
  begin

    ShowMessage('Preencha a Descrição do Produto!');
    DBEditDescricao.SetFocus;
    Abort;

  end;

end;

end.
