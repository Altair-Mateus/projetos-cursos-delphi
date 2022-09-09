unit uFormCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uDmDados, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  TFormCadastroPai = class(TForm)
    PanelCabecalho: TPanel;
    BitBtnNovo: TBitBtn;
    BitBtnSalvar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    BitBtnExcluir: TBitBtn;
    BitBtnSair: TBitBtn;
    FDQueryCadastro: TFDQuery;
    FDUpdateSQLCadastro: TFDUpdateSQL;
    FDTransactionCadastro: TFDTransaction;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPai: TFormCadastroPai;

implementation

{$R *.dfm}

procedure TFormCadastroPai.BitBtnCancelarClick(Sender: TObject);
begin

  if FDQueryCadastro.State in [dsEdit, dsInsert] then
  begin

    //  Cancela o procedimento
    FDQueryCadastro.Cancel;

    //  Descarta as alteracoes feitas na transaction
    FDTransactionCadastro.RollbackRetaining;

  end;


end;

procedure TFormCadastroPai.BitBtnExcluirClick(Sender: TObject);
begin

  //  Modo de edição
  FDQueryCadastro.Edit;

  //  Localiza o campo da tabela e define o valor da variavel Date
  FDQueryCadastro.FieldByName('DT_EXCLUIDO').AsDateTime := Date;

  //  Grava no BD
  FDQueryCadastro.Post;

  //  Mantem a transacao aberta
  FDTransactionCadastro.CommitRetaining;

end;

procedure TFormCadastroPai.BitBtnNovoClick(Sender: TObject);
begin

  //  Se o FDQuery não estiver inserindo ou editando entraremos no modo de insert
  if not (FDQueryCadastro.State in [dsEdit, dsInsert]) then
  begin

    FDQueryCadastro.Insert;

  end;


end;

procedure TFormCadastroPai.BitBtnSairClick(Sender: TObject);
begin

  //  Fecha a tela
  Self.Close;

end;

procedure TFormCadastroPai.BitBtnSalvarClick(Sender: TObject);
begin

  if FDQueryCadastro.State in [dsEdit, dsInsert] then
  begin
    // Grava no banco de dados
    FDQueryCadastro.Post;

    //  Mantem a transacao aberta
    FDTransactionCadastro.CommitRetaining;
  end;

end;

end.
