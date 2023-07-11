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
  BCrypt, SistemaFinanceiro.Utilitarios;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin

  inherited;

  EditarUsuario;

end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclusão
  DataModuleUsuarios.ClientDataSetUsuarios.Cancel;

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
    DataModuleUsuarios.ClientDataSetUsuarios.Delete;
    DataModuleUsuarios.ClientDataSetUsuarios.ApplyUpdates(0);

  except on E : Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir usuário', MB_OK + MB_ICONERROR);

  end;


end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblAvisoSenha.Visible := True;
  lblTitulo.Caption := 'Inserindo um novo usuário';

  if not (DataModuleUsuarios.ClientDataSetUsuarios.State in [ dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    DataModuleUsuarios.ClientDataSetUsuarios.Insert;

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
  if DataModuleUsuarios.ClientDataSetUsuarios.State in [dsInsert] then
  begin

    DataModuleUsuarios.ClientDataSetUsuariossenha.AsString := TBCrypt.GenerateHash(DataModuleUsuarios.TEMP_PASSWORD);
    DataModuleUsuarios.ClientDataSetUsuariossenha_temp.AsString := 'S';
    DataModuleUsuarios.ClientDataSetUsuariosdata_cadastro.AsDateTime := now;
    DataModuleUsuarios.GeraCodigo;

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
  DataModuleUsuarios.ClientDataSetUsuariosnome.AsString := Trim(edtNome.Text);
  DataModuleUsuarios.ClientDataSetUsuarioslogin.AsString := Trim(edtLogin.Text);
  DataModuleUsuarios.ClientDataSetUsuariosstatus.AsString := LStatus;

  //  Gravando no banco de dados
  DataModuleUsuarios.ClientDataSetUsuarios.Post;
  DataModuleUsuarios.ClientDataSetUsuarios.ApplyUpdates(0);

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
  DataModuleUsuarios.ClientDataSetUsuarios.Edit;

  //  Coloca o nome do usuario no titulo
  lblTitulo.Caption := DataModuleUsuarios.ClientDataSetUsuariosid.AsString + ' - ' + DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;

  //  Carrega os dados
  edtNome.Text  := DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;
  edtLogin.Text := DataModuleUsuarios.ClientDataSetUsuarioslogin.AsString;

  if DataModuleUsuarios.ClientDataSetUsuariosstatus.AsString = 'A' then
  begin

  ToggleStatus.State := tssOn;

  end
  else
  begin

    ToggleStatus.State := tssOff;

  end;

end;

procedure TfrmUsuarios.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceUsuarios.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceUsuarios.DataSet.IsEmpty;

end;

procedure TfrmUsuarios.mnuLimpaSenhaClick(Sender: TObject);
begin
  inherited;

  if not DataSourceUsuarios.DataSet.IsEmpty then
  begin

    DataModuleUsuarios.LimparSenhaTemp(DataSourceUsuarios.DataSet.FieldByName('ID').AsString);

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

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  DataModuleUsuarios.ClientDataSetUsuarios.Close;
  DataModuleUsuarios.ClientDataSetUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE 1 = 1' + LFiltroPesquisa + 'ORDER BY 1';
  DataModuleUsuarios.ClientDataSetUsuarios.Open;

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

  if DataModuleUsuarios.VerificaLogin(Trim(edtLogin.Text), DataModuleUsuarios.ClientDataSetUsuarios.FieldByName('ID').AsString) then
  begin

    Application.MessageBox(PWidechar(Format('Login %s já cadastrado!', [edtLogin.Text])), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtLogin.SetFocus;

    abort;
  end;


end;


end.
