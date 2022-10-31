unit fPesquisarPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, uDmDados,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisarPai = class(TForm)
    Panel1: TPanel;
    LabelCodigo: TLabel;
    EditCodigo: TEdit;
    ButtonPesquisa: TButton;
    ButtonSair: TButton;
    ButtonVisualizar: TButton;
    ButtonNovo: TButton;
    DataSourcePesquisar: TDataSource;
    FDQueryPesquisar: TFDQuery;
    FDTransactionPesquisar: TFDTransaction;
    LabelNome: TLabel;
    EditNome: TEdit;
    LabelOrdena: TLabel;
    RadioButtonCodigo: TRadioButton;
    RadioButtonNome: TRadioButton;
    DBGridResultadoPesquisa: TDBGrid;
    procedure ButtonSairClick(Sender: TObject);
    procedure ValidaQueryVazia;
    procedure ButtonVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarPai: TfrmPesquisarPai;

implementation

{$R *.dfm}

procedure TfrmPesquisarPai.ButtonSairClick(Sender: TObject);
begin

  //  Fecha a tela
  Self.Close;

end;

procedure TfrmPesquisarPai.ButtonVisualizarClick(Sender: TObject);
begin

  ValidaQueryVazia;

end;

procedure TfrmPesquisarPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  //  Quando for finalizado limpa a memoria que a tela estava usando
  Action := caFree;

end;

procedure TfrmPesquisarPai.ValidaQueryVazia;
begin

  //  Se a Query esta vazia exibe uma mensagem
  //  para selecionar um registro

  if FDQueryPesquisar.IsEmpty then
  begin

    ShowMessage('SELECIONE UM CADASTRO PARA VISUALIZAR!');
    Abort;

  end;

end;

end.
