unit SistemaFinanceiro.View.ConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, IniFiles;

type
  TfrmConfigBanco = class(TForm)
    ButtonConfigurar: TButton;
    edtLocal: TEdit;
    Image1: TImage;
    Label1: TLabel;
    LabelLocalBD: TLabel;
    OpenDialogPastas: TOpenDialog;
    procedure ButtonConfigurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfiguraBanco;
    procedure setValorIni(pLocal, pSessao, pSubSessao, pValor: string);

  public
    { Public declarations }
  end;

var
  frmConfigBanco: TfrmConfigBanco;

implementation

{$R *.dfm}

procedure TfrmConfigBanco.ButtonConfigurarClick(Sender: TObject);
begin
  ConfiguraBanco;
end;

procedure TfrmConfigBanco.ConfiguraBanco;
var
  vFileName: string;

begin

  if OpenDialogPastas.Execute then
  begin

    //  Coloca no edit o caminho e nome completo do arquivo selecionado
    edtLocal.Text := OpenDialogPastas.FileName;

    //  Setando o caminho do banco
    vFileName      := ExtractFilePath(Application.ExeName) + 'ConfigBanco.ini';

    //  Passando o caminho do banco para ser adicionado no arquivo ini
    setValorIni(vFileName, 'CONFIGURACAO', 'Database', edtLocal.Text);

    showmessage('Configuração realizada com sucesso!');
    showmessage('Abra o Sistema novamente!');
    Application.Terminate;

    Self.Close;

  end;

end;



procedure TfrmConfigBanco.setValorIni(pLocal, pSessao, pSubSessao, pValor: string);
var
  vArquivo: TIniFile;

begin

    //  Criando arquivo ini
    vArquivo := TIniFile.Create(pLocal);

    //  Escrevendo no ini
    vArquivo.WriteString(pSessao, pSubSessao, pValor);

    vArquivo.Free;

end;

end.
