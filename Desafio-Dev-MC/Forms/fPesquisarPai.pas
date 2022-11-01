unit fPesquisarPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.ExtCtrls, uDmDados,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TfrmPesquisarPai = class(TForm)
    Panel1: TPanel;
    LabelCodigo: TLabel;
    EditCodigo: TEdit;
    ButtonPesquisa: TButton;
    ButtonSair: TButton;
    ButtonEditar: TButton;
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
    ImageList1: TImageList;
    ButtonExcluir: TButton;
    procedure ButtonSairClick(Sender: TObject);
    procedure ValidaQueryVazia;
    procedure ButtonEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarPai: TfrmPesquisarPai;

implementation

{$R *.dfm}

procedure TfrmPesquisarPai.ButtonExcluirClick(Sender: TObject);
var

  result : Word;

begin

  ValidaQueryVazia;

  result := Application.MessageBox('Deseja Excluir o Cadastro?', 'Confirmar Exclusão', MB_YESNO);

  case result of

    IDYES:
    begin
      DBGridResultadoPesquisa.DataSource.DataSet.Delete;
    end;

  end;

end;

procedure TfrmPesquisarPai.ButtonSairClick(Sender: TObject);
begin

  //  Fecha a tela
  Self.Close;

end;

procedure TfrmPesquisarPai.ButtonEditarClick(Sender: TObject);
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

    ShowMessage('SELECIONE UM CADASTRO!');
    Abort;

  end;

end;

end.
