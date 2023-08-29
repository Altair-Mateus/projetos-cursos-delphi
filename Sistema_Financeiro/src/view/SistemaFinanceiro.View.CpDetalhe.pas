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
    btnSair: TButton;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
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
    procedure btnSairClick(Sender: TObject);
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

procedure TfrmCpDetalhe.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCpDetalhe.ExibirCPDetalhes(IDCp: integer);
var
  Cp : TModelCp;
  SQL : String;
  SqlPgto : String;

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

  //  Montando o SQL
  SQL := 'SELECT * FROM CONTAS_PAGAR_DETALHE CP' +
         ' LEFT JOIN USUARIOS US ON CP.USUARIO = US.ID ' +
         ' WHERE ID_CONTA_PAGAR = :IDCP';



  dmCPagar.FDQueryCpDetalhes.Close;
  dmCPagar.FDQueryCpDetalhes.SQL.Clear;
  dmCPagar.FDQueryCpDetalhes.Params.Clear;
  dmCPagar.FDQueryCpDetalhes.SQL.Add(SQL);

  dmCPagar.FDQueryCpDetalhes.ParamByName('IDCP').AsInteger := IDCp;
  dmCPagar.FDQueryCpDetalhes.Prepare;
  dmCPagar.FDQueryCpDetalhes.Open();


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


end;



end.
