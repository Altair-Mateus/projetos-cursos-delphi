unit uFrmListViewOO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  uCliente;

type
  TfrmListViewOO = class(TForm)
    ListViewDados: TListView;
    PanelCampos: TPanel;
    LabelNome: TLabel;
    LabelEmail: TLabel;
    EditNome: TEdit;
    EditEmail: TEdit;
    ButtonAdicionar: TButton;
    ButtonRemover: TButton;
    ButtonExibir: TButton;
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure ButtonRemoverClick(Sender: TObject);
    procedure ButtonExibirClick(Sender: TObject);
    procedure ListViewDadosDeletion(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListViewOO: TfrmListViewOO;

implementation

{$R *.dfm}

procedure TfrmListViewOO.ButtonAdicionarClick(Sender: TObject);
var

  tempItem : TListItem;

  //  Criando o objeto
  tempCliente : TCliente;

begin

  //  Instanciando o objeto
  tempCliente := TCliente.Create;

  //  Atribuindo valores ao objeto
  tempCliente.Nome  := EditNome.Text;
  tempCliente.Email := EditEmail.Text;

  tempItem         := ListViewDados.Items.Add;
  tempItem.Caption := tempCliente.Nome;
  tempItem.SubItems.Add(tempCliente.Email);

  //  Vincula o objeto ao item da lista
  tempItem.Data    := tempCliente;

  EditNome.Text  := '';
  EditEmail.Text := '';
  EditNome.SetFocus;

end;

procedure TfrmListViewOO.ButtonExibirClick(Sender: TObject);
var

  tempCliente : TCliente;

begin

  if ListViewDados.ItemIndex > -1 then
  begin

    //  Aponta para o ponteiro do objeto selecionado
    tempCliente := ListViewDados.Selected.Data;

    ShowMessage
    (
      'Nome: ' + tempCliente.Nome +
      #13 + 'E-mail: ' + tempCliente.Email
    );

  end;

end;

procedure TfrmListViewOO.ButtonRemoverClick(Sender: TObject);
var

  tempCliente : TCliente;

begin

  if ListViewDados.ItemIndex > -1 then
  begin

    ListViewDados.Selected.Delete;

  end;

end;

procedure TfrmListViewOO.ListViewDadosDeletion(Sender: TObject;
  Item: TListItem);
begin

  if Item.Data <> nil then
  begin

    TObject(Item.Data).Destroy;
    item.Data := nil;

  end;


end;

end.
