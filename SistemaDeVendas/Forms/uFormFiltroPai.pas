unit uFormFiltroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmDados;

type
  TFormFiltroPai = class(TForm)
    Panel1: TPanel;
    EditFiltro: TEdit;
    Label1: TLabel;
    ButtonPesquisa: TButton;
    FDQueryFiltro: TFDQuery;
    DataSourceFiltro: TDataSource;
    FDTransactionFiltro: TFDTransaction;
    ButtonSair: TButton;
    ButtonVisualizar: TButton;
    ButtonNovo: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSairClick(Sender: TObject);
    procedure ButtonVisualizarClick(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaQueryVazia;

  public
    { Public declarations }
  end;

var
  FormFiltroPai: TFormFiltroPai;

implementation

{$R *.dfm}

procedure TFormFiltroPai.ButtonSairClick(Sender: TObject);
begin

  //  Fecha a tela
  Self.Close;

end;

procedure TFormFiltroPai.ButtonVisualizarClick(Sender: TObject);
begin

  ValidaQueryVazia;

end;

procedure TFormFiltroPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  //  Quando for finalizado limpa a memoria que a tela estava usando
  Action := caFree;

end;

procedure TFormFiltroPai.ValidaQueryVazia;
begin

   if FDQueryFiltro.IsEmpty then
  begin

    ShowMessage('SELECIONE UM CADASTRO PARA VISUALIZAR');
    Abort;

  end;

end;

end.
