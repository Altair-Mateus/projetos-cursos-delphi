unit SistemaFinanceiro.View.Ajuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ShellAPI, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfrmAjuda = class(TForm)
    pnlInfo: TPanel;
    lblAviso: TLabel;
    lblManual: TLabel;
    btnManual: TButton;
    ImageList1: TImageList;
    pnlSuporte: TPanel;
    pnlGitHub: TPanel;
    lblSuporte: TLabel;
    btnGitHub: TButton;
    lblGithub: TLabel;
    btnSupTec: TButton;
    procedure btnGitHubClick(Sender: TObject);
    procedure btnSupTecClick(Sender: TObject);
    procedure btnManualClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuda: TfrmAjuda;

implementation

{$R *.dfm}

procedure TfrmAjuda.btnGitHubClick(Sender: TObject);
begin

  //  Abre o repositorio do github
  ShellExecute(0, 'open', 'https://github.com/Altair-Mateus', nil, nil, SW_SHOWNORMAL);

end;

procedure TfrmAjuda.btnManualClick(Sender: TObject);
begin

  //  Abre o PDF do manual do sistema
  ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'manual.pdf'), nil, nil, SW_SHOWNORMAL);

end;

procedure TfrmAjuda.btnSupTecClick(Sender: TObject);
begin

  //  Abre uma conversa no whats do suporte
  ShellExecute(0, 'open', 'https://api.whatsapp.com/send?phone=55051995688841&text=Olá, preciso de suporte para o Sistema Financeiro.', nil, nil, SW_SHOWNORMAL);

end;

end.
