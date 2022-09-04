unit uFormConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uBiblioteca;

type
  TFormConfigBanco = class(TForm)
    Image1: TImage;
    LabelLocalBD: TLabel;
    EditLocal: TEdit;
    ButtonConfigurar: TButton;
    OpenDialogPastas: TOpenDialog;
    procedure ButtonConfigurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    procedure configura;

  public
    { Public declarations }
  end;

var
  FormConfigBanco: TFormConfigBanco;

implementation

{$R *.dfm}

procedure TFormConfigBanco.ButtonConfigurarClick(Sender: TObject);
begin
  configura;
end;

procedure TFormConfigBanco.configura;

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
    Application.Terminate;

    Self.Close;
  end;

end;

procedure TFormConfigBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
