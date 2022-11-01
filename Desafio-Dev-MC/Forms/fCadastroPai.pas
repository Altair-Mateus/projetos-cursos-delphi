unit fCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uDmDados, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  System.ImageList, Vcl.ImgList;

type
  TfrmCadastroPai = class(TForm)
    Panel1: TPanel;
    BitBtnNovo: TBitBtn;
    BitBtnSalvar: TBitBtn;
    BitBtnSair: TBitBtn;
    BitBtnCancelar: TBitBtn;
    DataSourceCadastro: TDataSource;
    FDQueryCadastro: TFDQuery;
    FDUpdateSQLCadastro: TFDUpdateSQL;
    FDTransactionCadastro: TFDTransaction;
    ImageList1: TImageList;
    PanelCampos: TPanel;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadastroPai: TfrmCadastroPai;

implementation

{$R *.dfm}

procedure TfrmCadastroPai.BitBtnCancelarClick(Sender: TObject);
begin

  if FDQueryCadastro.State in [dsEdit, dsInsert] then
  begin

    //  Inicia a transaction
    FDTransactionCadastro.StartTransaction;

    //  Cancela o procedimento
    FDQueryCadastro.Cancel;

    //  Descartas as alteracoes feitas na transaction
    FDTransactionCadastro.RollbackRetaining;

  end;

end;

procedure TfrmCadastroPai.BitBtnExcluirClick(Sender: TObject);
begin

  //  Exclui o registro
  FDQueryCadastro.Delete;

  ShowMessage('Cadastro Excluído!');



end;

procedure TfrmCadastroPai.BitBtnNovoClick(Sender: TObject);
begin

  BitBtnSalvar.Enabled   := True;
  BitBtnCancelar.Enabled := True;
  BitBtnNovo.Enabled     := False;
  PanelCampos.Enabled    := True;

  // Abre a query
  FDQueryCadastro.Open();

  //  Se o FDQuery não estiver inserindo ou editando entraremos no modo de insert
  if not (FDQueryCadastro.State in [dsEdit, dsInsert]) then
  begin

    FDQueryCadastro.Insert;

  end;

end;

procedure TfrmCadastroPai.BitBtnSairClick(Sender: TObject);
begin

  //  Fecha a tela
  Self.Close;

end;

procedure TfrmCadastroPai.BitBtnSalvarClick(Sender: TObject);
begin

  BitBtnSalvar.Enabled   := False;
  BitBtnCancelar.Enabled := False;
  BitBtnNovo.Enabled     := True;
  PanelCampos.Enabled    := False;

  if FDQueryCadastro.State in [dsEdit, dsInsert] then
  begin

    //  Inicia a transaction
    FDTransactionCadastro.StartTransaction;

    //  Grava no banco
    FDQueryCadastro.Post;

    //  Mantem a trnsaction aberta
    FDTransactionCadastro.Commit;

    ShowMessage('Cadastro Salvo!');

    end;


end;

end.
