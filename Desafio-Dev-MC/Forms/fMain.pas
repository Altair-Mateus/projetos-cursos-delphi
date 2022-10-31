unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, fCadastroCliente,
  fCadastroProduto, fPesquisarCliente, fPesquisarProdutos, fCadastroVenda,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, System.ImageList, Vcl.ImgList,
  fPesquisarVenda, Vcl.Imaging.pngimage;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Pesquisar1: TMenuItem;
    Clientes2: TMenuItem;
    N2: TMenuItem;
    Podutos1: TMenuItem;
    CriarNovaVenda1: TMenuItem;
    ConsultarVendas1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendas2: TMenuItem;
    Clientes3: TMenuItem;
    Clientes4: TMenuItem;
    PanelAcessoRapido: TPanel;
    ImageList1: TImageList;
    ButtonCadCliente: TButton;
    ButtonCadProd: TButton;
    ButtonVenda: TButton;
    Image1: TImage;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Podutos1Click(Sender: TObject);
    procedure CriarNovaVenda1Click(Sender: TObject);
    procedure ButtonCadProdClick(Sender: TObject);
    procedure ButtonCadClienteClick(Sender: TObject);
    procedure ButtonVendaClick(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.ButtonCadClienteClick(Sender: TObject);
begin

  //  Cria o form
  frmCadastroCliente := TfrmCadastroCliente.Create(Self);

  try

    //  Exibe o form
    frmCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroCliente);

  end;

end;

procedure TfrmMain.ButtonCadProdClick(Sender: TObject);
begin

  //  Cria o Form
  frmCadastroProdutos := TfrmCadastroProdutos.Create(Self);

  try

    //  Exibe o Form
    frmCadastroProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroProdutos);

  end;

end;

procedure TfrmMain.ButtonVendaClick(Sender: TObject);
begin

  //  Cria o form
  frmCadastroVenda := TfrmCadastroVenda.Create(Self);

  try

    //  Exibe o form
    frmCadastroVenda.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroVenda);

  end;

end;

procedure TfrmMain.Clientes1Click(Sender: TObject);
begin

  //  Cria o form
  frmCadastroCliente := TfrmCadastroCliente.Create(Self);

  try

    //  Exibe o form
    frmCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroCliente);

  end;


end;

procedure TfrmMain.Clientes2Click(Sender: TObject);
begin

  //  Cria o Form
  frmPesquisarClientes := TfrmPesquisarClientes.Create(Self);

  try


    //  Exibe o Form
    frmPesquisarClientes.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmPesquisarClientes);

  end;

end;

procedure TfrmMain.ConsultarVendas1Click(Sender: TObject);
begin

  //  Cria o Form
  frmPesquisarVenda := TfrmPesquisarVenda.Create(Self);

  try

    //  Exibe o Form
    frmPesquisarVenda.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmPesquisarVenda);

  end;


end;

procedure TfrmMain.CriarNovaVenda1Click(Sender: TObject);
begin

  //  Cria o form
  frmCadastroVenda := TfrmCadastroVenda.Create(Self);

  try

    //  Exibe o form
    frmCadastroVenda.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroVenda);

  end;


end;

procedure TfrmMain.Podutos1Click(Sender: TObject);
begin

  // Cria o form
  frmPesquisarProdutos := TfrmPesquisarProdutos.Create(Self);

  try

    //  Exibe o form
    frmPesquisarProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmPesquisarProdutos);

  end;

end;

procedure TfrmMain.Produtos1Click(Sender: TObject);
begin

  //  Cria o Form
  frmCadastroProdutos := TfrmCadastroProdutos.Create(Self);

  try

    //  Exibe o Form
    frmCadastroProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroProdutos);

  end;

end;

end.
