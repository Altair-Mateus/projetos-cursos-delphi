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
    lblTitulo: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
    procedure ValidaSelecao;
  protected
    procedure Pesquisar; virtual;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
  end;
var
  frmCadastroPadrao: TfrmCadastroPadrao;
implementation
uses
  Vcl.WinXCtrls, Vcl.Mask, Vcl.ComCtrls;
{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin

  ValidaSelecao;

  //  Abre a tela de cadastro
  CardPanelPrincipal.ActiveCard := CardCadastro;

end;

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin

   //  Abre a tela de Pesquisa
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

procedure TfrmCadastroPadrao.DBGrid1DblClick(Sender: TObject);
begin

  ValidaSelecao;

  //  Abre a tela de cadastro
  CardPanelPrincipal.ActiveCard := CardCadastro;

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

procedure TfrmCadastroPadrao.EditKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada é o Enter
    //  Cancela o efeito do enter
    Key := #0;
    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
var
  I : Integer;
begin

  //  Percorre os componentes TEdit
  for I := 0 to ComponentCount - 1 do
  begin

    if (Components[I] is TEdit) or (Components[I] is TDateTimePicker) then
    begin
      //  Cria o evento OnKeyPress para cada Edit encontrado
      TEdit(Components[I]).OnKeyPress := EditKeyPress;
    end
    else if Components[I] is TMaskEdit then
    begin
      // Cria o evento OnKeyPress para cada MaskEdit encontrado
      TMaskEdit(Components[I]).OnKeyPress := EditKeyPress;
    end;

  end;

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
    end
    else if Components[Contador] is TRadioGroup then
    begin
      TRadioGroup(Components[Contador]).ItemIndex := -1;
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
