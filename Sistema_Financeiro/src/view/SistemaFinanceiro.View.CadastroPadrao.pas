unit SistemaFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels;

type
  TfrmCadastroPadrao = class(TForm)
    CardPanelPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    pnlPesquisa: TPanel;
    pnlBotoes: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    lblPesquisar: TLabel;
    edtPesquisar: TEdit;
    btnPesquisae: TButton;
    Image1: TImage;
    ImageList1: TImageList;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnImprimir: TButton;
    btnSair: TButton;
    pnlBotoesCad: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    PanelCampos: TPanel;
    PanelTitulo: TPanel;
    Labeltitulo: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin

  //  Abre a tela de cadastro
  CardPanelPrincipal.ActiveCard := CardCadastro;

end;

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin

   //  Abre a tela de cadastro
  CardPanelPrincipal.ActiveCard := CardPesquisa;

end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin

  //  Abre a tela de cadastro
  CardPanelPrincipal.ActiveCard := CardCadastro;

end;

end.
