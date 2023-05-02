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
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure LimpaCampos;

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

  //  Limpa Campos
  LimpaCampos;

end;

procedure TfrmCadastroPadrao.btnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin

  //  Exibe o card de pesquisa primeiro
  CardPanelPrincipal.ActiveCard := CardPesquisa;

end;

procedure TfrmCadastroPadrao.LimpaCampos;
var

  Contador: integer;

begin

  for contador := 0 to Pred(ComponentCount) do
  begin

    if Components[Contador] is TCustomEdit then
      TCustomEdit(Components[Contador]).Clear;

  end;


end;

end.
