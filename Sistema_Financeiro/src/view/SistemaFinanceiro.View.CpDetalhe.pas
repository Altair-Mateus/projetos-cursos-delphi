unit SistemaFinanceiro.View.CpDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmCpDetalhe = class(TForm)
    ImageList1: TImageList;
    pnlBotoes: TPanel;
    btnVoltar: TButton;
    pnlGrid: TPanel;
    pnlPesquisa: TPanel;
    DataSourceCPDetalhe: TDataSource;
    lblTValorParcela: TLabel;
    lblTValorCompra: TLabel;
    lblValorCompra: TLabel;
    lblValorParcela: TLabel;
    lblTCodFornec: TLabel;
    lblCodFornec: TLabel;
    lblNumParcela: TLabel;
    lblVencimento: TLabel;
    lblDesc: TLabel;
    lblNumDoc: TLabel;
    lblTNDoc: TLabel;
    lblTDesc: TLabel;
    lblTVencimento: TLabel;
    lblTNumParcela: TLabel;
    lblFrPgto: TLabel;
    DBGridPgto: TDBGrid;
    DataSourcePgto: TDataSource;
    DBGridParciais: TDBGrid;
    lblParciais: TLabel;
    DataSourceParciais: TDataSource;
    edtDtPag: TEdit;
    lblDtPag: TLabel;
    lblValorPago: TLabel;
    edtValPago: TEdit;
    lblNomeUser: TLabel;
    edtUser: TEdit;
    lblVlDesc: TLabel;
    edtValDesc: TEdit;
    lblObsPag: TLabel;
    edtObsPag: TEdit;
    pnlInfopag: TPanel;
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibirCPDetalhes(IDCp : integer);
  end;

var
  frmCpDetalhe: TfrmCpDetalhe;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCPagar,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe,
  SistemaFinanceiro.Model.Entidades.CP, SistemaFinanceiro.Utilitarios;

{ TfrmCpDetalhe }

procedure TfrmCpDetalhe.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCpDetalhe.ExibirCPDetalhes(IDCp: integer);
var
  Cp          : TModelCp;
  CpDet       : TModelCpDetalhe;
  SQL         : String;
  SqlPgto     : String;
  SQLParciais : String;

begin

  if IDCp <= 0 then
  begin
    raise Exception.Create('ID do contas a pagar inválido!');
  end;

  Cp := dmCPagar.GetCp(IDCp);

  try

    if Cp.ID.IsEmpty then
    begin
      raise Exception.Create('Conta a pagar não encontrado!');
    end;

    //  Carrega os dados da CR
    if Cp.Doc <> '' then
    begin
      lblNumDoc.Caption := Cp.Doc;
    end
      else
      begin
        lblNumDoc.Caption := 'Não Informado';
      end;

    lblDesc.Caption         := Cp.Desc;
    lblVencimento.Caption   := FormatDateTime('DD/MM/YYYY', Cp.DataVencimento);
    lblNumParcela.Caption   := IntToStr(Cp.Parcela);
    lblValorCompra.Caption  := TUtilitario.FormatoMoeda(Cp.ValorCompra);
    lblValorParcela.Caption := TUtilitario.FormatoMoeda(Cp.ValorParcela);
    lblCodFornec.Caption    := IntToStr(Cp.IdFornecedor);

  finally

    Cp.Free;

  end;


  CpDet := dmCPagar.GetCpDet(IDCp);

  try

    edtDtPag.Text   := FormatDateTime('DD/MM/YYYY', CpDet.Data);
    edtValPago.Text := TUtilitario.FormatoMoeda(CpDet.Valor);
    edtValDesc.Text := TUtilitario.FormatoMoeda(CpDet.ValorDesc);
    edtUser.Text    := CpDet.Usuario;
    edtObsPag.Text  := CpDet.Detalhes;

  finally
    CpDet.Free;
  end;

  //  Montando o SQL dos pagamentos
  SqlPgto := 'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CP PG ' +
             'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR ' +
             'WHERE PG.ID_CP = :IDCP';

  dmCPagar.FDQueryPgtoCp.Close;
  dmCPagar.FDQueryPgtoCp.SQL.Clear;
  dmCPagar.FDQueryPgtoCp.Params.Clear;
  dmCPagar.FDQueryPgtoCp.SQL.Add(SqlPgto);

  dmCPagar.FDQueryPgtoCp.ParamByName('IDCP').AsInteger := IDCp;
  dmCPagar.FDQueryPgtoCp.Prepare;
  dmCPagar.FDQueryPgtoCp.Open();


  //  Montando o SQL das Parciais
  SQLParciais := 'SELECT * FROM CONTAS_PAGAR WHERE PARCIAL = ''S'' ' +
                 ' AND CP_ORIGEM = :IDCP';

  dmCPagar.FDQueryCpParciais.Close;
  dmCPagar.FDQueryCpParciais.SQl.Clear;
  dmCPagar.FDQueryCpParciais.Params.Clear;
  dmCPagar.FDQueryCpParciais.SQL.Add(SQLParciais);

  dmCPagar.FDQueryCpParciais.ParamByName('IDCP').AsInteger := IDCp;
  dmCPagar.FDQueryCpParciais.Prepare;
  dmCPagar.FDQueryCpParciais.Open;


  //  Se não exisitir nenhuma CP Parcial ira ocultar
  //  O grid das parciais e diminuir a altura da tela
  if dmCPagar.FDQueryCpParciais.IsEmpty then
  begin

    lblParciais.Visible    := False;
    DBGridParciais.Visible := False;

    frmCpDetalhe.Height := 570;

  end;


end;



end.
