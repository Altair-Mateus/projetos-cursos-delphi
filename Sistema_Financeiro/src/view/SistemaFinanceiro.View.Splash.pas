unit SistemaFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgLogo: TImage;
    lblstatus: TLabel;
    ProgressBar: TProgressBar;
    lblNomeApp: TLabel;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

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

      10: lblstatus.Caption := 'Carregando dependências...';
      25: lblstatus.Caption := 'Conectado ao Banco de Dados...';
      45: lblstatus.Caption := 'Carregando as configurações...';
      75: lblstatus.Caption := 'Iniciando o Sistema...'

    end;

    if ProgressBar.Position = 100 then
    begin

      Close;

    end;


  end;

end;

end.
