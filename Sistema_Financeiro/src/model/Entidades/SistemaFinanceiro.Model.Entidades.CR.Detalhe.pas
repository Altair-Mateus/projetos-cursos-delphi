unit SistemaFinanceiro.Model.Entidades.CR.Detalhe;

interface
type
  TModelCrDetalhe = class

    private
      FValor: Currency;
      FDetalhes: String;
      FIdCR: Integer;
      FId: Integer;
      FUsuario: String;
      FData: TDate;
      FValorDesc: Currency;
      FValorJuros: Currency;

      procedure SetData(const Value: TDate);
      procedure SetDetalhes(const Value: String);
      procedure SetId(const Value: Integer);
      procedure SetIdCR(const Value: Integer);
      procedure SetUsuario(const Value: String);
      procedure SetValor(const Value: Currency);
      procedure SetValorDesc(const Value: Currency);
      procedure SetValorJuros(const Value: Currency);


    public
      property Id         : Integer read FId write SetId;
      property IdCR       : Integer read FIdCR write SetIdCR;
      property Detalhes   : String read FDetalhes write SetDetalhes;
      property Valor      : Currency read FValor write SetValor;
      property Data       : TDate read FData write SetData;
      property Usuario    : String read FUsuario write SetUsuario;
      property ValorDesc  : Currency read FValorDesc write SetValorDesc;
      property ValorJuros : Currency read FValorJuros write SetValorJuros;


  end;

implementation

{ TModelCrDetalhe }

procedure TModelCrDetalhe.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TModelCrDetalhe.SetDetalhes(const Value: String);
begin
  FDetalhes := Value;
end;

procedure TModelCrDetalhe.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TModelCrDetalhe.SetIdCR(const Value: Integer);
begin
  FIdCR := Value;
end;

procedure TModelCrDetalhe.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

procedure TModelCrDetalhe.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

procedure TModelCrDetalhe.SetValorDesc(const Value: Currency);
begin
  FValorDesc := Value;
end;

procedure TModelCrDetalhe.SetValorJuros(const Value: Currency);
begin
  FValorJuros := Value;
end;

end.
