unit fConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uBiblioteca;

type
  TfrmConfigBanco = class(TForm)
    Image1: TImage;
    OpenDialogPastas: TOpenDialog;
    LabelLocalBD: TLabel;
    EditLocal: TEdit;
    ButtonConfigurar: TButton;
    Label1: TLabel;
    procedure ButtonConfigurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    procedure configura;

  public
    { Public declarations }
  end;

var
  frmConfigBanco: TfrmConfigBanco;

implementation

{$R *.dfm}

procedure TfrmConfigBanco.ButtonConfigurarClick(Sender: TObject);
begin
  configura;
end;

procedure TfrmConfigBanco.configura;

var
  vFileName: string;

begin

  if OpenDialogPastas.Execute then
  begin

    //  Coloca no edit o caminho e nome completo do arquivo selecionado
    EditLocal.Text := OpenDialogPastas.FileName;

    //  Setando o caminho do banco
    vFileName      := ExtractFilePath(Application.ExeName) + 'config.ini';

    //  Passando o caminho do banco para ser adicionado no arquivo ini
    setValorIni(vFileName, 'CONFIGURACAO', 'LOCAL_DB', EditLocal.Text);

    showmessage('Configuração realizada com sucesso!');
    showmessage('Abra o Sistema novamente!');
    Application.Terminate;

    Self.Close;
  end;

end;

procedure TfrmConfigBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
