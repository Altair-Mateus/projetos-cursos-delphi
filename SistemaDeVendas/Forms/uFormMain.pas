unit uFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus, uFormCadastroClientes, uFormCadastroEstado, uFormCadastroCidade,
  uFormFiltroClientes, uFormCadastroFornecedor, uFormFiltroFornecedores;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    CadClientes: TMenuItem;
    CadEstados: TMenuItem;
    CadCidades: TMenuItem;
    Pesquisar: TMenuItem;
    PesqClientes: TMenuItem;
    Fornecedores1: TMenuItem;
    Fornecedores2: TMenuItem;
    procedure CadClientesClick(Sender: TObject);
    procedure CadCidadesClick(Sender: TObject);
    procedure CadEstadosClick(Sender: TObject);
    procedure PesqClientesClick(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}


procedure TFormMain.CadCidadesClick(Sender: TObject);
begin

  //  Cria o Form
  FormCadastroCidade := TFormCadastroCidade.Create(Self);

  try

    //  Exibe o form
    FormCadastroCidade.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCidade);

  end;

end;

procedure TFormMain.CadClientesClick(Sender: TObject);
begin

  //  Cria o form
  FormCadastroCliente := TFormCadastroCliente.Create(Self);

  try

    //  Exibe o Form
    FormCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCliente);

  end;
end;

procedure TFormMain.PesqClientesClick(Sender: TObject);
begin



  try

    //  Cria o form
    FormFiltroCliente := TFormFiltroCliente.Create(Self);

    //  Exibe o Form
    FormFiltroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormFiltroCliente);

  end;

end;

procedure TFormMain.CadEstadosClick(Sender: TObject);
begin

  //  Cria o form
  FormCadastroEstado := TFormCadastroEstado.Create(Self);

  try

    //  Exibe o Form
    FormCadastroEstado.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroEstado);

  end;
end;

procedure TFormMain.Fornecedores1Click(Sender: TObject);
begin

  //  Cria o form
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);

  try

    //  Exibe o Form
    FormCadastroFornecedor.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroFornecedor);

  end;

end;


end.
