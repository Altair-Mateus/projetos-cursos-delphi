unit fCadastroVenda;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  fPesquisarProdutos, fPesquisarCliente, fCadastroProduto, uDmDados, uBiblioteca,
  RxToolEdit, RxCurrEdit, fCadastroCliente, System.ImageList, Vcl.ImgList;
type
  TfrmCadastroVenda = class(TfrmCadastroPai)
    FDQueryCadastroNRNOTA: TIntegerField;
    FDQueryCadastroEMISSAO: TDateField;
    FDQueryCadastroCLIENTE: TIntegerField;
    FDQueryCadastroTIPO_VENDA: TWideStringField;
    FDQueryCadastroVALOR_VENDA: TBCDField;
    FDQueryCadastroOPERACAO_VENDA: TWideStringField;
    PanelCabecalhoVenda: TPanel;
    LabelNrNota: TLabel;
    DBEditNrNota: TDBEdit;
    LabelEmissao: TLabel;
    LabelCliente: TLabel;
    DBEditCodCLiente: TDBEdit;
    LabelTipoVenda: TLabel;
    LabelOpVenda: TLabel;
    PanelProdutos: TPanel;
    ButtonCliente: TButton;
    DBComboBoxTipoVenda: TDBComboBox;
    DBComboBoxOpVenda: TDBComboBox;
    DBEditEmissao: TDBEdit;
    FDQueryProduto: TFDQuery;
    DataSourceItemNota: TDataSource;
    FDQueryItemNota: TFDQuery;
    PanelItems: TPanel;
    FDQueryItemNotaLCTO: TIntegerField;
    FDQueryItemNotaNR_VENDA: TIntegerField;
    FDQueryItemNotaPRODUTO: TIntegerField;
    FDQueryItemNotaQTDE: TBCDField;
    FDQueryItemNotaVALOR_UNIT: TBCDField;
    FDQueryItemNotaVALOR_TOTAL: TBCDField;
    LabelProduto: TLabel;
    LabelQtde: TLabel;
    LabelValorUnit: TLabel;
    LabelValorTotalVenda: TLabel;
    ButtonProduto: TButton;
    LabelLcto: TLabel;
    ButtonAdicionar: TButton;
    DBGridItensVenda: TDBGrid;
    FDTransactionItemNota: TFDTransaction;
    EditProduto: TEdit;
    EditQtd: TEdit;
    EditValorUnit: TEdit;
    EditValorTotal: TEdit;
    FDQueryItemNotaDescProduto: TStringField;
    EditLcto: TEdit;
    FDQueryProdutoCODIGO: TIntegerField;
    FDQueryProdutoDESCRICAO: TWideStringField;
    FDQueryProdutoREFERENCIA: TWideStringField;
    FDQueryProdutoUNIDADE: TWideStringField;
    FDQueryProdutoDATA_VENDA: TDateField;
    FDQueryProdutoPRECO_VENDA: TBCDField;
    FDQueryProdutoSALDO: TBCDField;
    FDQueryCliente: TFDQuery;
    LabelNomeCliente: TLabel;
    LabelDescProd: TLabel;
    FDQueryProduto1: TFDQuery;
    FDQueryItemVenda: TFDQuery;
    FDQueryItemVendaMAX: TIntegerField;
    Label1: TLabel;
    DBEditTotalVenda: TDBEdit;
    FDQueryVenda: TFDQuery;
    Label2: TLabel;
    FDQueryVendaEMISSAO: TDateField;
    PanelOpVenda: TPanel;
    LabelOp: TLabel;
    LabelOrc: TLabel;
    LabelPreVenda: TLabel;
    LabelVenda: TLabel;
    FDQueryItensVenda: TFDQuery;
    procedure ButtonClienteClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure ButtonProdutoClick(Sender: TObject);
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure EditQtdExit(Sender: TObject);
    procedure EditValorUnitExit(Sender: TObject);
    procedure DBComboBoxOpVendaExit(Sender: TObject);
    procedure EditProdutoExit(Sender: TObject);
    procedure DBEditCodCLienteExit(Sender: TObject);
    procedure DBGridItensVendaDblClick(Sender: TObject);

  private
    { Private declarations }
    procedure GravarItem;
    procedure GeraNumeroVenda;
    procedure BuscaNomeProduto;
    procedure CalculaValorTotalItem;
    procedure LimpaCamposItens;
    procedure BuscaNomeCliente;
    procedure GeraNumeroLcto;
    procedure BaixaEstoque;
    procedure CalculaTotalVenda;
    procedure LimpaCampos;

  public
    { Public declarations }
  end;
var
  frmCadastroVenda: TfrmCadastroVenda;

implementation
{$R *.dfm}


procedure TfrmCadastroVenda.BaixaEstoque;
var
  data_emissao: TDate;
  nrnota: string;
begin


if FDQueryCadastroOPERACAO_VENDA.Value = 'V' then
  begin

    //  Passa o numero da venda para a variavel nrnota
    nrnota := DBEditNrNota.text;

    //  consulta os itens da venda de acordo com nrnota
    FDQueryItemNota.Close;
    FDQueryItemNota.SQL.Clear;
    FDQueryItemNota.SQL.Add('select * from item_venda ');
    FDQueryItemNota.SQL.Add(' where nr_venda = ' + QuotedStr(nrnota));
    FDQueryItemNota.Open();

    //  Busca emissao da venda de acordo com nrnota
    FDQueryVenda.Close;
    FDQueryVenda.SQL.Clear;
    FDQueryVenda.SQL.Add('select * from venda ');
    FDQueryVenda.SQL.Add(' where nrnota = ' + QuotedStr(nrnota));
    FDQueryVenda.Open();


    //  Atualiza o estoque dos produtos e seta
    //  a data da ultima venda
    while not FDQueryItemNota.Eof do
    begin

      FDQueryProduto.Close;
      FDQueryProduto.SQL.Clear;
      FDQueryProduto.SQL.Add('update produtos ');
      FDQueryProduto.SQL.Add(' set ');
      FDQueryProduto.SQL.Add(' saldo = saldo - :pr00, ');
      FDQueryProduto.SQL.Add(' data_venda = :pr01 ');
      FDQueryProduto.SQL.Add(' where codigo = :pr02 ');


      FDQueryProduto.Params[0].AsFloat :=  FDQueryItemNotaQTDE.Value;
      FDQueryProduto.Params[1].AsDateTime := FDQueryCadastroEMISSAO.Value;
      FDQueryProduto.Params[2].AsFloat :=  FDQueryItemNotaPRODUTO.Value;

      FDQueryProduto.ExecSQL;

      FDQueryItemNota.Next;

    end;

  end;


  //  Se for pre venda ira baixar somente estoque
  if FDQueryCadastroOPERACAO_VENDA.Value = 'P' then
  begin

    //  Passa o numero da venda para a variavel nrnota
    nrnota := DBEditNrNota.text;

    //  consulta os itens da venda de acordo com nrnota
    FDQueryItemNota.Close;
    FDQueryItemNota.SQL.Clear;
    FDQueryItemNota.SQL.Add('select * from item_venda ');
    FDQueryItemNota.SQL.Add(' where nr_venda = ' + QuotedStr(nrnota) + '');
    FDQueryItemNota.Open();

    //  Atualiza o estoque dos produtos
    while not FDQueryItemNota.Eof do
    begin

      FDQueryProduto.Close;
      FDQueryProduto.SQL.Clear;
      FDQueryProduto.SQL.Add('update produtos ');
      FDQueryProduto.SQL.Add(' set ');
      FDQueryProduto.SQL.Add(' saldo = saldo - :pr00 ');
      FDQueryProduto.SQL.Add(' where codigo = :pr01 ');

      FDQueryProduto.Params[0].AsFloat :=  FDQueryItemNotaQTDE.Value;
      FDQueryProduto.Params[1].AsFloat :=  FDQueryItemNotaPRODUTO.Value;

      FDQueryProduto.ExecSQL;

      FDQueryItemNota.Next;

    end;

  end;


end;

procedure TfrmCadastroVenda.BitBtnNovoClick(Sender: TObject);
begin

  BitBtnSalvar.Enabled   := True;
  BitBtnCancelar.Enabled := True;
  BitBtnNovo.Enabled     := False;
  PanelCampos.Enabled    := True;

  // Abre a query
  FDQueryCadastro.Open();

  //  Se o FDQuery não estiver inserindo ou editando entraremos no modo de insert
  if not (FDQueryCadastro.State in [dsEdit, dsInsert]) then
  begin

    FDQueryCadastro.Insert;

  end;

  //  erro
//  FDQueryItemNota.SQL.Cleara;
//  FDQueryItemNota.SQL.Add('select * from item_venda where nr_venda = :nr_venda');
  FDQueryItemNota.Active := True;

  //  Se o FDQuery não estiver inserindo ou editando entraremos no modo de insert
  if not (FDQueryItemNota.State in [dsEdit, dsInsert]) then
  begin

    FDQueryItemNota.Insert;

  end;

  LimpaCampos;

  PanelCabecalhoVenda.Enabled := True;

  FDQueryCadastroEMISSAO.AsDateTime := Date;
  FDTransactionItemNota.StartTransaction;


  //  Cria o numero da venda
  GeraNumeroVenda;

  DBEditTotalVenda.Text := '0';


end;

procedure TfrmCadastroVenda.BitBtnSalvarClick(Sender: TObject);
begin

  if FDQueryCadastro.State in [dsEdit, dsInsert] then
  begin

    //  Inicia a transaction
    FDTransactionCadastro.StartTransaction;

    //  Grava no banco
    FDQueryCadastro.Post;

    //  Fecha a transaction
    FDTransactionCadastro.Commit;

    ShowMessage('Cadastro Salvo!');


  end;

   if FDQueryItemNota.State in [dsEdit, dsInsert] then
  begin


    //  Grava no banco
    FDQueryItemNota.Post;

    //  Fecha a transaction
    FDTransactionItemNota.Commit;




  end;


  BaixaEstoque;
  FDQueryCadastro.Close;
  FDQueryItemNota.Close;
  FDQueryProduto.Close;

  LimpaCampos;

  DataSourceItemNota.DataSet.Close;

  BitBtnSalvar.Enabled   := False;
  BitBtnCancelar.Enabled := False;
  BitBtnNovo.Enabled     := True;
  PanelCampos.Enabled    := False;


end;

procedure TfrmCadastroVenda.BuscaNomeCliente;
begin

  if Trim(DBEditCodCLiente.Text) <> '' then
    begin
      FDQueryCliente.Close;
      FDQueryCliente.SQL.Clear;
      FDQueryCliente.SQL.Add(' select nome from cliente ');
      FDQueryCliente.SQL.Add('where codigo =' + QuotedStr(DBEditCodCLiente.Text));
      FDQueryCliente.Open;
      if FDQueryCliente.RecordCount > 0 then
      begin
        LabelNomeCliente.Caption := FDQueryCliente.FieldByName('nome').AsString;
      end
      else
      begin
        ShowMessage
        ('Cliente não encontrado!');
        DBEditCodCLiente.SetFocus;
        DBEditCodCLiente.Clear;
      end;

    end;


end;

procedure TfrmCadastroVenda.BuscaNomeProduto;
begin

  //  De acordo com o codigo do produto
  //  busca o valor e descricao
  if Trim(EditProduto.Text) <> '' then
  begin

    FDQueryProduto1.Close;
    FDQueryProduto1.SQL.Clear;
    FDQueryProduto1.SQL.Add('select descricao, preco_venda from produtos ');
    FDQueryProduto1.SQL.Add('where codigo =' + QuotedStr(EditProduto.Text));
    FDQueryProduto1.Open;

    if FDQueryProduto1.RecordCount > 0 then
    begin

      LabelDescProd.Caption := FDQueryProduto1.FieldByName('descricao').AsString;
      EditValorUnit.Text    := FDQueryProduto1.FieldByName('preco_venda').AsString;

      EditQtd.Text     := '1';
      EditQtd.SetFocus;

    end
    else
    begin

      ShowMessage('Produto não encontrado!');
      EditProduto.SetFocus;
      EditProduto.Clear;

    end;



  end;

end;

procedure TfrmCadastroVenda.ButtonAdicionarClick(Sender: TObject);
var
  i: integer;

begin


  GravarItem;
  LimpaCamposItens;

  EditProduto.SetFocus;

end;
procedure TfrmCadastroVenda.ButtonClienteClick(Sender: TObject);
begin

  //  Cria o Form
  frmPesquisarClientes := TfrmPesquisarClientes.Create(Self);
  try

    //  Exibe o Form
    frmPesquisarClientes.ShowModal;
  finally
    //  Libera da memoria
    FreeAndNil(frmPesquisarClientes);
  end;

end;
procedure TfrmCadastroVenda.ButtonProdutoClick(Sender: TObject);
begin

  // Cria o form
  frmPesquisarProdutos := TfrmPesquisarProdutos.Create(Self);
  try
    //  Exibe o form
    frmPesquisarProdutos.ShowModal;
  finally
    //  Libera da memoria
    FreeAndNil(frmPesquisarProdutos);
  end;

end;
procedure TfrmCadastroVenda.CalculaTotalVenda;
var
  totalVenda: double;

begin

  totalVenda := StrToFloat(DBEditTotalVenda.Text);
  DBEditTotalVenda.Text := FloatToStr(totalVenda + StrToFloat(EditValorTotal.Text));

end;

procedure TfrmCadastroVenda.CalculaValorTotalItem;
begin

  if (EditQtd.Text <> '') and (EditValorUnit.Text <> '') then
  begin
    EditValorTotal.Text := FloatToStr(StrToFloat(EditValorUnit.Text) * StrToFloat(EditQtd.Text));
  end;

end;

procedure TfrmCadastroVenda.DBComboBoxOpVendaExit(Sender: TObject);
begin


  //  Libera a tela para adicionar itens
  PanelProdutos.Enabled := True;

end;

procedure TfrmCadastroVenda.DBEditCodCLienteExit(Sender: TObject);
begin

  BuscaNomeCliente;

end;

procedure TfrmCadastroVenda.DBGridItensVendaDblClick(Sender: TObject);
var
  totalVenda: Double;
begin

  DBGridItensVenda.DataSource.DataSet.Delete;

  totalVenda := StrToFloat(DBEditTotalVenda.Text);

  totalvenda := totalVenda - StrToFloat(DBGridItensVenda.Columns.Items[5].Field.Text);

  DBEditTotalVenda.Text := FloatToStr(totalVenda);

end;

procedure TfrmCadastroVenda.EditProdutoExit(Sender: TObject);
begin


  BuscaNomeProduto;

end;

procedure TfrmCadastroVenda.EditQtdExit(Sender: TObject);
begin


  CalculaValorTotalItem;

end;

procedure TfrmCadastroVenda.EditValorUnitExit(Sender: TObject);
begin


  CalculaValorTotalItem;

end;


procedure TfrmCadastroVenda.FormActivate(Sender: TObject);
begin

  LabelNomeCliente.Caption := '';
  LabelDescProd.Caption    := '';


end;
procedure TfrmCadastroVenda.GeraNumeroLcto;
var
  cod, result: integer;
begin
  cod := 0;

  FDQueryItemVenda.Open();

  cod :=  FDQueryItemVendaMAX.AsInteger + 1 ;

  //  Seta no edit o codigo gerado
  EditLcto.Text := IntToStr(cod);

  //  Posiciona o cursor
  EditProduto.SetFocus;

end;
procedure TfrmCadastroVenda.GeraNumeroVenda;
var
  cod: integer;
  FDQueryVendas: TFDQuery;
begin

  cod := 0;

  //  Cria query
  FDQueryVendas := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryVendas.Connection := dmDados.FDConnection;

    //  Ve o ultimo codigo usado
    FDQueryVendas.Close;
    FDQueryVendas.SQL.Clear;
    FDQueryVendas.SQL.Add(' select max(nrnota) as nrnota' );
    FDQueryVendas.SQL.Add(' from venda ');
    FDQueryVendas.Open;

    //  Ultimo codigo usado + 1
    cod := FDQueryVendas.FieldByName('nrnota').AsInteger + 1;

    //  Insere o registro no final da tabela
    FDQueryVendas.Append();

    //  Seta no edit o codigo gerado
    DBEditNrNota.Text := IntToStr(cod);

    //  Posiciona o cursor
    DBEditCodCLiente.SetFocus;

  finally

    //  Libera da memoria
    FDQueryVendas.free;

  end;

end;

procedure TfrmCadastroVenda.GravarItem;
var
  i: integer;
  totalVenda: Double;

begin

  FDQueryItemNota.Append;

  if EditProduto.Text <> '' then
  begin

    FDQueryItemNotaPRODUTO.AsInteger   := StrToInt(EditProduto.Text);
    FDQueryItemNotaQTDE.AsFloat        := StrToFloat(EditQtd.Text);
    FDQueryItemNotaVALOR_UNIT.AsFloat  := StrToFloat(EditValorUnit.Text);

  end
  else
  begin

    ShowMessage('Preencha o campo Cod Produto!');
    Abort;
    EditProduto.SetFocus;
  end;


  if EditLcto.Text <> '' then
  begin
    i:= StrToInt(EditLcto.Text) + 1;
    EditLcto.Text := IntToStr(i);
  end
  else
  begin
    GeraNumeroLcto;
  end;


  FDQueryItemNotaLCTO.AsInteger      := StrToInt(EditLcto.Text);
  FDQueryItemNotaNR_VENDA.AsInteger  := StrToInt(DBEditNrNota.Text);
  FDQueryItemNotaVALOR_TOTAL.AsFloat := StrToFloat(EditValorTotal.Text);

  CalculaTotalVenda;

end;
procedure TfrmCadastroVenda.LimpaCampos;
var
  i: integer;
begin


  //  Limpa os campos
  for i := 0 to frmCadastroVenda.ComponentCount -1 do
  begin
    if frmCadastroVenda.Components[i] is TDBEdit then
      TDBEdit(frmCadastroVenda.Components[i]).Clear

  end;



end;

procedure TfrmCadastroVenda.LimpaCamposItens;
begin

  EditProduto.Clear;
  EditQtd.Clear;
  EditValorUnit.Clear;
  EditValorTotal.Clear;

end;

end.
