unit SistemaFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.Mask;

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
  SistemaFinanceiro.Utilitarios, SistemaFinanceiro.View.Principal;

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

procedure TfrmCaixa.edtValorExit(Sender: TObject);
begin
  inherited;

   edtValor.Text := TUtilitario.FormatarValor(edtValor.Text);

end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  edtValor.OnKeyPress := TUtilitario.KeyPressValor;

end;

procedure TfrmCaixa.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCaixa.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCaixa.DataSet.IsEmpty;

end;

procedure TfrmCaixa.Pesquisar;
var
  LFiltroPesquisa : String;
  LFiltroTipo     : String;

begin

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  case cbTipoLcto.ItemIndex of

    1 : LFiltroTipo := ' AND TIPO = ''R'' ';
    2 : LFiltroTipo := ' AND TIPO = ''D'' ';

  end;

  dmCaixa.cdsCaixa.Close;
  dmCaixa.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE 1 = 1' + LFiltroPesquisa + LFiltroTipo + 'ORDER BY 1 DESC';
  dmCaixa.cdsCaixa.Open;

  HabilitaBotoes;

  inherited;

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
