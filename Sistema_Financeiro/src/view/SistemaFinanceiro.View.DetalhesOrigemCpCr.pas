unit SistemaFinanceiro.View.DetalhesOrigemCpCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDetalhesOrigemCpCr = class(TForm)
    pnlPrincipal: TPanel;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    ImageList1: TImageList;
    btnSair: TButton;
    pnlInfo: TPanel;
    lblDesc: TLabel;
    memDesc: TMemo;
    lblValor: TLabel;
    edtValor: TEdit;
    lblData: TLabel;
    lblNDoc: TLabel;
    edtNDoc: TEdit;
    lblForCli: TLabel;
    edtForCli: TEdit;
    lblFatCartao: TLabel;
    edtFatCartao: TEdit;
    lblCod: TLabel;
    edtCod: TEdit;
    lblVencimento: TLabel;
    lblDtPag: TLabel;
    edtDataCompraVenda: TEdit;
    edtDtVenc: TEdit;
    edtDtPag: TEdit;
    lblValorPago: TLabel;
    edtValPago: TEdit;
    memObsPag: TMemo;
    lblDetBx: TLabel;
    edtUser: TEdit;
    lblNomeUser: TLabel;
    lblFrPgto: TLabel;
    DBGridPgto: TDBGrid;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados(Id: Integer; Origem: String);

  end;

var
  frmDetalhesOrigemCpCr: TfrmDetalhesOrigemCpCr;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.Entidades.CP, SistemaFinanceiro.Model.Entidades.CR,
  SistemaFinanceiro.Model.dmCPagar, SistemaFinanceiro.Model.dmCReceber,
  SistemaFinanceiro.Model.dmClientes, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Utilitarios;

procedure TfrmDetalhesOrigemCpCr.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDetalhesOrigemCpCr.CarregaDados(Id: Integer; Origem: String);
var
  Cp : TModelCp;
  Cr : TModelCr;
  SQLDet : String;
  SQLPag : String;

begin

  //  Validações
  if Id <= 0 then
  begin
    raise Exception.Create('ID do contas a pagar inválido!');
  end;

  if (Origem <> 'CR') or (Origem <> 'CP') then
  begin
    raise Exception.Create('Origem inválida!');
  end;


  if Origem = 'CR' then
  begin

    //  Atualiza titulo
    pnlTitulo.Caption := 'Detalhes do lançamento no Caixa do Contas a Receber';

    Cr := dmCReceber.GetCR(Id);

    try

      if Cr.ID.IsEmpty then
      begin
        raise Exception.Create('Conta a receber não encontrada!');
      end;

      //  Carrega os dados
      edtCod.Text       := Cr.ID;
      edtForCli.Text    := IntToStr(Cr.IdCliente) + dmClientes.GetNomeCliente(IntToStr(Cr.IdCliente));
      lblForCli.Caption := 'Cliente';

      if Cr.Doc <> '' then
        edtNDoc.Text := Cr.Doc
      else
        edtNDoc.Text := 'Não Informado';

      edtDataCompraVenda.Text := FormatDateTime('DD/MM/YYYY', Cr.DataVenda);
      lblData.Caption         := 'Data da Venda';

      memDesc.Text   := Cr.Desc;
      edtValor.Text  := TUtilitario.FormatoMoeda(Cr.ValorParcela);
      edtDtVenc.Text := FormatDateTime('DD/MM/YYYY', Cr.DataVencimento);

      lblFatCartao.Visible := False;
      edtFatCartao.Visible := False;

      //  Pegando dados dos detalhes da baixa
      SQLDet := 'SELECT * FROM CONTAS_RECEBER_DETALHE CR' +
                ' LEFT JOIN USUARIOS US ON CR.USUARIO = US.ID ' +
                ' WHERE ID_CONTA_RECEBER = :IDCR';

      dmCReceber.FDQueryCrDetalhe.Close;
      dmCReceber.FDQueryCrDetalhe.SQL.Clear;
      dmCReceber.FDQueryCrDetalhe.Params.Clear;
      dmCReceber.FDQueryCrDetalhe.SQL.Add(SQLDet);

      dmCPagar.FDQueryCpDetalhes.ParamByName('IDCR').AsInteger := Id;
      dmCPagar.FDQueryCpDetalhes.Prepare;
      dmCPagar.FDQueryCpDetalhes.Open();

      edtUser.Text := dmCPagar.FDQueryCpDetalhesNOME.AsString;




//      //  Montando o SQL dos pagamentos
//      SqlPgto := 'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CP PG ' +
//                 'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR ' +
//                 'WHERE PG.ID_CP = :IDCP';
//
//      dmCPagar.FDQueryPgtoCp.Close;
//      dmCPagar.FDQueryPgtoCp.SQL.Clear;
//      dmCPagar.FDQueryPgtoCp.Params.Clear;
//      dmCPagar.FDQueryPgtoCp.SQL.Add(SqlPgto);
//
//      dmCPagar.FDQueryPgtoCp.ParamByName('IDCP').AsInteger := IDCp;
//      dmCPagar.FDQueryPgtoCp.Prepare;
//      dmCPagar.FDQueryPgtoCp.Open();

    finally

    end;

  end;

end;

end.
