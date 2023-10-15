unit SistemaFinanceiro.View.BxMultiplaCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.FaturaCartao, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Model.dmFaturaCartao, Data.DB, Vcl.Grids, Vcl.DBGrids, System.DateUtils;

type
  TfrmBxMultiplaCP = class(TForm)
    pnlFiltros: TPanel;
    pnlContas: TPanel;
    pnlBotoes: TPanel;
    dateInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dateFinal: TDateTimePicker;
    ImageList1: TImageList;
    btnVisualizar: TButton;
    edtFornecedor: TEdit;
    lblFornecedor: TLabel;
    btnPesquisaFornecedor: TButton;
    lblNomeFornecedor: TLabel;
    lblCodFatCartao: TLabel;
    edtCodFatCartao: TEdit;
    btnPesqFat: TButton;
    lblNomeFatCartao: TLabel;
    DataSourceBxMultiplaCP: TDataSource;
    btnConfirmar: TButton;
    btnSair: TButton;
    lblData: TLabel;
    cbData: TComboBox;
    pnlValorSelecionadas: TPanel;
    Edit1: TEdit;
    lblValorSelecionadas: TLabel;
    pnlQtdSelecionadas: TPanel;
    lblQtdSelecionada: TLabel;
    edtQtdSelecionada: TEdit;
    DBGrid1: TDBGrid;
    procedure btnPesquisaFornecedorClick(Sender: TObject);
    procedure btnPesqFatClick(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtCodFatCartaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtCodFatCartaoChange(Sender: TObject);
    procedure cbDataChange(Sender: TObject);
    procedure dateInicialChange(Sender: TObject);
    procedure dateFinalChange(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaNomeFornecedor;
    procedure BuscaNomeFatCartao;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure Pesquisar;

  public
    { Public declarations }
  end;

var
  frmBxMultiplaCP: TfrmBxMultiplaCP;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCPagar;

procedure TfrmBxMultiplaCP.btnPesqFatClick(Sender: TObject);
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtCodFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;
    edtCodFatCartao.SetFocus;

    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

end;

procedure TfrmBxMultiplaCP.btnPesquisaFornecedorClick(Sender: TObject);
begin

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtFornecedor.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  edtFornecedor.SetFocus;

end;

procedure TfrmBxMultiplaCP.btnVisualizarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.BuscaNomeFatCartao;
var
  NomeFatCartao : String;

begin

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    NomeFatCartao := dmFaturaCartao.GetNomeFatCartao(Trim(edtCodFatCartao.Text));

    if NomeFatCartao = '' then
    begin

      Application.MessageBox('Fatura de Cartão não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFatCartao.SetFocus;
      edtCodFatCartao.Clear;
      abort;

    end;

    lblNomeFatCartao.Caption := NomeFatCartao;
    lblNomeFatCartao.Visible := True;

  end;

end;

procedure TfrmBxMultiplaCP.BuscaNomeFornecedor;
var
  NomeFornecedor : String;

begin

  if Trim(edtFornecedor.Text) <> '' then
  begin

    NomeFornecedor := dmFornecedores.GetNomeFornecedor(Trim(edtFornecedor.Text));

    if NomeFornecedor = '' then
    begin

      Application.MessageBox('Fornecedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtFornecedor.SetFocus;
      edtFornecedor.Clear;

    end;

    lblNomeFornecedor.Visible := True;
    lblNomeFornecedor.Caption := NomeFornecedor;

  end;

end;

procedure TfrmBxMultiplaCP.cbDataChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.dateFinalChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.dateInicialChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CheckBoxState: Integer;
  R: TRect;

begin
//  if (Column.Field.FieldName = 'CheckboxField') and (DataSourceBxMultiplaCP.DataSet.RecordCount > 0) then
//  begin
//    DBGrid1.Canvas.FillRect(Rect);
//    R := Rect;
//    InflateRect(R, -2, -2);
//    CheckBoxState := 0;
//    if DataSourceBxMultiplaCP.DataSet.FieldByName('SELECIONADO').AsBoolean then
//      CheckBoxState := DFCS_CHECKED;
//    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or CheckBoxState);
//  end;

  //  Altera a cor das duplicatas vencidas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
      (DBGrid1.DataSource.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < Date)
      and (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'A')then
  begin
    DBGrid1.Canvas.Font.Color := clRed;  // Define a cor do texto da célula
  end;

  if not Odd(DBGrid1.DataSource.DataSet.RecNo) then
  begin

    if not(gdSelected in State) then
    begin

      TDBGrid(Sender).Canvas.Brush.Color := $00F6F5F5;
      TDBGrid(Sender).Canvas.FillRect(Rect);

    end;


  end;

  if (gdSelected in State) then
  begin
    DBGrid1.Canvas.Brush.Color := $00578B2E;  // Define a cor de fundo da célula selecionada
    DBGrid1.Canvas.Font.Color := clWhite;  // Define a cor do texto da célula selecionada
  end;

  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmBxMultiplaCP.EditKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada é o Enter
    //  Cancela o efeito do enter
    Key := #0;
    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmBxMultiplaCP.edtCodFatCartaoChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.edtCodFatCartaoExit(Sender: TObject);
begin

  BuscaNomeFatCartao;

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    if dmFaturaCartao.GetStatusFatCartao(Trim(edtCodFatCartao.Text)) = False then
    begin

      edtCodFatCartao.Clear;
      edtCodFatCartao.SetFocus;
      lblNomeFatCartao.Caption := '';
      Application.MessageBox('Fatura de Cartão não está Ativa, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;

  end;

end;

procedure TfrmBxMultiplaCP.edtFornecedorChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.edtFornecedorExit(Sender: TObject);
begin

  BuscaNomeFornecedor;

  if Trim(edtFornecedor.Text) <> '' then
  begin

    if dmFornecedores.GetStatus(Trim(edtFornecedor.Text)) = False then
    begin

      edtFornecedor.Clear;
      edtFornecedor.SetFocus;
      lblNomeFornecedor.Caption := '';
      Application.MessageBox('Fornecedor não está Ativo, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;


  end;

end;

procedure TfrmBxMultiplaCP.FormCreate(Sender: TObject);
var
  I : Integer;
  CheckBoxColumn: TColumn;
begin

  //  Percorre os componentes TEdit
  for I := 0 to ComponentCount - 1 do
  begin

    if (Components[I] is TEdit) or (Components[I] is TDateTimePicker) then
    begin
      //  Cria o evento OnKeyPress para cada Edit encontrado
      TEdit(Components[I]).OnKeyPress := EditKeyPress;
    end;

  end;

  //  Define as datas da consulta
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);
//
//  // Adicionando um novo campo ao DataSet
//  dmCPagar.FDQueryBxMultipla.Append;
//  dmCPagar.FDQueryBxMultipla.FieldDefs.Add('SELECIONADO', ftBoolean, 0, False);
//  dmCPagar.FDQueryBxMultipla.CreateDataSet;
//  dmCPagar.FDQueryBxMultipla.Open();
//
//  // Adicionando uma nova coluna ao DBGrid
//  CheckBoxColumn := DBGrid1.Columns.Add;
//  CheckBoxColumn.FieldName := 'SELECIONADO';
//  CheckBoxColumn.Title.Caption := 'Novo Checkbox';
//
//  // Personalizando o evento OnDrawColumnCell
//  DBGrid1.OnDrawColumnCell := DBGrid1DrawColumnCell;

end;

procedure TfrmBxMultiplaCP.Pesquisar;
var
  LFiltro    : String;
  LOrdem     : String;
  SQL        : String;

begin

  //  Validações
  if dateInicial.Date > dateFinal.Date then
  begin

    dateFinal.SetFocus;
    Application.MessageBox('Data Inicial não pode ser maior que a data Final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbData.ItemIndex < 0 then
   begin

    cbData.SetFocus;
    Application.MessageBox('Selecione um tipo de DATA!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if (Trim(edtFornecedor.Text) = '' ) and (Trim(edtCodFatCartao.Text) = '') then
  begin

    edtFornecedor.SetFocus;
    Application.MessageBox('Defina um Código de Fornecedor ou de Fatura de Cartão!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltro     := '';
  LOrdem      := '';

  //  Limpa os parametros do cds
  dmCPagar.FDQueryBxMultipla.Params.Clear;

  //  Pesquisa por data
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin

    case cbData.ItemIndex of

      0 : LFiltro := LFiltro + ' AND CP.DATA_COMPRA BETWEEN :DTINI AND :DTFIM ';
      1 : LFiltro := LFiltro + ' AND CP.DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';

    end;


//    //  Criando os parametros
//    dmCPagar.FDQueryBxMultipla.Params.CreateParam(ftDate, 'DTINI', ptInput);
//    dmCPagar.FDQueryBxMultipla.ParamByName('DTINI').AsDate := dateInicial.Date;
//    dmCPagar.FDQueryBxMultipla.Params.CreateParam(ftDate, 'DTFIM', ptInput);
//    dmCPagar.FDQueryBxMultipla.ParamByName('DTFIM').AsDate := dateFinal.Date;

  end;

  //  Pesquisa por FORNECEDORES
  if Trim(edtFornecedor.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FORNECEDOR = :ID ';

    //  Criando os parametros
//    dmCPagar.FDQueryBxMultipla.Params.CreateParam(TFieldType.ftString, 'ID', TParamType.ptInput);
//    dmCPagar.FDQueryBxMultipla.ParamByName('ID').AsString := Trim(edtFornecedor.Text);

  end;

  //  Pesquisa por Fatura de Cartao
  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FATURA = :ID_FT ';

    //  Criando os parametros
//    dmCPagar.FDQueryBxMultipla.Params.CreateParam(TFieldType.ftString, 'ID_FT', TParamType.ptInput);
//    dmCPagar.FDQueryBxMultipla.ParamByName('ID_FT').AsString := Trim(edtCodFatCartao.Text);

  end;

  //  Ordem de pesquisa
  lOrdem := ' ORDER BY CP.DATA_VENCIMENTO';


  SQL := 'SELECT CP.*, F.RAZAO_SOCIAL FROM CONTAS_PAGAR CP ' +
         'LEFT JOIN FORNECEDORES F ON CP.ID_FORNECEDOR = F.ID_FORNEC WHERE 1 = 1 ' +
         LFiltro + LOrdem ;

  dmCPagar.FDQueryBxMultipla.Close;
  dmCPagar.FDQueryBxMultipla.SQL.Clear;
  dmCPagar.FDQueryBxMultipla.SQL.Add(SQL);


  //  Criando os parametros
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin


    dmCPagar.FDQueryBxMultipla.ParamByName('DTINI').AsDate := dateInicial.Date;
    dmCPagar.FDQueryBxMultipla.ParamByName('DTFIM').AsDate := dateFinal.Date;

  end;

  if Trim(edtFornecedor.Text) <> '' then
  begin

    dmCPagar.FDQueryBxMultipla.ParamByName('ID').AsString := Trim(edtFornecedor.Text);

  end;

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    dmCPagar.FDQueryBxMultipla.ParamByName('ID_FT').AsString := Trim(edtCodFatCartao.Text);

  end;

  dmCPagar.FDQueryBxMultipla.Prepare;
  dmCPagar.FDQueryBxMultipla.Open;



end;

end.
