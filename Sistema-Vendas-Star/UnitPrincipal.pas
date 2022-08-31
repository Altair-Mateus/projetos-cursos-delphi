unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TformPrincipal = class(TForm)
    mainMenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrios1: TMenuItem;
    menuCadastrosClientes: TMenuItem;
    N1: TMenuItem;
    menuCadastrosCategorias: TMenuItem;
    menuCadastrosProdutos: TMenuItem;
    N2: TMenuItem;
    menuCadastrosSair: TMenuItem;
    menuMovimentacaoVendas: TMenuItem;
    menuRelatoriosClientes: TMenuItem;
    N3: TMenuItem;
    menuRelatoriosProdutos: TMenuItem;
    N4: TMenuItem;
    menuRelatoriosVendasPorData: TMenuItem;
    procedure menuCadastrosSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.menuCadastrosSairClick(Sender: TObject);
begin

  //  Fecha a aplicação
  //Close;
  Application.Terminate;

end;

end.
