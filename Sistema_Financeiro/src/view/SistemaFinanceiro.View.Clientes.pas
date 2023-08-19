unit SistemaFinanceiro.View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.Imaging.pngimage;

type
  TfrmCliente = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    LabelNome: TLabel;
    gbTipoCliente: TGroupBox;
    rbFisica: TRadioButton;
    edtCpf: TEdit;
    lblCpf: TLabel;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    lblIe: TLabel;
    edtIe: TEdit;
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
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure rbFisicaClick(Sender: TObject);
    procedure rbJuridicaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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
  SistemaFinanceiro.Utilitarios;

procedure TfrmCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarCliente;

end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando a inclus�o
  dmClientes.cdsClientes.Cancel;

end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirma��o', MB_YESNO + MB_ICONQUESTION);

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

procedure TfrmCliente.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo um novo Cliente';

  if not (dmClientes.cdsClientes.State in [dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inser��o de dados
    dmClientes.cdsClientes.Insert;

  end;

  edtNome.SetFocus;

  //  Defindo tipo de cliente previamente como PF
  rbFisica.Checked;
  edtCpf.Enabled  := True;

end;

procedure TfrmCliente.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
var
  TipoCli : String;

begin

  //  Valida os campos obrigat�rios
  ValidaCampos;

  //  Se for um novo cliente
  if (dmClientes.cdsClientes.State in [dsInsert]) then
  begin

    dmClientes.GeraCodigo;
    dmClientes.cdsClientesDATA_CADASTRO.AsDateTime := Now;

  end;

  //  Se for uma edi��o
  if (dmClientes.cdsClientes.State in [dsEdit]) then
  begin

    dmClientes.cdsClientesDATA_ALTERACAO.AsDateTime := Now;

  end;


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
  dmClientes.cdsClientesCPF.AsString          := Trim(edtCpf.Text);
  dmClientes.cdsClientesCNPJ.AsString         := Trim(edtCnpj.Text);
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

procedure TfrmCliente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarCliente;

end;

procedure TfrmCliente.EditarCliente;
begin

  //  Coloca o dataset em modo de edi��o
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
  end
  else
  begin
    rbJuridica.Checked;
  end;

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

  dmClientes.cdsClientes.Params.Clear;

  //  Pesquisa por tipo
//  case cbTipo of
//
////    1 : LFiltroEdit := LFiltro + ' AND TIPO = '''' ';
//
//  end;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro := '';
  LOrdem := '';

  dmClientes.cdsClientes.Close;
  dmClientes.cdsClientes.CommandText := 'SELECT * FROM CLIENTES WHERE 1 = 1 ' + LFiltroEdit +  lFiltro + LOrdem;
  dmClientes.cdsClientes.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmCliente.rbFisicaClick(Sender: TObject);
begin
  inherited;

  edtCpf.Enabled  := True;
  edtCnpj.Enabled := False;
  edtIe.Enabled   := False;

end;

procedure TfrmCliente.rbJuridicaClick(Sender: TObject);
begin
  inherited;

  edtCnpj.Enabled := True;
  edtIe.Enabled   := True;
  edtCpf.Enabled  := False;

end;

procedure TfrmCliente.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;

  end;

end;

end.
