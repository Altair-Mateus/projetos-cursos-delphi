unit SistemaFinanceiro.View.FaturaCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.ComCtrls,
  SistemaFinanceiro.View.Relatorios.FaturaCartao;

type
  TfrmFaturaCartao = class(TfrmCadastroPadrao)
    DataSourceFaturaCartao: TDataSource;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    LabelNome: TLabel;
    edtNome: TEdit;
    LabelStatus: TLabel;
    ToggleStatus: TToggleSwitch;
    lblObs: TLabel;
    edtObs: TEdit;
    edtDiaVcto: TEdit;
    lblDiaVcto: TLabel;
    gbDadosCad: TGroupBox;
    lblDt: TLabel;
    edtDtAlt: TEdit;
    lblDtAlt: TLabel;
    edtDtCad: TEdit;
    procedure btnPesquisaeClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure cbStatusClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure ValidaCampos;
    procedure EditarFaturaCartao;


  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmFaturaCartao: TfrmFaturaCartao;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFaturaCartao, SistemaFinanceiro.Utilitarios;



{ TfrmFaturaCartao }

procedure TfrmFaturaCartao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  EditarFaturaCartao;
end;

procedure TfrmFaturaCartao.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando a incusão
  dmFaturaCartao.cdsFaturaCartao.Cancel;

end;

procedure TfrmFaturaCartao.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  if dmFaturaCartao.GetCpFat(DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsInteger) = True then
  begin

    Application.MessageBox('Não é possível excluir uma fatura de cartão com Conta a Pagar Cadastrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;


  try

    //  Excluindo o registro
    dmFaturaCartao.cdsFaturaCartao.Delete;
    dmFaturaCartao.cdsFaturaCartao.ApplyUpdates(0);

  except on E : Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir Fatura de Cartão', MB_OK + MB_ICONERROR);
  end;



end;

procedure TfrmFaturaCartao.btnImprimirClick(Sender: TObject);
begin
  inherited;

   //  Cria o form
  frmRelFatCartao := TfrmRelFatCartao.Create(Self);

  try

    frmRelFatCartao.DataSourceFatCartao.DataSet := DataSourceFaturaCartao.DataSet;

    //  Mostra a pre vizualizacao
    frmRelFatCartao.RLReport.Preview;

  finally

    FreeAndNil(frmRelFatCartao);

  end;

end;

procedure TfrmFaturaCartao.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo uma nova Fatura de Cartão';

  if not (dmFaturaCartao.cdsFaturaCartao.State in [dsInsert, dsEdit]) then
  begin

    //  Coloca o dataset em modo de inserção
    dmFaturaCartao.cdsFaturaCartao.Insert;

  end;

  edtNome.SetFocus;

  edtDtCad.Text := DateTimeToStr(Now);

end;

procedure TfrmFaturaCartao.btnPesquisaeClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFaturaCartao.btnSalvarClick(Sender: TObject);
var
  LStatus : String;

begin
  inherited;

  //  Valida os campos obrigatorios
  ValidaCampos;

  //  Se for um novo cad
  if dmFaturaCartao.cdsFaturaCartao.State in [dsInsert] then
  begin

    dmFaturaCartao.GeraCodigo;
    dmFaturaCartao.cdsFaturaCartaoDATA_CADASTRO.AsDateTime := StrToDateTime(edtDtCad.Text);
  end;

  //  Se for edição de um cad
  if dmFaturaCartao.cdsFaturaCartao.State in [dsEdit] then
  begin
    dmFaturaCartao.cdsFaturaCartaoDATA_ALTERACAO.AsDateTime := Now;
  end;

  //  Define o status da fatura
  if ToggleStatus.State = tssOn then
  begin
    LStatus := 'A';
  end
  else
  begin
    LStatus := 'I';
  end;

  //  Passando os dados para o dataset
  dmFaturaCartao.cdsFaturaCartaoNOME.AsString       := Trim(edtNome.Text);
  dmFaturaCartao.cdsFaturaCartaoOBSERVACAO.AsString := Trim(edtObs.Text);
  dmFaturaCartao.cdsFaturaCartaoDIA_VCTO.AsInteger  := StrToInt(edtDiaVcto.Text);
  dmFaturaCartao.cdsFaturaCartaoSTATUS_FT.AsString  := LStatus;

  //  Gravando no Banco
  dmFaturaCartao.cdsFaturaCartao.Post;
  dmFaturaCartao.cdsFaturaCartao.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista de pesquisa
  Pesquisar;


end;

procedure TfrmFaturaCartao.cbStatusClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFaturaCartao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  EditarFaturaCartao;
end;

procedure TfrmFaturaCartao.EditarFaturaCartao;
begin

  //  Coloca o data set em modo de edição
  dmFaturaCartao.cdsFaturaCartao.Edit;

  //  Coloca o nome da forma no titulo
  lblTitulo.Caption := dmFaturaCartao.cdsFaturaCartaoID_FT.AsString + ' - ' + dmFaturaCartao.cdsFaturaCartaoNOME.AsString;

  //  Carrega os dados
  edtNome.Text    := dmFaturaCartao.cdsFaturaCartaoNOME.AsString;
  edtObs.Text     := dmFaturaCartao.cdsFaturaCartaoOBSERVACAO.AsString;
  edtDtCad.Text   := dmFaturaCartao.cdsFaturaCartaoDATA_CADASTRO.AsString;
  edtDtAlt.Text   := dmFaturaCartao.cdsFaturaCartaoDATA_ALTERACAO.AsString;
  edtDiaVcto.Text := dmFaturaCartao.cdsFaturaCartaoDIA_VCTO.AsString;

  if dmFaturaCartao.cdsFaturaCartaoSTATUS_FT.AsString = 'A' then
  begin
    ToggleStatus.State := tssOn;
  end
    else
    begin
      ToggleStatus.State := tssOff;
    end;

end;

procedure TfrmFaturaCartao.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFaturaCartao.HabilitaBotoes;
begin

  btnAlterar.Enabled  := not DataSourceFaturaCartao.DataSet.IsEmpty;
  btnExcluir.Enabled  := not DataSourceFaturaCartao.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceFaturaCartao.DataSet.IsEmpty;

end;

procedure TfrmFaturaCartao.Pesquisar;
var
  LFiltroEdit : String;
  LFiltro : String;

begin

  //  Validações
  if cbStatus.ItemIndex < 0 then
  begin

    cbStatus.SetFocus;
    Application.MessageBox('Selecione um tipo de STATUS!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  dmFaturaCartao.cdsFaturaCartao.Params.Clear;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro     := '';

  case cbStatus.ItemIndex of

    1 : LFiltro := LFiltro + ' AND STATUS_FT = ''A'' ';
    2 : LFiltro := LFiltro + ' AND STATUS_FT = ''I'' ';

  end;

  dmFaturaCartao.cdsFaturaCartao.Close;
  dmFaturaCartao.cdsFaturaCartao.CommandText := 'SELECT * FROM FATURA_CARTAO WHERE 1 = 1 ' + LFiltroEdit + LFiltro + 'ORDER BY 1 ';
  dmFaturaCartao.cdsFaturaCartao.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmFaturaCartao.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo Nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;

  end;

  if Trim(edtDiaVcto.Text) = '' then
  begin

    Application.MessageBox('Campo Dia de Vencimento não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtDiaVcto.SetFocus;
    abort;

  end;

  if (StrToInt(Trim(edtDiaVcto.Text)) > 28) or (StrToInt(Trim(edtDiaVcto.Text)) < 1) then
  begin

    Application.MessageBox('Dia de vencimento Inválido!!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtDiaVcto.SetFocus;
    abort;

  end;


end;

end.
