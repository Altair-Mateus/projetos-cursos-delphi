unit SistemaFinanceiro.Model.dmCPagar;
interface
uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, SistemaFinanceiro.Model.Entidades.CP,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe, Vcl.Dialogs;
type
  TdmCPagar = class(TDataModule)
    FDQueryCPagar: TFDQuery;
    DataSetProviderCPagar: TDataSetProvider;
    cdsCPagar: TClientDataSet;
    cdsCPagarID: TIntegerField;
    cdsCPagarNUMERO_DOC: TWideStringField;
    cdsCPagarDESCRICAO: TWideStringField;
    cdsCPagarPARCELA: TIntegerField;
    cdsCPagarDATA_COMPRA: TDateField;
    cdsCPagarDATA_CADASTRO: TDateField;
    cdsCPagarDATA_VENCIMENTO: TDateField;
    cdsCPagarDATA_PAGAMENTO: TDateField;
    cdsCPagarSTATUS: TWideStringField;
    FDQueryCpDetalhes: TFDQuery;
    FDQueryCpDetalhesID: TIntegerField;
    FDQueryCpDetalhesID_CONTA_PAGAR: TIntegerField;
    FDQueryCpDetalhesDETALHES: TWideStringField;
    FDQueryCpDetalhesDATA: TDateField;
    FDQueryCpDetalhesNOME: TWideStringField;
    cdsCPagarPARCIAL: TWideStringField;
    cdsCPagarCP_ORIGEM: TIntegerField;
    cdsCPagarID_FORNECEDOR: TIntegerField;
    cdsCPagarRAZAO_SOCIALFORNEC: TWideStringField;
    FDQueryPgtoCp: TFDQuery;
    FDQueryPgtoCpID: TIntegerField;
    FDQueryPgtoCpID_CP: TIntegerField;
    FDQueryPgtoCpID_FR_PGTO: TIntegerField;
    FDQueryPgtoCpNR_FR: TIntegerField;
    FDQueryPgtoCpDATA_HORA: TSQLTimeStampField;
    FDQueryPgtoCpNOME_FR: TWideStringField;
    FDQueryCpDetalhesDESCONTO_BX: TBCDField;
    cdsCPagarVALOR_PARCELA: TBCDField;
    cdsCPagarVALOR_COMPRA: TBCDField;
    cdsCPagarVALOR_ABATIDO: TBCDField;
    FDQueryCpDetalhesVALOR: TBCDField;
    FDQueryPgtoCpVALOR_PAGO: TBCDField;
    FDQueryCpDetalhesUSUARIO: TIntegerField;
    cdsCPagarFATURA_CART: TWideStringField;
    cdsCPagarID_FATURA: TIntegerField;
    FDQueryBxMultipla: TFDQuery;
    FDQueryBxMultiplaID: TIntegerField;
    FDQueryBxMultiplaNUMERO_DOC: TWideStringField;
    FDQueryBxMultiplaDESCRICAO: TWideStringField;
    FDQueryBxMultiplaPARCELA: TIntegerField;
    FDQueryBxMultiplaVALOR_PARCELA: TBCDField;
    FDQueryBxMultiplaVALOR_COMPRA: TBCDField;
    FDQueryBxMultiplaVALOR_ABATIDO: TBCDField;
    FDQueryBxMultiplaDATA_COMPRA: TDateField;
    FDQueryBxMultiplaDATA_CADASTRO: TDateField;
    FDQueryBxMultiplaDATA_VENCIMENTO: TDateField;
    FDQueryBxMultiplaDATA_PAGAMENTO: TDateField;
    FDQueryBxMultiplaSTATUS: TWideStringField;
    FDQueryBxMultiplaPARCIAL: TWideStringField;
    FDQueryBxMultiplaCP_ORIGEM: TIntegerField;
    FDQueryBxMultiplaID_FORNECEDOR: TIntegerField;
    FDQueryBxMultiplaFATURA_CART: TWideStringField;
    FDQueryBxMultiplaID_FATURA: TIntegerField;
    FDQueryBxMultiplaRAZAO_SOCIAL: TWideStringField;
    procedure cdsCPagarSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GeraCodigoCPDetalhe : Integer;
    procedure BaixarCP(BaixaCP : TModelCpDetalhe);
    function GetCP(Id : Integer) : TModelCP;

    function TotalCP(DataInicial, DataFinal : TDate) : Currency;

  end;
var
  dmCPagar: TdmCPagar;
implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
uses SistemaFinanceiro.Model.udmDados,
  SistemaFinanceiro.Model.Entidades.LancamentoCaixa,
  SistemaFinanceiro.Model.dmCaixa;
{$R *.dfm}

{ TDataModuleCPagar }

procedure TdmCPagar.BaixarCP(BaixaCP: TModelCpDetalhe);
var
  ContaPagar : TModelCP;
  FDQueryCP : TFDQuery;
  FDQueryCpDet : TFDQuery;
  FDQueryCaixa : TFDQuery;
  SQLUpdate : String;
  SQLInsert : String;
  LancarCaixa : TModelLancamentoCaixa;
  CodlancCaixa : String;

begin

  ContaPagar   := GetCP(BaixaCP.IdCP);
  FDQueryCP    := TFDQuery.Create(nil);
  FDQueryCpDet := TFDQuery.Create(nil);
  FDQueryCaixa := TFDQuery.Create(nil);

  try

    //  Estabelece conexão com o banco
    FDQueryCP.Connection    := DataModule1.FDConnection;
    FDQueryCpDet.Connection := DataModule1.FDConnection;
    FDQueryCaixa.Connection := DataModule1.FDConnection;

    if ContaPagar.ID = '' then
    begin
      raise Exception.Create('Conta a pagar não encontrada!');
    end;

    ContaPagar.ValorAbatido := ContaPagar.ValorAbatido + BaixaCP.Valor;

    //  Caso o valor abatido já seja igual ao valor da parcela
    if ContaPagar.ValorAbatido >= ContaPagar.ValorParcela then
    begin
      ContaPagar.Status := 'P';
      ContaPagar.DataPagamento := BaixaCP.Data;
    end;

    try

      //  Se o valor da parcela - o valor pago for diferente do valor
      //  de desconto irá gerar uma parcial
      if (ContaPagar.ValorParcela - BaixaCP.Valor) <> BaixaCP.ValorDesc then
      begin

        //  Inseriando nova duplcata parcial
        if not (cdsCPagar.State in [dsInsert, dsEdit]) then
        begin
          //  Colocando o data set em modo de inserção de dados
          cdsCPagar.Insert;
        end;

        //  gera a id
        GeraCodigo;
        cdsCPagarDATA_CADASTRO.AsDateTime := now;
        cdsCPagarSTATUS.AsString          := 'A';
        cdsCPagarVALOR_ABATIDO.AsCurrency := 0;


        //  Passando os dados para o dataset
        if (ContaPagar.Doc = '') or (ContaPagar.Parcial = 'S' ) then
        begin
          cdsCPagarNUMERO_DOC.AsString := ContaPagar.Doc;
        end
        else
        begin
          cdsCPagarNUMERO_DOC.AsString  := Format('%s-P', [ContaPagar.Doc]);
        end;

        cdsCPagarDESCRICAO.AsString         := Format('Parcial - Restante da Conta ID Nº %s - Doc Nº %s', [ContaPagar.ID, ContaPagar.Doc]);
        cdsCPagarVALOR_COMPRA.AsCurrency    := ContaPagar.ValorCompra;
        cdsCPagarDATA_COMPRA.AsDateTime     := ContaPagar.DataCompra;
        cdsCPagarPARCELA.AsInteger          := ContaPagar.Parcela;
        cdsCPagarVALOR_PARCELA.AsCurrency   := ((ContaPagar.ValorParcela - BaixaCP.Valor) - BaixaCP.ValorDesc);
        cdsCPagarDATA_VENCIMENTO.AsDateTime := ContaPagar.DataVencimento;
        cdsCPagarPARCIAL.AsString           := 'S';
        cdsCPagarCP_ORIGEM.AsString         := ContaPagar.ID;
        cdsCPagarID_FORNECEDOR.AsInteger    := ContaPagar.IdFornecedor;
        cdsCPagarFATURA_CART.AsString       := ContaPagar.FatCartao;
        cdsCPagarID_FATURA.AsInteger        := ContaPagar.IdFatCartao;

        //  Gravando no BD
        cdsCPagar.Post;
        cdsCPagar.ApplyUpdates(0);

      end;


      //  Montando o SQL para atualizar a conta baixada
      SQLUpdate := 'UPDATE CONTAS_PAGAR SET VALOR_ABATIDO = :VALORABATIDO, ' +
                ' VALOR_PARCELA = :VALORPARCELA, STATUS = :STATUS, ' +
                ' DATA_PAGAMENTO = :DATAPGTO' +
                ' WHERE ID = :IDCP; ';

      FDQueryCP.Close;
      FDQueryCP.SQL.Clear;
      FDQueryCP.SQL.Add(SQLUpdate);

      FDQueryCP.ParamByName('VALORABATIDO').AsCurrency := ContaPagar.ValorAbatido;
      FDQueryCP.ParamByName('VALORPARCELA').AsCurrency := ContaPagar.ValorParcela;
      FDQueryCP.ParamByName('STATUS').AsString         := 'P';
      FDQueryCP.ParamByName('DATAPGTO').AsDate         := BaixaCP.Data;
      FDQueryCP.ParamByName('IDCP').AsString           := ContaPagar.ID;

      FDQueryCP.Prepare;
      FDQueryCP.ExecSQL;



      //  Montando o SQL para persisitr os dados na tabela Contas_pagar_detalhe
      SQLInsert := 'INSERT INTO CONTAS_PAGAR_DETALHE (ID, ID_CONTA_PAGAR, DETALHES, ' +
                   ' VALOR, DATA, USUARIO, DESCONTO_BX) VALUES (:ID, :IDCP, :DETALHES, :VALOR, ' +
                   ' :DATA, :USUARIO, :DESC)';

      FDQueryCpDet.SQL.Add(SQLInsert);
      FDQueryCpDet.ParamByName('ID').AsInteger      := GeraCodigoCPDetalhe;
      FDQueryCpDet.ParamByName('IDCP').AsInteger    := BaixaCP.IdCP;
      FDQueryCpDet.ParamByName('DETALHES').AsString := BaixaCP.Detalhes;
      FDQueryCpDet.ParamByName('VALOR').AsCurrency  := BaixaCP.Valor;
      FDQueryCpDet.ParamByName('DATA').AsDate       := BaixaCP.Data;
      FDQueryCpDet.ParamByName('USUARIO').AsString  := BaixaCP.Usuario;
      FDQueryCpDet.ParamByName('DESC').AsCurrency   := BaixaCP.ValorDesc;

      FDQueryCpDet.Prepare;
      FDQueryCpDet.ExecSQL;

      //  Lançando a baixa no caixa
      LancarCaixa := TModelLancamentoCaixa.Create;
      try

        LancarCaixa.ID           := dmCaixa.GeraId;
        LancarCaixa.NumDoc       := ContaPagar.Doc;
        LancarCaixa.Desc         := Format('Baixa Conta ID Nº %s Pagar - Nº Documento: %s - Parcela: %d', [ContaPagar.ID, contaPagar.Doc, ContaPagar.Parcela]);
        LancarCaixa.Valor        := BaixaCP.Valor;
        LancarCaixa.Tipo         := 'D';
        LancarCaixa.DataCadastro := BaixaCP.Data;
        LancarCaixa.Origem       := 'CP';
        LancarCaixa.IdOrigem     := StrToInt(ContaPagar.ID);

        try

          DataModule1.FDConnection.StartTransaction;

          try

            dmCaixa.GravarLancamento(LancarCaixa, FDQueryCaixa);
            DataModule1.FDConnection.Commit;

          except

            DataModule1.FDConnection.Rollback;
            raise;

          end;
        finally

          FDQueryCaixa.Close;
          FDQueryCaixa.Free;  

        end;

      finally

        LancarCaixa.Free;

      end;


    finally

      FDQueryCP.Close;
      FDQueryCP.Free;
      FDQueryCpDet.Close;
      FDQueryCpDet.Free;

    end;

  finally

    ContaPagar.Free;

  end;

end;

procedure TdmCPagar.cdsCPagarSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

  if Sender.AsString = 'A' then
  begin
    Text := 'ABERTA';
  end
  else if Sender.AsString = 'P' then
       begin
         Text := 'PAGA';
       end
       else if Sender.AsString = 'C' then
            begin
              Text := 'CANCELADA';
            end;


end;

procedure TdmCPagar.GeraCodigo;
var
  FDQueryId : TFDQuery;
  cod : integer;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryId.Connection := DataModule1.FDConnection;
    FDQueryId.Close;
    FDQueryId.SQL.Clear;
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CONTAS_PAGAR');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;
    cdsCPagarid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally
    FDQueryId.Close;
    FDQueryId.Free;
  end;

end;

function TdmCPagar.GeraCodigoCPDetalhe: Integer;
var
  FDQueryIdDet : TFDQuery;

begin

  Result := 0;
  FDQueryIdDet := TFDQuery.Create(nil);

  try
    //  Estabelece a conexao com o banco
    FDQueryIdDet.Connection := DataModule1.FDConnection;

    FDQueryIdDet.Close;
    FDQueryIdDet.SQL.Clear;
    FDQueryIdDet.Open('SELECT MAX(ID) AS ID FROM CONTAS_PAGAR_DETALHE');

    //  Ultimo codigo usado + 1
    Result := FDQueryIdDet.FieldByName('ID').AsInteger + 1;

    //  Insere o registro no final da tabela
    FDQueryIdDet.Append;

  finally
    FDQueryIdDet.Close;
    FDQueryIdDet.Free;
  end

end;

function TdmCPagar.GetCP(Id: Integer): TModelCP;
var
  FDQueryCP : TFDQuery;

begin

  FDQueryCP := TFDQuery.Create(Nil);

  try

    //  Estabelece a conexão
    FDQueryCP.Connection := DataModule1.FDConnection;

    FDQueryCP.Close;
    FDQueryCP.SQL.Clear;
    FDQueryCP.SQL.Add('SELECT * FROM CONTAS_PAGAR WHERE ID = :ID');
    FDQueryCP.ParamByName('ID').AsInteger := Id;
    FDQueryCP.Open;

    Result := TModelCP.Create;

    try

      Result.ID             := FDQueryCP.FieldByName('ID').AsString;
      Result.Doc            := FDQueryCP.FieldByName('NUMERO_DOC').AsString;
      Result.Desc           := FDQueryCP.FieldByName('DESCRICAO').AsString;
      Result.Parcela        := FDQueryCP.FieldByName('PARCELA').AsInteger;
      Result.ValorParcela   := FDQueryCP.FieldByName('VALOR_PARCELA').AsCurrency;
      Result.ValorCompra    := FDQueryCP.FieldByName('VALOR_COMPRA').AsCurrency;
      Result.ValorAbatido   := FDQueryCP.FieldByName('VALOR_ABATIDO').AsCurrency;
      Result.DataCompra     := FDQueryCP.FieldByName('DATA_COMPRA').AsDateTime;
      Result.DataCadastro   := FDQueryCP.FieldByName('DATA_CADASTRO').AsDateTime;
      Result.DataVencimento := FDQueryCP.FieldByName('DATA_VENCIMENTO').AsDateTime;
      Result.DataPagamento  := FDQueryCP.FieldByName('DATA_PAGAMENTO').AsDateTime;
      Result.Status         := FDQueryCP.FieldByName('STATUS').AsString;
      Result.Parcial        := FDQueryCP.FieldByName('PARCIAL').AsString;
      Result.CpOrigem       := FDQueryCP.FieldByName('CP_ORIGEM').AsInteger;
      Result.IdFornecedor   := FDQueryCP.FieldByName('ID_FORNECEDOR').AsInteger;
      Result.FatCartao      := FDQueryCP.FieldByName('FATURA_CART').AsString;
      Result.IdFatCartao    := FDQueryCP.FieldByName('ID_FATURA').AsInteger;

    except
      Result.Free;
      raise;
    end;

  finally
    FDQueryCP.Close;
    FDQueryCP.Free;
  end;

end;

function TdmCPagar.TotalCP(DataInicial, DataFinal: TDate): Currency;
var
  FDQueryTotalCP : TFDQuery;

begin

  Result := 0;
  FDQueryTotalCP := TFDQuery.Create(nil);

  try

    //  Estabele a conexão com o banco
    FDQueryTotalCP.Connection := DataModule1.FDConnection;

    FDQueryTotalCP.Close;
    FDQueryTotalCP.SQL.Clear;
    FDQueryTotalCP.SQL.Add('SELECT COALESCE(SUM(VALOR_PARCELA), 0) AS VALOR FROM CONTAS_PAGAR ');
    FDQueryTotalCP.SQL.Add(' WHERE STATUS = ''A'' AND DATA_VENCIMENTO BETWEEN :DATA_INICIAL AND :DATA_FINAL ');

    FDQueryTotalCP.ParamByName('DATA_INICIAL').AsDate := DataInicial;
    FDQueryTotalCP.ParamByName('DATA_FINAL').AsDate := DataFinal;

    FDQueryTotalCP.Open;

    Result := FDQueryTotalCP.FieldByName('VALOR').AsCurrency;


  finally

    FDQueryTotalCP.Close;
    FDQueryTotalCP.Free;

  end;

end;

end.
