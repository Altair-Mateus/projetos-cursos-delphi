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
    EditNome: TEdit;
    LabelLogin: TLabel;
    EditLogin: TEdit;
    ToggleSwitchStatus: TToggleSwitch;
    LabelStatus: TLabel;
    PopupMenu: TPopupMenu;
    mnuLimpaSenha: TMenuItem;
    lblAvisoSenha: TLabel;
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure mnuLimpaSenhaClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaSelecao;
    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses

  SistemaFinanceiro.Model.dmUsuarios,
  BCrypt;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin

  //  Coloca o dataset em modo de edi��o
  DataModuleUsuarios.ClientDataSetUsuarios.Edit;

  ValidaSelecao;

  inherited;

    //  Coloca o nome do usuario no titulo
    Labeltitulo.Caption := DataModuleUsuarios.ClientDataSetUsuariosid.AsString + ' - ' + DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;

    //  Carrega os dados
    EditNome.Text  := DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;
    EditLogin.Text := DataModuleUsuarios.ClientDataSetUsuarioslogin.AsString;

    if DataModuleUsuarios.ClientDataSetUsuariosstatus.AsString = 'A' then
    begin

      ToggleSwitchStatus.State := tssOn;

    end
    else
    begin

      ToggleSwitchStatus.State := tssOff;

    end;

end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclus�o
  DataModuleUsuarios.ClientDataSetUsuarios.Cancel;

end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
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
    DataModuleUsuarios.ClientDataSetUsuarios.Delete;
    DataModuleUsuarios.ClientDataSetUsuarios.ApplyUpdates(0);

  except on E : Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir usu�rio', MB_OK + MB_ICONERROR);

  end;


end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblAvisoSenha.Visible := True;
  Labeltitulo.Caption := 'Inserindo um novo usu�rio';

  if not (DataModuleUsuarios.ClientDataSetUsuarios.State in [ dsEdit, dsInsert]) then
  begin

    //  Colocando o data set em modo de inser��o de dados
    DataModuleUsuarios.ClientDataSetUsuarios.Insert;


  end;

  DataModuleUsuarios.ClientDataSetUsuariosdata_cadastro.AsDateTime := now;
  DataModuleUsuarios.GeraCodigo;

end;

procedure TfrmUsuarios.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  DataModuleUsuarios.ClientDataSetUsuarios.Close;
  DataModuleUsuarios.ClientDataSetUsuarios.CommandText := 'select * from usuarios order by 1';
  DataModuleUsuarios.ClientDataSetUsuarios.Open;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var

  LStatus : String;

begin


  //  Valida os campos obrigat�rios
  ValidaCampos;

  //  Se for um novo usu�rio ser� colocado a senha tempor�ria
  if DataModuleUsuarios.ClientDataSetUsuarios.State in [dsInsert] then
  begin

    DataModuleUsuarios.ClientDataSetUsuariossenha.AsString := TBCrypt.GenerateHash(DataModuleUsuarios.TEMP_PASSWORD);
    DataModuleUsuarios.ClientDataSetUsuariossenha_temp.AsString := 'S';

  end;


  //  Define o status do usuario
  if ToggleSwitchStatus.State = tssOn then
  begin

    LStatus := 'A';

  end
  else
  begin

    LStatus := 'I';

  end;

  //  Passando os dados para o dataset
  DataModuleUsuarios.ClientDataSetUsuariosnome.AsString := Trim(EditNome.Text);
  DataModuleUsuarios.ClientDataSetUsuarioslogin.AsString := Trim(EditLogin.Text);
  DataModuleUsuarios.ClientDataSetUsuariosstatus.AsString := LStatus;

  //  Gravando no banco de dados
  DataModuleUsuarios.ClientDataSetUsuarios.Post;
  DataModuleUsuarios.ClientDataSetUsuarios.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  inherited;
end;

procedure TfrmUsuarios.mnuLimpaSenhaClick(Sender: TObject);
begin
  inherited;

  if not DataSourceUsuarios.DataSet.IsEmpty then
  begin

    DataModuleUsuarios.LimparSenhaTemp(DataSourceUsuarios.DataSet.FieldByName('ID').AsString);

    Application.MessageBox
    (
      PWideChar(format('Foi definida a senha padr�o para o usu�rio "%s"',
        [DataSourceUsuarios.DataSet.FieldByName('NOME').AsString] )),
      'Aten��o', MB_OK + MB_ICONINFORMATION

    );
  end;


end;

procedure TfrmUsuarios.ValidaCampos;
begin
if Trim(EditNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    EditNome.SetFocus;

    abort;
  end;

  if Trim(EditLogin.Text) = '' then
  begin

    Application.MessageBox('Campo Login n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    EditLogin.SetFocus;

    abort;
  end;

  if DataModuleUsuarios.VerificaLogin(Trim(EditLogin.Text), DataModuleUsuarios.ClientDataSetUsuarios.FieldByName('ID').AsString) then
  begin

    Application.MessageBox(PWidechar(Format('Login %s j� cadastrado!', [EditLogin.Text])), 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    EditLogin.SetFocus;

    abort;
  end;


end;

procedure TfrmUsuarios.ValidaSelecao;
begin

  if DBGrid1.SelectedIndex < 0 then
  begin

    Application.MessageBox('Selecione um usu�rio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

end;

end.
