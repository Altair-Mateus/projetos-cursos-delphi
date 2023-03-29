unit uFrmListView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  uCliente;

type
  TFrmListView = class(TForm)
    ListViewDados: TListView;
    PanelCampos: TPanel;
    LabelNome: TLabel;
    EditNome: TEdit;
    EditEmail: TEdit;
    LabelEmail: TLabel;
    ButtonAdicionar: TButton;
    ButtonRemover: TButton;
    ButtonExibir: TButton;
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure ButtonRemoverClick(Sender: TObject);
    procedure ButtonExibirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListView: TFrmListView;

implementation

{$R *.dfm}

procedure TFrmListView.ButtonAdicionarClick(Sender: TObject);
var
  //  Representa o item que estava adicionando
  tempItem: TListItem;

begin

  //  Adiciona um novo item
  tempItem := ListViewDados.Items.Add;

  //  Alimenta os campos do ListView
  tempItem.Caption := EditNome.Text;
  tempItem.SubItems.Add(EditEmail.Text);


  EditNome.Text := '';
  EditEmail.Text := '';
  EditNome.SetFocus;

end;

procedure TFrmListView.ButtonExibirClick(Sender: TObject);
begin

  if ListViewDados.ItemIndex > -1 then
  begin

    ShowMessage('Nome: ' + ListViewDados.Selected.Caption + #13
    + 'E-mail: ' + ListViewDados.Selected.SubItems[0]);

  end;

end;

procedure TFrmListView.ButtonRemoverClick(Sender: TObject);
begin

  if ListViewDados.ItemIndex > -1 then
  begin

    ListViewDados.Selected.Delete;

  end;


end;

end.
