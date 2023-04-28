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
  inherited;

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

procedure TfrmUsuarios.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  DataModuleUsuarios.ClientDataSetUsuarios.Close;
  DataModuleUsuarios.ClientDataSetUsuarios.CommandText := 'select * from usuarios';
  DataModuleUsuarios.ClientDataSetUsuarios.Open;

end;

end.
