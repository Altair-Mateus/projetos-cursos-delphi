unit SistemaFinanceiro.View.BaixarCP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrmBaixarCP = class(TForm)
    pnlPrincipal: TPanel;
    pnlDocInfo: TPanel;
    pnlDetalhes: TPanel;
    pnlBotoes: TPanel;
    btnBaixar: TButton;
    btnCancelar: TButton;
    ImageList1: TImageList;
    gbDocInfo: TGroupBox;
    gbDetalhes: TGroupBox;
    lblNDoc: TLabel;
    lblParc: TLabel;
    lblVenc: TLabel;
    lblVParcela: TLabel;
    lblVAbatido: TLabel;
    lblDoc: TLabel;
    lblParcela: TLabel;
    lblVencimento: TLabel;
    lblValorParcela: TLabel;
    lblValorAbatido: TLabel;
    lblObs: TLabel;
    lblValor: TLabel;
    edtObs: TEdit;
    edtValor: TEdit;
    lblId: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BaixarCP(Id: String);

  end;

var
  frmBaixarCP: TfrmBaixarCP;

implementation

{$R *.dfm}

{ TfrmBaixarCP }

procedure TfrmBaixarCP.BaixarCP(Id: String);
begin



end;

end.
