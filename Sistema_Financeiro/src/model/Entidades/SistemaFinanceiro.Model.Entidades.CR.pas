unit SistemaFinanceiro.Model.Entidades.CR;

interface
type
  TModelCR = class

    private
      FDataVenda: TDate;
      FValorParcela: Currency;
      FValorVenda: Currency;
      FDataVencimento: TDate;
      FDataRecebimento: TDate;
      FID: String;
      FValorAbatido: Currency;
      FStatus: String;
      FDataCadastro: TDate;
      FDoc: String;
      FDesc: String;
      FParcela: Integer;
      FParcial: String;
    FCrOrigem: Integer;

      procedure SetDataCadastro(const Value: TDate);
      procedure SetDataRecebimento(const Value: TDate);
      procedure SetDataVencimento(const Value: TDate);
      procedure SetDataVenda(const Value: TDate);
      procedure SetDesc(const Value: String);
      procedure SetDoc(const Value: String);
      procedure SetID(const Value: String);
      procedure SetParcela(const Value: Integer);
      procedure SetStatus(const Value: String);
      procedure SetValorAbatido(const Value: Currency);
      procedure SetValorParcela(const Value: Currency);
      procedure SetValorVenda(const Value: Currency);
      procedure SetParcial(const Value: String);
    procedure SetCrOrigem(const Value: Integer);


    public
      property ID              : String read FID write SetID;
      property Doc             : String read FDoc write SetDoc;
      property Desc            : String read FDesc write SetDesc;
      property Parcela         : Integer read FParcela write SetParcela;
      property ValorParcela    : Currency read FValorParcela write SetValorParcela;
      property ValorVenda      : Currency read FValorVenda write SetValorVenda;
      property ValorAbatido    : Currency read FValorAbatido write SetValorAbatido;
      property DataVenda       : TDate read FDataVenda write SetDataVenda;
      property DataCadastro    : TDate read FDataCadastro write SetDataCadastro;
      property DataVencimento  : TDate read FDataVencimento write SetDataVencimento;
      property DataRecebimento : TDate read FDataRecebimento write SetDataRecebimento;
      property Status          : String read FStatus write SetStatus;
      property Parcial         : String read FParcial write SetParcial;
      property CrOrigem : Integer read FCrOrigem write SetCrOrigem;


  end;

implementation

{ TModelCR }

procedure TModelCR.SetCrOrigem(const Value: Integer);
begin
  FCrOrigem := Value;
end;

procedure TModelCR.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TModelCR.SetDataRecebimento(const Value: TDate);
begin
  FDataRecebimento := Value;
end;

procedure TModelCR.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TModelCR.SetDataVenda(const Value: TDate);
begin
  FDataVenda := Value;
end;

procedure TModelCR.SetDesc(const Value: String);
begin
  FDesc := Value;
end;

procedure TModelCR.SetDoc(const Value: String);
begin
  FDoc := Value;
end;

procedure TModelCR.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelCR.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TModelCR.SetParcial(const Value: String);
begin
  FParcial := Value;
end;

procedure TModelCR.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TModelCR.SetValorAbatido(const Value: Currency);
begin
  FValorAbatido := Value;
end;

procedure TModelCR.SetValorParcela(const Value: Currency);
begin
  FValorParcela := Value;
end;

procedure TModelCR.SetValorVenda(const Value: Currency);
begin
  FValorVenda := Value;
end;

end.
