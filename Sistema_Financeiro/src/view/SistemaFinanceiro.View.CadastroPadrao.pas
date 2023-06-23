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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }

  public
    { Public declarations }

    procedure LimpaCampos;
    procedure ValidaSelecao;

  protected

    procedure Pesquisar; virtual;

  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

uses
  Vcl.WinXCtrls;

{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin

  ValidaSelecao;

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

procedure TfrmCadastroPadrao.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  begin
  if (gdSelected in State) then
  begin
    DBGrid1.Canvas.Brush.Color := $00578B2E;  // Define a cor de fundo da célula selecionada
    DBGrid1.Canvas.Font.Color := clWhite;  // Define a cor do texto da célula selecionada
  end;

  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin

  //  Exibe o card de pesquisa primeiro
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  Pesquisar;

end;


procedure TfrmCadastroPadrao.LimpaCampos;
var

  Contador: integer;

begin

  for contador := 0 to Pred(ComponentCount) do
  begin

    if Components[Contador] is TCustomEdit then
    begin
      TCustomEdit(Components[Contador]).Clear;
    end
    else if Components[Contador] is TToggleSwitch then
    begin
      TToggleSwitch(Components[Contador]).State := tssOn;
    end;



  end;


end;

procedure TfrmCadastroPadrao.Pesquisar;
begin

end;

procedure TfrmCadastroPadrao.ValidaSelecao;
begin

  if DBGrid1.SelectedIndex < 0 then
  begin

    Application.MessageBox('Selecione um cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

end;

end.
