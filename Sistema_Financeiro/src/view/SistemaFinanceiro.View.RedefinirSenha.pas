unit SistemaFinanceiro.View.RedefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmRedefinirSenha = class(TForm)
    pnlLogin: TPanel;
    imgPessoa: TImage;
    imgCadeado: TImage;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    btnSalvar: TButton;
    Image1: TImage;
    lblUsuario: TLabel;
    lblRedefina: TLabel;
    lblSenha: TLabel;
    lblConfirmaSenha: TLabel;
    btnCancelar: TButton;
    ImageList1: TImageList;
    pnlBtns: TPanel;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

{$R *.dfm}

procedure TfrmRedefinirSenha.btnCancelarClick(Sender: TObject);
begin

  Application.Terminate;

end;

end.
