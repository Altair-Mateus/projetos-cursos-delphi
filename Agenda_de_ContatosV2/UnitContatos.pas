unit UnitContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    EditId: TEdit;
    LabelId: TLabel;
    LabelNome: TLabel;
    EditNome: TEdit;
    LabelTelefone: TLabel;
    EditTelefone: TEdit;
    LabelEmail: TLabel;
    EditEmail: TEdit;
    LabelObservacoes: TLabel;
    MemoObservacoes: TMemo;
    FDConnection1: TFDConnection;
    FDTable_Contatos: TFDTable;
    DataSource1: TDataSource;
    Button_Novo: TButton;
    Button_Salvar: TButton;
    Label_Status: TLabel;
    Label_StatusConBd: TLabel;
    Button_ContatoAnterior: TButton;
    Button_ProximoContato: TButton;
    procedure carrega;
    procedure FormCreate(Sender: TObject);
    procedure Button_ProximoContatoClick(Sender: TObject);
    procedure Button_ContatoAnteriorClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button_ContatoAnteriorClick(Sender: TObject);
begin
  FDTable_Contatos.Prior;
  carrega;
end;

procedure TForm1.Button_ProximoContatoClick(Sender: TObject);
begin
  FDTable_Contatos.Next;
  carrega;
end;

procedure TForm1.carrega;
begin
  EditId.Text := FDTable_Contatos.FieldByName('id').Value;
  EditNome.Text := FDTable_Contatos.FieldByName('nome').Value;
  EditTelefone.Text := FDTable_Contatos.FieldByName('telefone').Value;
  EditEmail.Text := FDTable_Contatos.FieldByName('email').Value;
  MemoObservacoes.Text := FDTable_Contatos.FieldByName('observacoes').Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

FDConnection1.Params.Database := 'D:\Projetos Desenvolvimento\Delphi\Agenda_de_ContatosV2\Dados\AGENDACONTATOS.FDB';
  FDConnection1.Connected := true;

  FDConnection1.Open();

  FDTable_Contatos.TableName := 'contatos';
  FDTable_Contatos.Active := true;

  if FDConnection1.Connected = true then
  begin

    Label_Status.Caption := 'Conectado';
    Label_Status.Font.Color := clGreen;
    carrega;
  end

end;

end.
