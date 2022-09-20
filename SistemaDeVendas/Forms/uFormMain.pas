unit uFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus, uFormCadastroClientes, uFormCadastroEstado, uFormCadastroCidade;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Estados1: TMenuItem;
    Cidades1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}


procedure TFormMain.Cidades1Click(Sender: TObject);
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

procedure TFormMain.Clientes1Click(Sender: TObject);
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

procedure TFormMain.Estados1Click(Sender: TObject);
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

end.
