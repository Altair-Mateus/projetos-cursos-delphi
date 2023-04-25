unit SistemaFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgDll: TImage;
    lblstatus: TLabel;
    ProgressBar: TProgressBar;
    lblNomeApp: TLabel;
    Timer: TTimer;
    imgLogo: TImage;
    imgBd: TImage;
    imgConfig: TImage;
    imgIniciando: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(mensagem: String; imagem: TImage);

  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(mensagem: String; imagem: TImage);
begin

  //  Altera o caption
  lblstatus.Caption := mensagem;

  //  Mostra a imagem
  imagem.Visible := True;

end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  lblstatus.Caption := '';
end;

procedure TfrmSplash.TimerTimer(Sender: TObject);
begin

  if ProgressBar.Position <= 100 then
  begin

    ProgressBar.StepIt;

    case ProgressBar.Position of

      10: AtualizarStatus('Carregando dependências...', imgDll);
      25: AtualizarStatus('Conectando ao Banco de Dados...', imgBd);
      45: AtualizarStatus('Carregando as configurações...', imgConfig);
      75: AtualizarStatus('Iniciando o Sistema...', imgIniciando);

    end;

    if ProgressBar.Position = 100 then
    begin

      Close;

    end;


  end;

end;

end.
