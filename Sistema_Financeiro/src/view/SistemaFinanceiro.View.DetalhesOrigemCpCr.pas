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
    edtDataCompraVenda: TEdit;
    edtDtVenc: TEdit;
    dsPagamentos: TDataSource;
    DBGridPgto: TDBGrid;
    lblFrPgto: TLabel;
    memObsPag: TMemo;
    lblDetBx: TLabel;
    edtUser: TEdit;
    lblNomeUser: TLabel;
    edtDtPag: TEdit;
    lblDtPag: TLabel;
    edtValPago: TEdit;
    lblValorPago: TLabel;
    edtValorDesc: TEdit;
    lblValDesco: TLabel;
    lblParciais: TLabel;
    DBGridParciais: TDBGrid;
    dsParciais: TDataSource;
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

uses
  SistemaFinanceiro.Model.Entidades.CP, SistemaFinanceiro.Model.Entidades.CR,
  SistemaFinanceiro.Model.dmCPagar, SistemaFinanceiro.Model.dmCReceber,
  SistemaFinanceiro.Model.dmClientes, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Utilitarios, SistemaFinanceiro.Model.Entidades.CP.Detalhe,
  SistemaFinanceiro.Model.Entidades.CR.Detalhe,
  SistemaFinanceiro.Model.dmFaturaCartao;

procedure TfrmDetalhesOrigemCpCr.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDetalhesOrigemCpCr.CarregaDados(Id: Integer; Origem: String);
var
  Cp          : TModelCp;
  Cr          : TModelCr;
  CpDet       : TModelCpDetalhe;
  CrDet       : TModelCrDetalhe;
  SQLPgto     : String;
  SQLParciais : String;

begin

  //  Validações
  if Id <= 0 then
  begin
    raise Exception.Create('ID do contas a pagar inválido!');
  end;

  if (Origem <> 'CR') and (Origem <> 'CP') then
  begin
    raise Exception.Create('Origem inválida!');
  end;


  if Origem = 'CR' then
  begin

    //  Atualiza titulo
    pnlTitulo.Caption := 'Detalhes do lançamento no Caixa do Contas a Receber';

    Cr    := dmCReceber.GetCR(Id);
    CrDet := dmCReceber.GetCrDet(Id);

    try

      if Cr.ID.IsEmpty then
      begin
        raise Exception.Create('Conta a receber não encontrada!');
      end;

      //  Carrega os dados
      edtCod.Text       := Cr.ID;
      edtForCli.Text    := IntToStr(Cr.IdCliente) + ' - ' + dmClientes.GetNomeCliente(IntToStr(Cr.IdCliente));
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
      edtDtPag.Text     := FormatDateTime('DD/MM/YYYY', CrDet.Data);
      edtValPago.Text   := TUtilitario.FormatoMoeda(CrDet.Valor);
      edtValorDesc.Text := TUtilitario.FormatoMoeda(CrDet.ValorDesc);
      edtUser.Text      := CrDet.Usuario;
      memObsPag.Text    := CrDet.Detalhes;


      //  Montando o SQL dos pagamentos
      SQLPgto := 'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CR PG ' +
                 'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR ' +
                 ' WHERE ID_CR = :IDCR';

      dmCReceber.FDQueryPgtoCr.Close;
      dmCReceber.FDQueryPgtoCr.SQL.Clear;
      dmCReceber.FDQueryPgtoCr.Params.Clear;
      dmCReceber.FDQueryPgtoCr.SQL.Add(SQLPgto);

      dmCReceber.FDQueryPgtoCr.ParamByName('IDCR').AsInteger := Id;
      dmCReceber.FDQueryPgtoCr.Prepare;
      dmCReceber.FDQueryPgtoCr.Open();

      //  Definindo o dataset do datasource
      dsPagamentos.DataSet := dmCReceber.FDQueryPgtoCr;



      //  Montando SQL das Parciais
      SQLParciais := 'SELECT * FROM CONTAS_RECEBER WHERE PARCIAL = ''S'' ' +
                      ' AND CR_ORIGEM = :IDCR';

      dmCReceber.FDQueryCrParciais.Close;
      dmCReceber.FDQueryCrParciais.SQL.Clear;
      dmCReceber.FDQueryCrParciais.Params.Clear;
      dmCReceber.FDQueryCrParciais.SQL.Add(SQLParciais);

      dmCReceber.FDQueryCrParciais.ParamByName('IDCR').AsInteger := Id;
      dmCReceber.FDQueryCrParciais.Prepare;
      dmCReceber.FDQueryCrParciais.Open;


      //  Se não exisitir nenhuma CR Parcial ira ocultar
      //  O grid das parciais
      if dmCReceber.FDQueryCrParciais.IsEmpty then
      begin

        lblParciais.Visible    := False;
        DBGridParciais.Visible := False;
      end;

       //  Definindo o dataset do datasource
       dsParciais.DataSet := dmCReceber.FDQueryCrParciais;

    finally

      Cr.Free;
      CrDet.Free;

    end;

  end
  else if Origem = 'CP' then
       begin

        //  Atualiza titulo
        pnlTitulo.Caption := 'Detalhes do lançamento no Caixa do Contas a Pagar';

        Cp    := dmCPagar.GetCP(Id);
        CpDet := dmCPagar.GetCpDet(Id);

        try

          if Cp.ID.IsEmpty then
          begin
            raise Exception.Create('Conta a receber não encontrada!');
          end;

          //  Carrega os dados
          edtCod.Text       := Cp.ID;
          edtForCli.Text    := IntToStr(Cp.IdFornecedor) + ' - ' + dmFornecedores.GetNomeFornecedor(IntToStr(Cp.IdFornecedor));
          lblForCli.Caption := 'Fornecedor';

          if Cp.Doc <> '' then
            edtNDoc.Text := Cp.Doc
          else
            edtNDoc.Text := 'Não Informado';

          edtDataCompraVenda.Text := FormatDateTime('DD/MM/YYYY', Cp.DataCompra);
          lblData.Caption         := 'Data da Compra';

          memDesc.Text   := Cp.Desc;
          edtValor.Text  := TUtilitario.FormatoMoeda(Cp.ValorParcela);
          edtDtVenc.Text := FormatDateTime('DD/MM/YYYY', Cp.DataVencimento);

          if Cp.IdFatCartao > 0 then
          begin

            lblFatCartao.Visible := True;
            edtFatCartao.Visible := True;
            edtFatCartao.Text    := IntToStr(Cp.IdFatCartao) + ' - ' + dmFaturaCartao.GetNomeFatCartao(IntToStr(Cp.IdFatCartao));

          end
          else
          begin
             lblFatCartao.Visible := False;
             edtFatCartao.Visible := False;
          end;


          //  Pegando dados dos detalhes da baixa
          edtDtPag.Text     := FormatDateTime('DD/MM/YYYY', CpDet.Data);
          edtValPago.Text   := TUtilitario.FormatoMoeda(CpDet.Valor);
          edtValorDesc.Text := TUtilitario.FormatoMoeda(CpDet.ValorDesc);
          edtUser.Text      := CpDet.Usuario;
          memObsPag.Text    := CpDet.Detalhes;


          //  Montando o SQL dos pagamentos
          SqlPgto := 'SELECT PG.*, FR.NOME_FR FROM PGTO_BX_CP PG ' +
                     'LEFT JOIN FR_PGTO FR ON PG.ID_FR_PGTO = FR.ID_FR ' +
                     'WHERE PG.ID_CP = :IDCP';

          dmCPagar.FDQueryPgtoCp.Close;
          dmCPagar.FDQueryPgtoCp.SQL.Clear;
          dmCPagar.FDQueryPgtoCp.Params.Clear;
          dmCPagar.FDQueryPgtoCp.SQL.Add(SqlPgto);

          dmCPagar.FDQueryPgtoCp.ParamByName('IDCP').AsInteger := Id;
          dmCPagar.FDQueryPgtoCp.Prepare;
          dmCPagar.FDQueryPgtoCp.Open();

          //  Definindo o dataset do datasource
          dsPagamentos.DataSet := dmCPagar.FDQueryPgtoCp;


          //  Montando o SQL das Parciais
          SQLParciais := 'SELECT * FROM CONTAS_PAGAR WHERE PARCIAL = ''S'' ' +
                         ' AND CP_ORIGEM = :IDCP';

          dmCPagar.FDQueryCpParciais.Close;
          dmCPagar.FDQueryCpParciais.SQl.Clear;
          dmCPagar.FDQueryCpParciais.Params.Clear;
          dmCPagar.FDQueryCpParciais.SQL.Add(SQLParciais);

          dmCPagar.FDQueryCpParciais.ParamByName('IDCP').AsInteger := Id;
          dmCPagar.FDQueryCpParciais.Prepare;
          dmCPagar.FDQueryCpParciais.Open;


          //  Se não exisitir nenhuma CP Parcial ira ocultar
          //  O grid das parciais
          if dmCPagar.FDQueryCpParciais.IsEmpty then
          begin

            lblParciais.Visible    := False;
            DBGridParciais.Visible := False;

          end;

          //  Definindo o dataset do datasource
          dsParciais.DataSet := dmCPagar.FDQueryCpParciais;

        finally

          Cp.Free;
          CpDet.Free;

        end;

       end;

end;

end.
