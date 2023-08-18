unit SistemaFinanceiro.View.Caixa;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.Mask, Vcl.Imaging.pngimage;
type
  TfrmCaixa = class(TfrmCadastroPadrao)
    DataSourceCaixa: TDataSource;
    lblNDoc: TLabel;
    edtNDoc: TEdit;
    lblDesc: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    RadioGroup: TRadioGroup;
    DateTimePicker: TDateTimePicker;
    lblData: TLabel;
    lblReceita: TLabel;
    lblDespesa: TLabel;
    memDesc: TMemo;
    cbTipoLcto: TComboBox;
    lblTipo: TLabel;
    gbLegenda: TGroupBox;
    lblCorReceita: TLabel;
    lblCorDespesa: TLabel;
    pnlReceita: TPanel;
    pnlVencida: TPanel;
    lblDataFinal: TLabel;
    dateFinal: TDateTimePicker;
    dateInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    gbFiltros: TGroupBox;
    rbData: TRadioButton;
    rbValor: TRadioButton;
    rbId: TRadioButton;
    imgCaixa: TImage;
    lblCaixa: TLabel;
    cbOrigem: TComboBox;
    lblOrigem: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoLctoClick(Sender: TObject);
    procedure rbDataClick(Sender: TObject);
    procedure rbValorClick(Sender: TObject);
    procedure rbIdClick(Sender: TObject);
    procedure dateInicialExit(Sender: TObject);
    procedure dateFinalExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbOrigemClick(Sender: TObject);

  private
    { Private declarations }
    procedure ValidaCampos;
    procedure HabilitaBotoes;
    procedure EditarRegCaixa;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;
var
  frmCaixa: TfrmCaixa;

implementation
{$R *.dfm}
uses
  SistemaFinanceiro.Model.dmCaixa,
  SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.View.Principal,
  System.DateUtils, SistemaFinanceiro.View.Relatorios.Caixa;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin

  inherited;
  EditarRegCaixa;

end;

procedure TfrmCaixa.btnCancelarClick(Sender: TObject);
begin

  inherited;
  //  Cancelando inclusão
  dmCaixa.cdsCaixa.Cancel;

end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin

  inherited;

  option := Application.MessageBox('Deseja excluir o lançamento?', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try
    //  Excluindo registro
    dmCaixa.cdsCaixa.Delete;
    dmCaixa.cdsCaixa.ApplyUpdates(0);

    //  Atualiza relatorio tela principal
    frmPrincipal.ResumoMensalCaixa;

  except on E : Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir lançamento do caixa', MB_OK + MB_ICONERROR);

  end;

end;

procedure TfrmCaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmRelCaixa := TfrmRelCaixa.Create(Self);

  try

    frmRelCaixa.DataSourceCaixa.DataSet := DataSourceCaixa.DataSet;

    //  Exibe a pre visualizacao
    frmRelCaixa.RLReport.Preview();

  finally

    FreeAndNil(frmRelCaixa);

  end;

end;

procedure TfrmCaixa.btnIncluirClick(Sender: TObject);
begin

  inherited;
  lblTitulo.Caption := 'Inserindo um novo Lançamento no Caixa';

  if not (dmCaixa.cdsCaixa.State in [dsInsert, dsEdit]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    dmCaixa.cdsCaixa.Insert;

  end;

  //  Coloca a data atual no datetimepicker
  DateTimePicker.Date := now;

  edtNDoc.SetFocus;

end;

procedure TfrmCaixa.btnPesquisaeClick(Sender: TObject);
begin

  Pesquisar;
  inherited;

end;

procedure TfrmCaixa.btnSalvarClick(Sender: TObject);
begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Passando os dados para o dataset
  dmCaixa.cdsCaixadata_cadastro.AsDateTime := DateTimePicker.Date;
  dmCaixa.cdsCaixavalor.AsFloat            := StrToFloat(Trim(edtValor.text));
  dmCaixa.cdsCaixanumero_doc.AsString      := Trim(edtNDoc.text);
  dmCaixa.cdsCaixadescricao.AsString       := Trim(memDesc.text);
  dmCaixa.cdsCaixaORIGEM.AsString          := 'CX';

  if RadioGroup.ItemIndex = 0 then
  begin
    dmCaixa.cdsCaixatipo.AsString := 'R';
  end
    else if RadioGroup.ItemIndex = 1 then
    begin
      dmCaixa.cdsCaixatipo.AsString := 'D';
    end;
  if dmCaixa.cdsCaixa.State in [dsInsert] then
  begin
    dmCaixa.GeraCodigo;
  end;

  //  Gravando no banco de dados
  dmCaixa.cdsCaixa.Post;
  dmCaixa.cdsCaixa.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista
  Pesquisar;

  //  Atualiza relatorio tela principal
  frmPrincipal.ResumoMensalCaixa;
  inherited;
end;

procedure TfrmCaixa.cbOrigemClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.cbTipoLctoClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.dateFinalExit(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.dateInicialExit(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.DBGrid1DblClick(Sender: TObject);
begin

  inherited;
  EditarRegCaixa;

end;

procedure TfrmCaixa.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  //  Altera a cor das receitas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('TIPO').AsString = 'R')then
  begin
    DBGrid1.Canvas.Font.Color := clHotLight;  // Define a cor do texto da célula
  end;

  //  Altera a cor das receitas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
     (DBGrid1.DataSource.DataSet.FieldByName('TIPO').AsString = 'D')then
  begin
    DBGrid1.Canvas.Font.Color := $004F50FF;  // Define a cor do texto da célula
  end;

  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  inherited;

end;

procedure TfrmCaixa.EditarRegCaixa;
begin

  //  Coloca o dataset em modo de edição
  dmCaixa.cdsCaixa.Edit;

  //  Coloca o numero do registro no titulo
  lblTitulo.Caption := 'Alterando lançamento Nº '+ dmCaixa.cdsCaixaid.AsString;

  //  Carrega os dados
  edtNDoc.Text        := dmCaixa.cdsCaixanumero_doc.AsString;
  memDesc.Text        := dmCaixa.cdsCaixadescricao.AsString;
  edtValor.Text       := TUtilitario.FormatarValor(dmCaixa.cdsCaixavalor.AsCurrency);
  DateTimePicker.Date := dmCaixa.cdsCaixadata_cadastro.AsDateTime;

  if dmCaixa.cdsCaixatipo.AsString = 'R' then
  begin
    RadioGroup.ItemIndex := 0;
  end
    else if dmCaixa.cdsCaixatipo.AsString = 'D' then
    begin
      RadioGroup.ItemIndex := 1;
    end;

end;

procedure TfrmCaixa.edtPesquisarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.edtValorExit(Sender: TObject);
begin

  inherited;
  edtValor.Text := TUtilitario.FormatarValor(edtValor.Text);

end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin

  inherited;
  edtValor.OnKeyPress := TUtilitario.KeyPressValor;

  //  Define as datas
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);

end;

procedure TfrmCaixa.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCaixa.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCaixa.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceCaixa.DataSet.IsEmpty;

end;

procedure TfrmCaixa.Pesquisar;
var
  LFiltroEdit : String;
  LFiltro     : String;
  LOrdem      : String;

begin

  //  Validações
  if dateInicial.Date > dateFinal.Date then
  begin

    dateFinal.SetFocus;
    Application.MessageBox('Data Inicial não pode ser maior que a data Final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbTipoLcto.ItemIndex < 0 then
  begin

    cbTipoLcto.SetFocus;
    Application.MessageBox('Selecione um tipo de Lançamento!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro := '';
  LOrdem := '';

  dmCaixa.cdsCaixa.Params.Clear;

  //  Pesquisa por tipo de lcto
  case cbTipoLcto.ItemIndex of
    1 : LFiltro := LFiltro + ' AND TIPO = ''R'' ';
    2 : LFiltro := LFiltro + ' AND TIPO = ''D'' ';
  end;

  //  Pesquisa por origem
  case cbOrigem.ItemIndex of

    1 : LFiltro := LFiltro + ' AND ORIGEM = ''CR'' ';
    2 : LFiltro := LFiltro + 'AND ORIGEM = ''CP'' ';
    3 : LFiltro := LFiltro + 'AND ORIGEM = ''CX'' ';

  end;

  //  Pesquisa por data
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin

    LFiltro := LFiltro + ' AND DATA_CADASTRO BETWEEN :DTINI AND :DTFIM ';

    //  Criando os parametros
    dmCaixa.cdsCaixa.Params.CreateParam(TFieldType.ftDate, 'DTINI', TParamType.ptInput);
    dmCaixa.cdsCaixa.ParamByName('DTINI').AsDate := dateInicial.Date;

    dmCaixa.cdsCaixa.Params.CreateParam(TFieldType.ftDate, 'DTFIM', TParamType.ptInput);
    dmCaixa.cdsCaixa.ParamByName('DTFIM').AsDate := dateFinal.Date;

  end;

  //  Ordem de pesquisa
  if rbId.Checked then
  begin
    LOrdem := ' ORDER BY ID DESC';
  end
    else if rbData.Checked then
    begin
      LOrdem := ' ORDER BY DATA_CADASTRO DESC';
    end
      else if rbValor.Checked then
      begin
        LOrdem := ' ORDER BY VALOR DESC';
      end
        else
        begin
          LOrdem := ' ORDER BY ID DESC';
        end;


  dmCaixa.cdsCaixa.Close;
  dmCaixa.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE 1 = 1' + LFiltroEdit + LFiltro + LOrdem;
  dmCaixa.cdsCaixa.Open;

  HabilitaBotoes;
  inherited;


end;
procedure TfrmCaixa.rbDataClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.rbIdClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.rbValorClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCaixa.ValidaCampos;
begin
  if Trim(memDesc.Text) = '' then
  begin
    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    memDesc.SetFocus;
    abort;
  end;

  if Trim(edtValor.Text) = '' then
  begin
    Application.MessageBox('Campo Valor não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    abort;
  end;
  if RadioGroup.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo do lançamento!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;
end;
end.
