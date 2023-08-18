unit SistemaFinanceiro.Model.Entidades.CP;

interface
type
  TModelCP = class

    private
      FID: String;
      FValorParcela: Currency;
      FDataCompra: TDate;
      FDataVencimento: TDate;
      FDataPagamento: TDate;
      FValorAbatido: Currency;
      FValorCompra: Currency;
      FStatus: String;
      FDataCadastro: TDate;
      FDoc: String;
      FDesc: String;
      FParcela: Integer;
    FParcial: String;
    FCpOrigem: Integer;

      procedure SetID(const Value: String);
      procedure SetDataCadastro(const Value: TDate);
      procedure SetDataCompra(const Value: TDate);
      procedure SetDataPagamento(const Value: TDate);
      procedure SetDataVencimento(const Value: TDate);
      procedure SetDesc(const Value: String);
      procedure SetDoc(const Value: String);
      procedure SetParcela(const Value: Integer);
      procedure SetStatus(const Value: String);
      procedure SetValorAbatido(const Value: Currency);
      procedure SetValorCompra(const Value: Currency);
      procedure SetValorParcela(const Value: Currency);

    procedure SetParcial(const Value: String);

    procedure SetCpOrigem(const Value: Integer);    public

      property ID             : String read FID write SetID;
      property Doc            : String read FDoc write SetDoc;
      property Desc           : String read FDesc write SetDesc;
      property Parcela        : Integer read FParcela write SetParcela;
      property ValorParcela   : Currency read FValorParcela write SetValorParcela;
      property ValorCompra    : Currency read FValorCompra write SetValorCompra;
      property ValorAbatido   : Currency read FValorAbatido write SetValorAbatido;
      property DataCompra     : TDate read FDataCompra write SetDataCompra;
      property DataCadastro   : TDate read FDataCadastro write SetDataCadastro;
      property DataVencimento : TDate read FDataVencimento write SetDataVencimento;
      property DataPagamento  : TDate read FDataPagamento write SetDataPagamento;
      property Status         : String read FStatus write SetStatus;
      property Parcial        : String read FParcial write SetParcial;
      property CpOrigem : Integer read FCpOrigem write SetCpOrigem;
  end;

implementation

{ TModelCP }

procedure TModelCP.SetCpOrigem(const Value: Integer);
begin
  FCpOrigem := Value;
end;

procedure TModelCP.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TModelCP.SetDataCompra(const Value: TDate);
begin
  FDataCompra := Value;
end;

procedure TModelCP.SetDataPagamento(const Value: TDate);
begin
  FDataPagamento := Value;
end;

procedure TModelCP.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TModelCP.SetDesc(const Value: String);
begin
  FDesc := Value;
end;

procedure TModelCP.SetDoc(const Value: String);
begin
  FDoc := Value;
end;

procedure TModelCP.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelCP.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TModelCP.SetParcial(const Value: String);
begin
  FParcial := Value;
end;

procedure TModelCP.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TModelCP.SetValorAbatido(const Value: Currency);
begin
  FValorAbatido := Value;
end;

procedure TModelCP.SetValorCompra(const Value: Currency);
begin
  FValorCompra := Value;
end;

procedure TModelCP.SetValorParcela(const Value: Currency);
begin
  FValorParcela := Value;
end;

end.
