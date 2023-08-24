unit SistemaFinanceiro.Model.dmCReceber;
interface
uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  SistemaFinanceiro.Model.Entidades.CR.Detalhe,
  SistemaFinanceiro.Model.Entidades.CR, Vcl.Dialogs;

type
  TdmCReceber = class(TDataModule)
    FDQueryCReceber: TFDQuery;
    cdsCReceber: TClientDataSet;
    DataSetProviderCReceber: TDataSetProvider;
    cdsCReceberID: TIntegerField;
    cdsCReceberNUMERO_DOCUMENTO: TWideStringField;
    cdsCReceberDESCRICAO: TWideStringField;
    cdsCReceberPARCELA: TIntegerField;
    cdsCReceberVALOR_PARCELA: TFMTBCDField;
    cdsCReceberVALOR_VENDA: TFMTBCDField;
    cdsCReceberVALOR_ABATIDO: TFMTBCDField;
    cdsCReceberDATA_CADASTRO: TDateField;
    cdsCReceberDATA_VENCIMENTO: TDateField;
    cdsCReceberDATA_RECEBIMENTO: TDateField;
    cdsCReceberSTATUS: TWideStringField;
    cdsCReceberDATA_VENDA: TDateField;
    FDQueryCrDetalhe: TFDQuery;
    FDQueryCrDetalheID: TIntegerField;
    FDQueryCrDetalheID_CONTA_RECEBER: TIntegerField;
    FDQueryCrDetalheDETALHES: TWideStringField;
    FDQueryCrDetalheVALOR: TFMTBCDField;
    FDQueryCrDetalheDATA: TDateField;
    FDQueryCrDetalheUSUARIO: TWideStringField;
    FDQueryCrDetalheNOME: TWideStringField;
    cdsCReceberPARCIAL: TWideStringField;
    cdsCReceberCR_ORIGEM: TIntegerField;
    cdsCReceberID_CLIENTE: TIntegerField;
    cdsCReceberNOME: TWideStringField;
    FDQueryCrDetalheDESCONTO_BX: TIntegerField;
    FDQueryCrDetalheJUROS_BX: TIntegerField;
    procedure cdsCReceberSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure GeraCodigo;
    function GeraCodigoCRDetalhe : Integer;
    procedure BaixarCR(BaixaCR : TModelCrDetalhe);
    function GetCR(Id : Integer) : TModelCR;
    function TotalCR(DataInicial, DataFinal: TDate): Currency;

  end;

var
  dmCReceber: TdmCReceber;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados,
  SistemaFinanceiro.Model.Entidades.LancamentoCaixa,
  SistemaFinanceiro.Model.dmCaixa;
{$R *.dfm}
{ TdmCReceber }

procedure TdmCReceber.BaixarCR(BaixaCR: TModelCrDetalhe);
var
  ContaReceber : TModelCR;
  FDQueryCR : TFDQuery;
  FDQueryCrDet : TFDQuery;
  SQLUpdate : String;
  SQLInsert : String;
  LancarCaixa : TModelLancamentoCaixa;
  FDQueryCaixa : TFDQuery;

begin
  ContaReceber := GetCR(BaixaCR.IdCR);
  FDQueryCR := TFDQuery.Create(nil);
  FDQueryCrDet := TFDQuery.Create(nil);
  FDQueryCaixa := TFDQuery.Create(nil);

  try
    //  Estabelece conexão com o banco
    FDQueryCR.Connection    := DataModule1.FDConnection;
    FDQueryCrDet.Connection := DataModule1.FDConnection;
    FDQueryCaixa.Connection := DataModule1.FDConnection;

    if ContaReceber.ID = '' then
    begin
      raise Exception.Create('Conta a receber não encontrada!');
    end;

    ContaReceber.ValorAbatido := ContaReceber.ValorAbatido + BaixaCR.Valor;

    //  Caso o valor abatido já seja igual ao valor da parcela
    if ContaReceber.ValorAbatido >= ContaReceber.ValorParcela then
    begin

      ContaReceber.Status := 'P';
      ContaReceber.DataRecebimento := BaixaCR.Data;

    end;

    try

      //  Se o valor da parcela - o valor pago for diferente do valor
      //  de desconto irá gerar uma parcial
      if (ContaReceber.ValorParcela - BaixaCR.Valor) <> BaixaCR.ValorDesc then
      begin

          //  Inseriando nova duplcata parcial
          if not (cdsCReceber.State in [dsInsert, dsEdit]) then
          begin

            //  Colocando o data set em modo de inserção de dados
            cdsCReceber.Insert;

          end;

          //  gera a id
          GeraCodigo;
          cdsCReceberDATA_CADASTRO.AsDateTime := now;
          cdsCReceberSTATUS.AsString          := 'A';
          cdsCReceberVALOR_ABATIDO.AsCurrency := 0;


          //  Passando os dados para o dataset
          if (ContaReceber.Doc = '') or (ContaReceber.Parcial = 'S' ) then
          begin
            cdsCReceberNUMERO_DOCUMENTO.AsString  := ContaReceber.Doc;
          end
          else
          begin
            cdsCReceberNUMERO_DOCUMENTO.AsString  := Format('%s-P', [ContaReceber.Doc]);
          end;

          cdsCReceberDESCRICAO.AsString         := Format('Parcial - Restante da Conta ID Nº %s - Doc Nº %s', [ContaReceber.ID, ContaReceber.Doc]);
          cdsCReceberVALOR_VENDA.AsCurrency     := ContaReceber.ValorVenda;
          cdsCReceberDATA_VENDA.AsDateTime      := ContaReceber.DataVenda;
          cdsCReceberPARCELA.AsInteger          := ContaReceber.Parcela;
          cdsCReceberVALOR_PARCELA.AsCurrency   := ((ContaReceber.ValorParcela - BaixaCR.Valor) - BaixaCR.ValorDesc);
          cdsCReceberDATA_VENCIMENTO.AsDateTime := ContaReceber.DataVencimento;
          cdsCReceberPARCIAL.AsString           := 'S';
          cdsCReceberCR_ORIGEM.AsString         := ContaReceber.Id;
          cdsCReceberID_CLIENTE.AsInteger       := ContaReceber.IdCliente;

          //  Gravando no BD
          cdsCReceber.Post;
          cdsCReceber.ApplyUpdates(0);

        end;

        //  Montando o SQL para atualizar a conta baixada
        SQLUpdate := 'UPDATE CONTAS_RECEBER SET VALOR_ABATIDO = :VALORABATIDO, ' +
                ' VALOR_PARCELA = :VALORPARCELA, STATUS = :STATUS, ' +
                ' DATA_RECEBIMENTO = :DATAREC' +
                ' WHERE ID = :IDCR; ';

        FDQueryCR.Close;
        FDQueryCR.SQL.Clear;
        FDQueryCR.SQL.Add(SQLUpdate);

        FDQueryCR.ParamByName('VALORABATIDO').AsCurrency := ContaReceber.ValorAbatido;
        FDQueryCR.ParamByName('VALORPARCELA').AsCurrency := ContaReceber.ValorParcela;
        FDQueryCR.ParamByName('STATUS').AsString         := 'P';
        FDQueryCR.ParamByName('DATAREC').AsDate          := BaixaCR.Data;
        FDQueryCR.ParamByName('IDCR').AsString           := ContaReceber.ID;

        FDQueryCR.Prepare;
        FDQueryCR.ExecSQL;

      //  Montando o SQL para persisitr os dados na tabela Contas_receber_detalhe
      SQLInsert := 'INSERT INTO CONTAS_RECEBER_DETALHE (ID, ID_CONTA_RECEBER, DETALHES, ' +
             ' VALOR, DATA, USUARIO, DESCONTO_BX) VALUES (:ID, :IDCR, :DETALHES, :VALOR, ' +
             ' :DATA, :USUARIO, :DESC )';

      FDQueryCrDet.SQL.Add(SQLInsert);

      FDQueryCrDet.ParamByName('ID').AsInteger      := GeraCodigoCRDetalhe;
      FDQueryCrDet.ParamByName('IDCR').AsInteger    := BaixaCR.IdCR;
      FDQueryCrDet.ParamByName('DETALHES').AsString := BaixaCR.Detalhes;
      FDQueryCrDet.ParamByName('VALOR').AsCurrency  := BaixaCR.Valor;
      FDQueryCrDet.ParamByName('DATA').AsDate       := BaixaCR.Data;
      FDQueryCrDet.ParamByName('USUARIO').AsString  := BaixaCR.Usuario;
      FDQueryCrDet.ParamByName('DESC').AsCurrency   := BaixaCR.ValorDesc;

      FDQueryCrDet.Prepare;
      FDQueryCrDet.ExecSQL;

      //  Lançando a baixa no caixa
      LancarCaixa := TModelLancamentoCaixa.Create;
      try

        LancarCaixa.ID           := dmCaixa.GeraId;
        LancarCaixa.NumDoc       := ContaReceber.Doc;
        LancarCaixa.Desc         := Format('Baixa Conta ID Nº %s a Receber - Nº Documento: %s - Parcela: %d', [ContaReceber.ID, ContaReceber.Doc, ContaReceber.Parcela]);
        LancarCaixa.Valor        := BaixaCr.Valor;
        LancarCaixa.Tipo         := 'R';
        LancarCaixa.DataCadastro := now;
        LancarCaixa.Origem       := 'CR';
        LancarCaixa.IdOrigem     := StrToInt(ContaReceber.ID);

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

      FDQueryCR.Close;
      FDQueryCR.Free;
      FDQueryCrDet.Free;

    end;

  finally

    ContaReceber.Free;

  end;

end;

procedure TdmCReceber.cdsCReceberSTATUSGetText(Sender: TField; var Text: string;
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

procedure TdmCReceber.GeraCodigo;
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
    FDQueryId.Open('SELECT MAX(ID) AS ID FROM CONTAS_RECEBER');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;
    cdsCReceberID.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append;

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TdmCReceber.GeraCodigoCRDetalhe: Integer;
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
    FDQueryIdDet.Open('SELECT MAX(ID) AS ID FROM CONTAS_RECEBER_DETALHE');

    //  Ultimo codigo usado + 1
    Result := FDQueryIdDet.FieldByName('ID').AsInteger + 1;

    //  Insere o registro no final da tabela
    FDQueryIdDet.Append;

  finally

    FDQueryIdDet.Close;
    FDQueryIdDet.Free;

  end

end;

function TdmCReceber.GetCR(Id: Integer): TModelCR;
var
  FDQueryCR : TFDQuery;
begin

  FDQueryCR := TFDQuery.Create(nil);

  try

    //  Estabelece a conexão
    FDQueryCR.Connection := DataModule1.FDConnection;

    FDQueryCR.Close;
    FDQueryCR.SQL.Clear;
    FDQueryCR.SQL.Add('SELECT * FROM CONTAS_RECEBER WHERE ID = :ID');

    FDQueryCR.ParamByName('ID').AsInteger := Id;
    FDQueryCR.Open;

    Result := TModelCR.Create;

    try

      Result.ID              := FDQueryCR.FieldByName('ID').AsString;
      Result.Doc             := FDQueryCR.FieldByName('NUMERO_DOCUMENTO').AsString;
      Result.Desc            := FDQueryCR.FieldByName('DESCRICAO').AsString;
      Result.Parcela         := FDQueryCR.FieldByName('PARCELA').AsInteger;
      Result.ValorVenda      := FDQueryCR.FieldByName('VALOR_VENDA').AsCurrency;
      Result.ValorAbatido    := FDQueryCR.FieldByName('VALOR_ABATIDO').AsCurrency;
      Result.ValorParcela    := FDQueryCR.FieldByName('VALOR_PARCELA').AsCurrency;
      Result.DataVenda       := FDQueryCR.FieldByName('DATA_VENDA').AsDateTime;
      Result.DataCadastro    := FDQueryCR.FieldByName('DATA_CADASTRO').AsDateTime;
      Result.DataVencimento  := FDQueryCR.FieldByName('DATA_VENCIMENTO').AsDateTime;
      Result.DataRecebimento := FDQueryCR.FieldByName('DATA_RECEBIMENTO').AsDateTime;
      Result.Status          := FDQueryCR.FieldByName('STATUS').AsString;
      Result.Parcial         := FDQueryCR.FieldByName('PARCIAL').AsString;
      Result.CrOrigem        := FDQueryCR.FieldByName('CR_ORIGEM').AsInteger;
      Result.IdCliente       := FDQueryCR.FieldByName('ID_CLIENTE').AsInteger;

    except

      Result.Free;
      raise;

    end;

  finally

    FDQueryCR.Close;
    FDQueryCR.Free;

  end;

end;

function TdmCReceber.TotalCR(DataInicial, DataFinal: TDate): Currency;
var
  FDQueryTotalCR : TFDQuery;

begin

  Result := 0;
  FDQueryTotalCR := TFDQuery.Create(nil);

  try

    //  Estabele a conexão com o banco
    FDQueryTotalCR.Connection := DataModule1.FDConnection;

    FDQueryTotalCR.Close;
    FDQueryTotalCR.SQL.Clear;
    FDQueryTotalCR.SQL.Add('SELECT COALESCE(SUM(VALOR_PARCELA), 0) AS VALOR FROM CONTAS_RECEBER ');
    FDQueryTotalCR.SQL.Add(' WHERE STATUS = ''A'' AND DATA_VENDA BETWEEN :DATA_INICIAL AND :DATA_FINAL ');

    FDQueryTotalCR.ParamByName('DATA_INICIAL').AsDate := DataInicial;
    FDQueryTotalCR.ParamByName('DATA_FINAL').AsDate := DataFinal;

    FDQueryTotalCR.Open;

    Result := FDQueryTotalCR.FieldByName('VALOR').AsCurrency;


  finally

    FDQueryTotalCR.Close;
    FDQueryTotalCR.Free;

  end;

end;


end.
