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
  Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSourceUsuarios: TDataSource;
    LabelNome: TLabel;
    EditNome: TEdit;
    LabelLogin: TLabel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    LabelSenha: TLabel;
    ToggleSwitchStatus: TToggleSwitch;
    LabelStatus: TLabel;
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmUsuarios;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin

  //  Coloca o dataset em modo de edição
  DataModuleUsuarios.ClientDataSetUsuarios.Edit;

  if DBGrid1.SelectedIndex < 1 then
  begin

    Application.MessageBox('Selecione um usuário para alterar!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  inherited;

    //  COloca o nome do usuario no titulo
    Labeltitulo.Caption := DataModuleUsuarios.ClientDataSetUsuariosid.AsString + ' - ' + DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;

    //  Carrega os dados
    EditNome.Text  := DataModuleUsuarios.ClientDataSetUsuariosnome.AsString;
    EditLogin.Text := DataModuleUsuarios.ClientDataSetUsuarioslogin.AsString;
    EditSenha.Text := DataModuleUsuarios.ClientDataSetUsuariossenha.AsString;

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

  //  Cancelando inclusão
  DataModuleUsuarios.ClientDataSetUsuarios.Cancel;

end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  Labeltitulo.Caption := 'Inserindo um novo usuário';

  //  Colocando o data set em modo de inserção de dados
  DataModuleUsuarios.ClientDataSetUsuarios.Insert;

end;

procedure TfrmUsuarios.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  DataModuleUsuarios.ClientDataSetUsuarios.Close;
  DataModuleUsuarios.ClientDataSetUsuarios.CommandText := 'select * from usuarios';
  DataModuleUsuarios.ClientDataSetUsuarios.Open;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var

  LStatus : String;

begin


  //  Valida os campos obrigatórios
  if Trim(EditNome.Text) = '' then
  begin

    Application.MessageBox('Campo nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    EditNome.SetFocus;

    abort;
  end;

  if Trim(EditLogin.Text) = '' then
  begin

    Application.MessageBox('Campo Login não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    EditLogin.SetFocus;

    abort;
  end;

  if Trim(EditSenha.Text) = '' then
  begin

    Application.MessageBox('Campo Senha não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    EditSenha.SetFocus;

    abort;
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
  DataModuleUsuarios.ClientDataSetUsuariossenha.AsString := Trim(EditSenha.Text);
  DataModuleUsuarios.ClientDataSetUsuariosstatus.AsString := LStatus;

  //  Gravando no banco de dados
  DataModuleUsuarios.ClientDataSetUsuarios.Post;
  DataModuleUsuarios.ClientDataSetUsuarios.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  inherited;
end;

end.
