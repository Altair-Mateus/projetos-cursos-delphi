unit fPesquisarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fPesquisarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, fCadastroProduto;

type
  TfrmPesquisarProdutos = class(TfrmPesquisarPai)
    FDQueryPesquisarCODIGO: TIntegerField;
    FDQueryPesquisarDESCRICAO: TWideStringField;
    FDQueryPesquisarREFERENCIA: TWideStringField;
    FDQueryPesquisarUNIDADE: TWideStringField;
    FDQueryPesquisarDATA_VENDA: TDateField;
    FDQueryPesquisarPRECO_VENDA: TBCDField;
    FDQueryPesquisarSALDO: TBCDField;
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonVisualizarClick(Sender: TObject);
  private
    { Private declarations }

    procedure Pesquisar;

  public
    { Public declarations }
  end;

var
  frmPesquisarProdutos: TfrmPesquisarProdutos;

implementation

{$R *.dfm}

{ TfrmPesquisarProdutos }

procedure TfrmPesquisarProdutos.ButtonNovoClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmCadastroProdutos := TfrmCadastroProdutos.Create(Self);

  try

    //  Exibe o Form
    frmCadastroProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroProdutos);

  end;

end;

procedure TfrmPesquisarProdutos.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;

  //  Chama a procedure de pesquisas
  Pesquisar;

end;

procedure TfrmPesquisarProdutos.ButtonVisualizarClick(Sender: TObject);
begin
  inherited;

   //  Cria o form
  frmCadastroProdutos := TfrmCadastroProdutos.Create(Self);

  try

    //  Pega o registro selecionado na tabela e abre o cadastro
    frmCadastroProdutos.FDQueryCadastro.Locate('codigo', FDQueryPesquisarCODIGO.AsInteger, []);

    //  Exibe o form
    frmCadastroProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroProdutos);

  end;

end;

procedure TfrmPesquisarProdutos.Pesquisar;
begin

  //  Fechando a query
  FDQueryPesquisar.Close;

  //  Limpando o sql da query
  FDQueryPesquisar.SQL.Clear;

  //  Adicionando o sql inicial
  FDQueryPesquisar.SQL.Add('select * from produtos where 1 = 1');

  //  Pesquisa por nome
  //  Funcao trim remove os espaços no inicio e fim do texto
  if Trim(EditNome.Text) <> '' then
  begin

    //  Incrementando o sql
    //  Funcao upper converte a string em letras maiusculas
    //  Funcao QuotedStr trata o texto e o coloca dentr aspas simples
    FDQueryPesquisar.SQl.Add('and upper(trim(descricao)) like ' + QuotedStr('%' + UpperCase(Trim(EditNome.Text)) + '%' ));

  end;

  //  Pesquisa por codigo
  if StrToIntDef(EditCodigo.Text, 0) > 0 then
  begin

    FDQueryPesquisar.SQL.Add('and codigo = ' + EditCodigo.Text);

  end;

  //  Ordena o resultado pelo nome
  if RadioButtonNome.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add(' order by descricao');

  end;

  //  Ordena o resultado por código
  if RadioButtonCodigo.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add('order by codigo');

  end;


  FDQueryPesquisar.Open();
  FDQueryPesquisar.FetchAll;

end;

end.
