unit SistemaFinanceiro.View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.Imaging.pngimage, Vcl.Mask;

type
  TfrmCliente = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    LabelNome: TLabel;
    gbTipoCliente: TGroupBox;
    rbFisica: TRadioButton;
    lblCpf: TLabel;
    lblCnpj: TLabel;
    lblIe: TLabel;
    edtEndereco: TEdit;
    lblEnderco: TLabel;
    edtNumLog: TEdit;
    lblNumLog: TLabel;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtCep: TEdit;
    lblCep: TLabel;
    cbUf: TComboBox;
    lblUf: TLabel;
    edtComplemento: TEdit;
    lblComplemento: TLabel;
    edtCelular: TEdit;
    lblCelular: TLabel;
    edtTelefone: TEdit;
    lblTelefone: TLabel;
    edtEmail: TEdit;
    lblEmail: TLabel;
    DataSourceCliente: TDataSource;
    imgCliente: TImage;
    lblClientes: TLabel;
    edtBairro: TEdit;
    lblBairro: TLabel;
    rbJuridica: TRadioButton;
    cbTipo: TComboBox;
    lblTipo: TLabel;
    gbFiltros: TGroupBox;
    rbDataCad: TRadioButton;
    rbNome: TRadioButton;
    rbId: TRadioButton;
    edtCpf: TMaskEdit;
    edtIe: TEdit;
    edtCnpj: TMaskEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure rbFisicaClick(Sender: TObject);
    procedure rbJuridicaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoChange(Sender: TObject);
    procedure rbDataCadClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure rbIdClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
    procedure HabilitaBotoes;
    procedure EditarCliente;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmClientes,
  SistemaFinanceiro.Utilitarios, SistemaFinanceiro.View.Relatorios.Clientes;

procedure TfrmCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarCliente;

end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando a inclusão
  dmClientes.cdsClientes.Cancel;

end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try

    //  Excluindo registro
    dmClientes.cdsClientes.Delete;
    dmClientes.cdsClientes.ApplyUpdates(0);

  except on E : Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir Cliente', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmCliente.btnImprimirClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmRelClientes := TfrmRelClientes.Create(Self);

  try

    frmRelClientes.DataSourceClientes.DataSet := DataSourceCliente.DataSet;

    //  Mostra a pre vizualizacao
    frmRelClientes.RLReport.Preview;

  finally

    FreeAndNil(frmRelClientes);

  end;

end;

procedure TfrmCliente.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo um novo Cliente';

  if not (dmClientes.cdsClientes.State in [dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    dmClientes.cdsClientes.Insert;

  end;

  edtNome.SetFocus;

  //  Defindo tipo de cliente previamente como PF
  rbFisica.Checked;
  edtCpf.Enabled  := True;
  edtCnpj.Enabled := False;
  edtIe.Enabled   := False;

end;

procedure TfrmCliente.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
var
  TipoCli : String;
  Cpf : String;
  Cnpj : String;

begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Se for um novo cliente
  if (dmClientes.cdsClientes.State in [dsInsert]) then
  begin

    dmClientes.GeraCodigo;
    dmClientes.cdsClientesDATA_CADASTRO.AsDateTime := Now;

  end;

  //  Se for uma edição
  if (dmClientes.cdsClientes.State in [dsEdit]) then
  begin

    dmClientes.cdsClientesDATA_ALTERACAO.AsDateTime := Now;

  end;

  //  Ignora a mascara do cpf
  Cpf := StringReplace(edtCpf.Text, '.', '', [rfReplaceAll]);
  Cpf := StringReplace(Cpf, '-', '', [rfReplaceAll]);

  //  Ignora a mascara do cnpj
  Cnpj := StringReplace(edtCnpj.Text, '.', '', [rfReplaceAll]);
  Cnpj := StringReplace(Cnpj, '/', '', [rfReplaceAll]);
  Cnpj := StringReplace(Cnpj, '-', '', [rfReplaceAll]);


  //  Define o tipo de cliente
  if rbFisica.Checked then
  begin
    TipoCli := 'F';
  end
  else
  begin
    TipoCli := 'J';
  end;

  //  Passando os dados para o dataset
  dmClientes.cdsClientesNOME.AsString         := Trim(edtNome.Text);
  dmClientes.cdsClientesTIPO.AsString         := TipoCli;
  dmClientes.cdsClientesCPF.AsString          := Cpf;
  dmClientes.cdsClientesCNPJ.AsString         := Cnpj;
  dmClientes.cdsClientesIE.AsString           := Trim(edtIe.Text);
  dmClientes.cdsClientesENDERECO.AsString     := Trim(edtEndereco.Text);
  dmClientes.cdsClientesN_LOGRADOURO.AsString := Trim(edtNumLog.Text);
  dmClientes.cdsClientesBAIRRO.AsString       := Trim(edtBairro.Text);
  dmClientes.cdsClientesCIDADE.AsString       := Trim(edtCidade.Text);
  dmClientes.cdsClientesESTADO.AsString       := cbUf.Text;
  dmClientes.cdsClientesCEP.AsString          := Trim(edtCep.Text);
  dmClientes.cdsClientesCELULAR.AsString      := Trim(edtCelular.Text);
  dmClientes.cdsClientesTELEFONE.AsString     := Trim(edtTelefone.Text);
  dmClientes.cdsClientesCOMPLEMENTO.AsString  := Trim(edtComplemento.Text);
  dmClientes.cdsClientesEMAIL.AsString        := Trim(edtEmail.Text);

  //  Gravando no banco de dados
  dmClientes.cdsClientes.Post;
  dmClientes.cdsClientes.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista de pesquisa
  Pesquisar;

  inherited;

end;

procedure TfrmCliente.cbTipoChange(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarCliente;

end;

procedure TfrmCliente.EditarCliente;
begin

  //  Coloca o dataset em modo de edição
  dmClientes.cdsClientes.Edit;

  //  Coloca o nome do usuario no titulo
  lblTitulo.Caption := dmClientes.cdsClientesId.AsString + ' - ' + dmClientes.cdsClientesNOME.AsString;

  //  Carrega os dados
  edtNome.Text        := dmClientes.cdsClientesNOME.AsString;
  edtCpf.Text         := dmClientes.cdsClientesCPF.AsString;
  edtCnpj.Text        := dmClientes.cdsClientesCNPJ.AsString;
  edtIe.Text          := dmClientes.cdsClientesIE.AsString;
  edtEndereco.Text    := dmClientes.cdsClientesENDERECO.AsString;
  edtNumLog.Text      := dmClientes.cdsClientesN_LOGRADOURO.AsString;
  edtBairro.Text      := dmClientes.cdsClientesBAIRRO.AsString;
  edtCidade.Text      := dmClientes.cdsClientesCIDADE.AsString;
  cbUf.Text           := dmClientes.cdsClientesESTADO.AsString;
  edtCep.Text         := dmClientes.cdsClientesCEP.AsString;
  edtCelular.Text     := dmClientes.cdsClientesCELULAR.AsString;
  edtTelefone.Text    := dmClientes.cdsClientesTELEFONE.AsString;
  edtComplemento.Text := dmClientes.cdsClientesCOMPLEMENTO.AsString;
  edtEmail.Text       := dmClientes.cdsClientesEMAIL.AsString;

  if dmClientes.cdsClientesTIPO.AsString = 'F' then
  begin

    rbFisica.Checked;
    rbJuridica.Checked := False;

    edtCpf.Enabled  := True;
    edtCnpj.Enabled := False;
    edtIe.Enabled   := False;

  end
  else
  begin

    rbJuridica.Checked;
    rbFisica.Checked := False;

    edtCpf.Enabled  := False;
    edtCnpj.Enabled := True;
    edtIe.Enabled   := True;
  end;

end;

procedure TfrmCliente.edtPesquisarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.HabilitaBotoes;
begin

  btnAlterar.Enabled  := not DataSourceCliente.DataSet.IsEmpty;
  btnExcluir.Enabled  := not DataSourceCliente.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceCliente.DataSet.IsEmpty;

end;

procedure TfrmCliente.Pesquisar;
var
  LFiltroEdit: String;
  LFiltro : String;
  LOrdem : String;

begin


  if cbTipo.ItemIndex < 0 then
   begin

    cbTipo.SetFocus;
    Application.MessageBox('Selecione um tipo de CLIENTE!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro := '';
  LOrdem := '';

  dmClientes.cdsClientes.Params.Clear;

  //  Pesquisa por tipo
  case cbTipo.ItemIndex of

    1 : LFiltroEdit := LFiltro + ' AND TIPO = ''F'' ';
    2 : LFiltroEdit := LFiltro + ' AND TIPO = ''J'' ';

  end;

  // ordem de consulta
  if rbId.Checked then
  begin
    LOrdem := ' ORDER BY ID';
  end
  else if rbDataCad.Checked then
       begin
         LOrdem := 'ORDER BY DATA_CADASTRO';
       end
       else if rbNome.Checked then
            begin
              LOrdem := 'ORDER BY NOME';
            end
            else
            begin
              LOrdem := ' ORDER BY ID';
            end;


  dmClientes.cdsClientes.Close;
  dmClientes.cdsClientes.CommandText := 'SELECT * FROM CLIENTES WHERE 1 = 1 ' + LFiltroEdit +  lFiltro + LOrdem;
  dmClientes.cdsClientes.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmCliente.rbDataCadClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.rbFisicaClick(Sender: TObject);
begin
  inherited;

  edtCpf.Enabled  := True;
  edtCnpj.Enabled := False;
  edtIe.Enabled   := False;

  edtCnpj.Clear;
  edtIe.Clear;


end;

procedure TfrmCliente.rbIdClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.rbJuridicaClick(Sender: TObject);
begin
  inherited;

  edtCnpj.Enabled := True;
  edtIe.Enabled   := True;
  edtCpf.Enabled  := False;

  edtCpf.Clear;

end;

procedure TfrmCliente.rbNomeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;

  end;

end;

end.
