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
    cdsCPagarVALOR_PARCELA: TFMTBCDField;
    cdsCPagarVALOR_COMPRA: TFMTBCDField;
    cdsCPagarVALOR_ABATIDO: TFMTBCDField;
    cdsCPagarDATA_COMPRA: TDateField;
    cdsCPagarDATA_CADASTRO: TDateField;
    cdsCPagarDATA_VENCIMENTO: TDateField;
    cdsCPagarDATA_PAGAMENTO: TDateField;
    cdsCPagarSTATUS: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GeraCodigoCPDetalhe : Integer;
    procedure BaixarCP(BaixaCP : TModelCpDetalhe);
    function GetCP(Id : Integer) : TModelCP;


  end;

var
  dmCPagar: TdmCPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TDataModuleCPagar }

procedure TdmCPagar.BaixarCP(BaixaCP: TModelCpDetalhe);
var
  ContaPagar : TModelCP;
  FDQueryCP : TFDQuery;
  FDQueryCpDet : TFDQuery;
  SQLUpdate : String;
  SQLInsert : String;

begin

  ContaPagar := GetCP(BaixaCP.IdCP);
  FDQueryCP := TFDQuery.Create(nil);
  FDQueryCpDet := TFDQuery.Create(nil);

  try

    //  Estabelece conexão com o banco
    FDQueryCP.Connection := DataModule1.FDConnection;
    FDQueryCpDet.Connection := DataModule1.FDConnection;

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

      //  Se o valor pago for parcial irá colocar status como Paga e irá
      //  Criar uma nova duplicata com o valor restante
      if ContaPagar.ValorAbatido < ContaPagar.ValorParcela then
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
        cdsCPagarNUMERO_DOC.AsString        := ContaPagar.Doc;
        cdsCPagarDESCRICAO.AsString         := Format('Parcial - Restante da Conta ID Nº %s - Doc Nº %s', [ContaPagar.ID, ContaPagar.Doc]);
        cdsCPagarVALOR_COMPRA.AsCurrency    := ContaPagar.ValorCompra;
        cdsCPagarDATA_COMPRA.AsDateTime     := ContaPagar.DataCompra;
        cdsCPagarPARCELA.AsInteger          := 1;
        cdsCPagarVALOR_PARCELA.AsCurrency   := ContaPagar.ValorParcela - BaixaCP.Valor;
        cdsCPagarDATA_VENCIMENTO.AsDateTime := ContaPagar.DataVencimento;

        //  Gravando no BD
        cdsCPagar.Post;
        cdsCPagar.ApplyUpdates(0);


        // Montando o SQL para atualizar a duplicata anterior
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

      end;

      //  Se o valor pago for total
      if ContaPagar.ValorAbatido = ContaPagar.ValorParcela then
      begin

        SQLUpdate := 'UPDATE CONTAS_PAGAR SET VALOR_ABATIDO = :VALORABATIDO, ' +
                ' VALOR_PARCELA = :VALORPARCELA, STATUS = :STATUS, ' +
                ' DATA_PAGAMENTO = :DATAPGTO' +
                ' WHERE ID = :IDCP; ';

        FDQueryCP.Close;
        FDQueryCP.SQL.Clear;
        FDQueryCP.SQL.Add(SQLUpdate);

        FDQueryCP.ParamByName('VALORABATIDO').AsCurrency := ContaPagar.ValorAbatido;
        FDQueryCP.ParamByName('VALORPARCELA').AsCurrency := ContaPagar.ValorParcela;
        FDQueryCP.ParamByName('STATUS').AsString         := ContaPagar.Status;
        FDQueryCP.ParamByName('DATAPGTO').AsDate         := BaixaCP.Data;
        FDQueryCP.ParamByName('IDCP').AsString           := ContaPagar.ID;

        FDQueryCP.Prepare;
        FDQueryCP.ExecSQL;

      end;


      //  Montando o SQL para persisitr os dados na tabela Contas_pagar_detalhe
      SQLInsert := 'INSERT INTO CONTAS_PAGAR_DETALHE (ID, ID_CONTA_PAGAR, DETALHES, ' +
             ' VALOR, DATA, USUARIO) VALUES (:ID, :IDCP, :DETALHES, :VALOR, ' +
             ' :DATA, :USUARIO)';

      FDQueryCpDet.SQL.Add(SQLInsert);

      FDQueryCpDet.ParamByName('ID').AsInteger      := GeraCodigoCPDetalhe;
      FDQueryCpDet.ParamByName('IDCP').AsInteger    := BaixaCP.IdCP;
      FDQueryCpDet.ParamByName('DETALHES').AsString := BaixaCP.Detalhes;
      FDQueryCpDet.ParamByName('VALOR').AsCurrency  := BaixaCP.Valor;
      FDQueryCpDet.ParamByName('DATA').AsDate       := BaixaCP.Data;
      FDQueryCpDet.ParamByName('USUARIO').AsString  := BaixaCP.Usuario;



      FDQueryCpDet.Prepare;
      FDQueryCpDet.ExecSQL;

    finally

      FDQueryCP.Close;
      FDQueryCP.Free;
      FDQueryCpDet.Free;

    end;

  finally
    ContaPagar.Free;
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


    except

      Result.Free;
      raise;

    end;


  finally

    FDQueryCP.Close;
    FDQueryCP.Free;

  end;

end;

end.
