unit SistemaFinanceiro.View.Usuarios;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.WinXCtrls, Vcl.Menus;
type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSourceUsuarios: TDataSource;
    LabelNome: TLabel;
    edtNome: TEdit;
    LabelLogin: TLabel;
    edtLogin: TEdit;
    ToggleStatus: TToggleSwitch;
    LabelStatus: TLabel;
    PopupMenu: TPopupMenu;
    mnuLimpaSenha: TMenuItem;
    lblAvisoSenha: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure mnuLimpaSenhaClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);

  private
    { Private declarations }
    procedure ValidaCampos;
    procedure HabilitaBotoes;
    procedure EditarUsuario;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmUsuarios: TfrmUsuarios;

  implementation
{$R *.dfm}
uses
  SistemaFinanceiro.Model.dmUsuarios,
  BCrypt, SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.View.Relatorios.Usuarios;

  procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  EditarUsuario;

end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin

  inherited;

  //  Cancelando inclusão
  dmUsuarios.cdsUsuarios.Cancel;

end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
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
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);

  except on E : Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir usuário', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmUsuarios.btnImprimirClick(Sender: TObject);
begin

  //  Cria o form
  frmRelUsuarios := TfrmRelUsuarios.Create(Self);

  try

    frmRelUsuarios.DataSourceUsuarios.DataSet := DataSourceUsuarios.DataSet;

    //  Mostra a pre visualização
    frmRelUsuarios.RLReport.Preview;

  finally

    FreeAndNil(frmRelUsuarios);

  end;



end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblAvisoSenha.Visible := True;
  lblTitulo.Caption := 'Inserindo um novo usuário';

  if not (dmUsuarios.cdsUsuarios.State in [ dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    dmUsuarios.cdsUsuarios.Insert;

  end;

  edtNome.SetFocus;

end;

procedure TfrmUsuarios.btnPesquisaeClick(Sender: TObject);
begin
  inherited;
  Pesquisar;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus : String;

begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Se for um novo usuário será colocado a senha temporária
  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariossenha.AsString := TBCrypt.GenerateHash(dmUsuarios.TEMP_PASSWORD);
    dmUsuarios.cdsUsuariossenha_temp.AsString := 'S';
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;
    dmUsuarios.GeraCodigo;
  end;

  //  Define o status do usuario
  if ToggleStatus.State = tssOn then
  begin
    LStatus := 'A';
  end
    else
    begin
      LStatus := 'I';
    end;

  //  Passando os dados para o dataset
  dmUsuarios.cdsUsuariosnome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuarioslogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosstatus.AsString := LStatus;

  //  Gravando no banco de dados
  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista por ordem de usuario
  Pesquisar;

  inherited;

end;

procedure TfrmUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  EditarUsuario;

end;

procedure TfrmUsuarios.EditarUsuario;
begin

  //  Coloca o dataset em modo de edição
  dmUsuarios.cdsUsuarios.Edit;

  //  Coloca o nome do usuario no titulo
  lblTitulo.Caption := dmUsuarios.cdsUsuariosid.AsString + ' - ' + dmUsuarios.cdsUsuariosnome.AsString;

  //  Carrega os dados
  edtNome.Text  := dmUsuarios.cdsUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuarioslogin.AsString;

  if dmUsuarios.cdsUsuariosstatus.AsString = 'A' then
  begin
    ToggleStatus.State := tssOn;
  end
    else
    begin
      ToggleStatus.State := tssOff;
    end;

end;

procedure TfrmUsuarios.edtPesquisarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmUsuarios.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceUsuarios.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceUsuarios.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceUsuarios.DataSet.IsEmpty;

end;

procedure TfrmUsuarios.mnuLimpaSenhaClick(Sender: TObject);
begin
  inherited;

  if not DataSourceUsuarios.DataSet.IsEmpty then
  begin

    dmUsuarios.LimparSenhaTemp(DataSourceUsuarios.DataSet.FieldByName('ID').AsString);

    Application.MessageBox
    (
      PWideChar(format('Foi definida a senha padrão para o usuário "%s"',
        [DataSourceUsuarios.DataSet.FieldByName('NOME').AsString] )),
      'Atenção', MB_OK + MB_ICONINFORMATION
    );
  end;

end;

procedure TfrmUsuarios.Pesquisar;
var
  LFiltroPesquisa : String;

begin

  dmUsuarios.cdsUsuarios.Params.Clear;

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE 1 = 1' + LFiltroPesquisa + 'ORDER BY 1';
  dmUsuarios.cdsUsuarios.Open;

  HabilitaBotoes;

  inherited;

end;
procedure TfrmUsuarios.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;
  end;


  if Trim(edtLogin.Text) = '' then
  begin

    Application.MessageBox('Campo Login não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtLogin.SetFocus;
    abort;

  end;

  if dmUsuarios.VerificaLogin(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin

    Application.MessageBox(PWidechar(Format('Login %s já cadastrado!', [edtLogin.Text])), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtLogin.SetFocus;
    abort;
  end;


end;

end.
