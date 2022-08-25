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
    Button_Excluir: TButton;
    Button_Editar: TButton;
    Button_Cancelar: TButton;
    EditPesquisa: TEdit;
    LabelPesquisar: TLabel;
    procedure bloqueia;
    procedure limpa;
    procedure carrega;
    procedure FormCreate(Sender: TObject);
    procedure Button_ProximoContatoClick(Sender: TObject);
    procedure Button_ContatoAnteriorClick(Sender: TObject);
    procedure Button_NovoClick(Sender: TObject);
    procedure Button_SalvarClick(Sender: TObject);
    procedure FDTable_ContatosBeforePost(DataSet: TDataSet);
    procedure Button_ExcluirClick(Sender: TObject);
    procedure Button_EditarClick(Sender: TObject);
    procedure Button_DesbloqueiaClick(Sender: TObject);
    procedure Button_CancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  estado: integer;

implementation

{$R *.dfm}

//  Bloqueia/Desbloqueia os Edit
procedure TForm1.bloqueia;
begin

  EditNome.Enabled          := not EditNome.Enabled;
  EditTelefone.Enabled      := not EditTelefone.Enabled;
  EditEmail.Enabled         := not EditEmail.Enabled ;
  MemoObservacoes.Enabled   := not MemoObservacoes.Enabled;

end;

//  Limpas os Edit
procedure TForm1.limpa;
begin

  EditId.Text          := '';
  EditNome.Text        := '';
  EditTelefone.Text    := '';
  EditEmail.Text       := '';
  MemoObservacoes.Text := '';


end;

procedure TForm1.Button_DesbloqueiaClick(Sender: TObject);
begin
bloqueia;
end;

procedure TForm1.Button_CancelarClick(Sender: TObject);
begin

  //  Limpa os dados
  limpa;


  if estado  = 1 then
    FDTable_Contatos.Prior;

  //  carrega os dados
  carrega;

  //  bloqueia as edits
  bloqueia;

  estado := 0;


end;

procedure TForm1.Button_ContatoAnteriorClick(Sender: TObject);
begin

  //  Retorna ao registro anterior
  FDTable_Contatos.Prior;

  //  Carrega os dados
  carrega;

end;

procedure TForm1.Button_EditarClick(Sender: TObject);
begin

  bloqueia;
  FDTable_Contatos.Edit;


end;

procedure TForm1.Button_ExcluirClick(Sender: TObject);
begin

  FDTable_Contatos.Delete;

  carrega;
end;

procedure TForm1.Button_NovoClick(Sender: TObject);
begin

  //  Desbloqueia os campos
  bloqueia;

  //  Limpa os campos
  limpa;

  estado := 1; // post

  //  Coloca o cursor no EditNome
  EditNome.SetFocus;

  FDTable_Contatos.Insert;

end;

procedure TForm1.Button_ProximoContatoClick(Sender: TObject);
begin
  //  Avança para o próximo registro
  FDTable_Contatos.Next;

  //  Carrega os dados
  carrega;
end;

procedure TForm1.Button_SalvarClick(Sender: TObject);
begin

  FDTable_Contatos.Post;
  bloqueia;

  ShowMessage('Dados salvos com sucesso!');

end;

//  Busca os dados na tabela e carrega nos Edit
procedure TForm1.carrega;
begin
  EditId.Text          := FDTable_Contatos.FieldByName('id').Value;
  EditTelefone.Text    := FDTable_Contatos.FieldByName('telefone').Value;

  //  Verifica se o campo é NULL
  if FDTable_Contatos.FieldByName('nome').Value = NULL then
  begin
    EditNome.Text := '';
  end
  else
  begin
    EditNome.Text := FDTable_Contatos.FieldByName('nome').Value;
  end;

  if FDTable_Contatos.FieldByName('email').Value = NULL then
  begin
    EditEmail.Text := '';
  end
  else
  begin
    EditEmail.Text       := FDTable_Contatos.FieldByName('email').Value;
  end;

  if FDTable_Contatos.FieldByName('observacoes').Value = NULL then
  begin
    MemoObservacoes.Text := '';
  end
  else
  begin
    MemoObservacoes.Text := FDTable_Contatos.FieldByName('observacoes').Value;
  end;



end;


procedure TForm1.FDTable_ContatosBeforePost(DataSet: TDataSet);
begin

  //  Salva os dados
  //  Pega o valor inserido no campo e grava no banco

  FDTable_Contatos.FieldByName('id').Required      := False;
  FDTable_Contatos.FieldByName('nome').Value       := EditNome.Text;
  FDTable_Contatos.FieldByName('telefone').Value   := EditTelefone.Text;
  FDTable_Contatos.FieldByName('email').Value      := EditEmail.Text;
  FDTable_Contatos.FieldByName('observacoes').Value := MemoObservacoes.Text;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  //  Inicia conexão com o banco

  //  Caminho do arquivo .FDB
  FDConnection1.Params.Database := 'D:\Projetos Desenvolvimento\Delphi\Agenda_de_ContatosV2\Dados\AGENDACONTATOS.FDB';

  //  Concta no Banco
  FDConnection1.Connected := true;

  //  Abre a conexão
  FDConnection1.Open();

  //  Define o nome da tabela que se conectará
  FDTable_Contatos.TableName := 'contatos';

  //  Ativa
  FDTable_Contatos.Active := true;


  //  Seta o status da conexão
  if FDConnection1.Connected = true then
  begin

    Label_Status.Caption := 'Conectado';
    Label_Status.Font.Color := clGreen;
    carrega;
  end
  else
  begin
    Label_Status.Caption := 'SEM CONEXÃO!';
    Label_Status.Font.Color := clRed;
  end;

end;

end.
