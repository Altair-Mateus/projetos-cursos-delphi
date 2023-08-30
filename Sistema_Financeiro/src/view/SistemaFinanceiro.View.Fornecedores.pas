unit SistemaFinanceiro.View.Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.WinXCtrls;

type
  TfrmFornecedores = class(TfrmCadastroPadrao)
    imgFornecedor: TImage;
    lblFornecedores: TLabel;
    lblTipo: TLabel;
    cbTipo: TComboBox;
    gbFiltros: TGroupBox;
    rbDataCad: TRadioButton;
    rbNome: TRadioButton;
    rbId: TRadioButton;
    DataSourceFornecedor: TDataSource;
    LabelNome: TLabel;
    edtNome: TEdit;
    gbTipoFornecedor: TGroupBox;
    rbFisica: TRadioButton;
    rbJuridica: TRadioButton;
    edtCpf: TMaskEdit;
    lblCpf: TLabel;
    lblCnpj: TLabel;
    edtCnpj: TMaskEdit;
    lblIe: TLabel;
    edtIe: TEdit;
    lblEnderco: TLabel;
    edtEndereco: TEdit;
    lblNumLog: TLabel;
    edtNumLog: TEdit;
    lblBairro: TLabel;
    edtBairro: TEdit;
    lblUf: TLabel;
    cbUf: TComboBox;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblCep: TLabel;
    edtCep: TEdit;
    edtCidade: TEdit;
    lblCidade: TLabel;
    lblCelular: TLabel;
    edtCelular: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TEdit;
    LabelStatus: TLabel;
    ToggleStatus: TToggleSwitch;
    lblStatus: TLabel;
    cbStatus: TComboBox;
    procedure btnPesquisaeClick(Sender: TObject);
    procedure rbFisicaClick(Sender: TObject);
    procedure rbJuridicaClick(Sender: TObject);
    procedure rbDataCadClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure rbIdClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure cbTipoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbStatusClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
    procedure HabilitaBotoes;
    procedure EditarFornecedor;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFornecedores, SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.View.Relatorios.Fornecedores;

procedure TfrmFornecedores.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarFornecedor;

end;

procedure TfrmFornecedores.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  if dmFornecedores.GetCpFornec(DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsInteger) = True then
  begin

    Application.MessageBox('Não é possível excluir um fornecedor com Conta a Pagar Cadastrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;


  try

    //  Excluindo registro
    dmFornecedores.cdsFornecedores.Delete;
    dmFornecedores.cdsFornecedores.ApplyUpdates(0);

  except on E : Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir Fornecedor', MB_OK + MB_ICONERROR);
  end;



end;

procedure TfrmFornecedores.btnImprimirClick(Sender: TObject);
begin
  inherited;

   //  Cria o form
  frmRelFornecedores := TfrmRelFornecedores.Create(Self);

  try

    frmRelFornecedores.DataSourceFornecedores.DataSet := DataSourceFornecedor.DataSet;

    //  Mostra a pre vizualizacao
    frmRelFornecedores.RLReport.Preview;

  finally

    FreeAndNil(frmRelFornecedores);

  end;

end;

procedure TfrmFornecedores.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo um novo Fornecedor';

  if not (dmFornecedores.cdsFornecedores.State in [dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    dmFornecedores.cdsFornecedores.Insert;

  end;

  edtNome.SetFocus;

  //  Defindo tipo de fornecedor previamente como PJ
  rbJuridica.Checked;
  edtCpf.Enabled  := False;
  edtCnpj.Enabled := True;
  edtIe.Enabled   := True;

  cbUf.ItemIndex := -1;


end;

procedure TfrmFornecedores.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.btnSalvarClick(Sender: TObject);
var
  TipoFornecedor : String;
  Cpf : String;
  Cnpj : String;
  Status : String;

begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Se for um novo fornecedor
  if (dmFornecedores.cdsFornecedores.State in [dsInsert]) then
  begin

    dmFornecedores.GeraCodigo;
    dmFornecedores.cdsFornecedoresDATA_CADASTRO.AsDateTime := Now;

  end;

  //  Se for uma edição
  if (dmFornecedores.cdsFornecedores.State in [dsEdit]) then
  begin

    dmFornecedores.cdsFornecedoresDATA_ALTERACAO.AsDateTime := Now;

  end;

  //  Ignora a mascara do cpf
  Cpf := StringReplace(edtCpf.Text, '.', '', [rfReplaceAll]);
  Cpf := StringReplace(Cpf, '-', '', [rfReplaceAll]);

  //  Ignora a mascara do cnpj
  Cnpj := StringReplace(edtCnpj.Text, '.', '', [rfReplaceAll]);
  Cnpj := StringReplace(Cnpj, '/', '', [rfReplaceAll]);
  Cnpj := StringReplace(Cnpj, '-', '', [rfReplaceAll]);

  //  Define o status do fornecedor
  if ToggleStatus.State = tssOn then
  begin
    Status := 'A';
  end
  else
  begin
    Status := 'I';
  end;

  //  Define o tipo de fornecedor
  if rbFisica.Checked then
  begin
    TipoFornecedor := 'F';
  end
  else
  begin
    TipoFornecedor := 'J';
  end;

  //  Passando os dados para o dataset
  dmFornecedores.cdsFornecedoresRAZAO_SOCIAL.AsString  := Trim(edtNome.Text);
  dmFornecedores.cdsFornecedoresNOME_FANTASIA.AsString := Trim(edtNomeFantasia.Text);
  dmFornecedores.cdsFornecedoresTIPO.AsString          := TipoFornecedor;
  dmFornecedores.cdsFornecedoresCPF.AsString           := Cpf;
  dmFornecedores.cdsFornecedoresCNPJ.AsString          := Cnpj;
  dmFornecedores.cdsFornecedoresIE.AsString            := Trim(edtIe.Text);
  dmFornecedores.cdsFornecedoresENDERECO.AsString      := Trim(edtEndereco.Text);
  dmFornecedores.cdsFornecedoresN_LOGRADOURO.AsString  := Trim(edtNumLog.Text);
  dmFornecedores.cdsFornecedoresBAIRRO.AsString        := Trim(edtBairro.Text);
  dmFornecedores.cdsFornecedoresCIDADE.AsString        := Trim(edtCidade.Text);
  dmFornecedores.cdsFornecedoresESTADO.AsString        := cbUf.Text;
  dmFornecedores.cdsFornecedoresCEP.AsString           := Trim(edtCep.Text);
  dmFornecedores.cdsFornecedoresCELULAR.AsString       := Trim(edtCelular.Text);
  dmFornecedores.cdsFornecedoresTELEFONE.AsString      := Trim(edtTelefone.Text);
  dmFornecedores.cdsFornecedoresCOMPLEMENTO.AsString   := Trim(edtComplemento.Text);
  dmFornecedores.cdsFornecedoresEMAIL.AsString         := Trim(edtEmail.Text);
  dmFornecedores.cdsFornecedoresSTATUS.AsString        := Status;

  //  Gravando no banco de dados
  dmFornecedores.cdsFornecedores.Post;
  dmFornecedores.cdsFornecedores.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista de pesquisa
  Pesquisar;

end;

procedure TfrmFornecedores.cbStatusClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFornecedores.cbTipoClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarFornecedor;

end;

procedure TfrmFornecedores.EditarFornecedor;
var
  IndexCb : Integer;

begin

  //  Coloca o dataset em modo de edição
  dmFornecedores.cdsFornecedores.Edit;

  //  Coloca o nome do fornecedor no titulo
  lblTitulo.Caption := dmFornecedores.cdsFornecedoresId.AsString + ' - ' + dmFornecedores.cdsFornecedoresRAZAO_SOCIAL.AsString;

  if dmFornecedores.cdsFornecedoresSTATUS.AsString = 'A' then
  begin
    ToggleStatus.State := tssOn;
  end
    else
    begin
      ToggleStatus.State := tssOff;
    end;

  //  Carrega os dados
  edtNome.Text         := dmFornecedores.cdsFornecedoresRAZAO_SOCIAL.AsString;
  edtNomeFantasia.Text := dmFornecedores.cdsFornecedoresNOME_FANTASIA.AsString;
  edtCpf.Text          := dmFornecedores.cdsFornecedoresCPF.AsString;
  edtCnpj.Text         := dmFornecedores.cdsFornecedoresCNPJ.AsString;
  edtIe.Text           := dmFornecedores.cdsFornecedoresIE.AsString;
  edtEndereco.Text     := dmFornecedores.cdsFornecedoresENDERECO.AsString;
  edtNumLog.Text       := dmFornecedores.cdsFornecedoresN_LOGRADOURO.AsString;
  edtBairro.Text       := dmFornecedores.cdsFornecedoresBAIRRO.AsString;
  edtCidade.Text       := dmFornecedores.cdsFornecedoresCIDADE.AsString;
  edtCep.Text          := dmFornecedores.cdsFornecedoresCEP.AsString;
  edtCelular.Text      := dmFornecedores.cdsFornecedoresCELULAR.AsString;
  edtTelefone.Text     := dmFornecedores.cdsFornecedoresTELEFONE.AsString;
  edtComplemento.Text  := dmFornecedores.cdsFornecedoresCOMPLEMENTO.AsString;
  edtEmail.Text        := dmFornecedores.cdsFornecedoresEMAIL.AsString;

  // Procura a sigla do estado no cb
  IndexCb := cbUf.Items.IndexOf(dmFornecedores.cdsFornecedoresESTADO.AsString);

  //  Ao localizar define a mesma no cb
  if IndexCb >= 0 then
  begin
    cbUf.ItemIndex := IndexCb;
  end
  else
  begin
    cbUf.ItemIndex := -1;
  end;


  if dmFornecedores.cdsFornecedoresTIPO.AsString = 'F' then
  begin

    rbFisica.Checked := True;
    rbJuridica.Checked := False;

    edtCpf.Enabled  := True;
    edtCnpj.Enabled := False;
    edtIe.Enabled   := False;

  end
  else
  begin

    rbJuridica.Checked := True;
    rbFisica.Checked := False;

    edtCpf.Enabled  := False;
    edtCnpj.Enabled := True;
    edtIe.Enabled   := True;
  end;


end;

procedure TfrmFornecedores.edtPesquisarChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.HabilitaBotoes;
begin

  btnAlterar.Enabled  := not DataSourceFornecedor.DataSet.IsEmpty;
  btnExcluir.Enabled  := not DataSourceFornecedor.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceFornecedor.DataSet.IsEmpty;

end;

procedure TfrmFornecedores.Pesquisar;
var
  LFiltroEdit: String;
  LFiltro : String;
  LOrdem : String;

begin


  if cbTipo.ItemIndex < 0 then
   begin

    cbTipo.SetFocus;
    Application.MessageBox('Selecione um tipo de FORNECEDOR!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro := '';
  LOrdem := '';

  dmFornecedores.cdsFornecedores.Params.Clear;

  //  Pesquisa por tipo
  case cbTipo.ItemIndex of

    1 : LFiltroEdit := LFiltro + ' AND TIPO = ''F'' ';
    2 : LFiltroEdit := LFiltro + ' AND TIPO = ''J'' ';

  end;

  //  Pesquisa por status
  case cbStatus.ItemIndex of

    1 : LFiltroEdit := LFiltro + ' AND STATUS = ''A'' ';
    2 : LFiltroEdit := LFiltro + ' AND STATUS = ''I'' ';

  end;

  // ordem de consulta
  if rbId.Checked then
  begin
    LOrdem := ' ORDER BY ID_FORNEC';
  end
  else if rbDataCad.Checked then
       begin
         LOrdem := 'ORDER BY DATA_CADASTRO';
       end
       else if rbNome.Checked then
            begin
              LOrdem := 'ORDER BY RAZAO_SOCIAL';
            end
            else
            begin
              LOrdem := ' ORDER BY ID_FORNEC';
            end;


  dmFornecedores.cdsFornecedores.Close;
  dmFornecedores.cdsFornecedores.CommandText := 'SELECT * FROM FORNECEDORES WHERE 1 = 1 ' + LFiltroEdit +  lFiltro + LOrdem;
  dmFornecedores.cdsFornecedores.Open;

  HabilitaBotoes;


  inherited;

end;

procedure TfrmFornecedores.rbDataCadClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.rbFisicaClick(Sender: TObject);
begin
  inherited;

  edtCpf.Enabled  := True;
  edtCnpj.Enabled := False;
  edtIe.Enabled   := False;

  edtCnpj.Clear;
  edtIe.Clear;

end;

procedure TfrmFornecedores.rbIdClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.rbJuridicaClick(Sender: TObject);
begin
  inherited;

  edtCnpj.Enabled := True;
  edtIe.Enabled   := True;
  edtCpf.Enabled  := False;

  edtCpf.Clear;

end;

procedure TfrmFornecedores.rbNomeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFornecedores.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;

  end;

end;

end.
