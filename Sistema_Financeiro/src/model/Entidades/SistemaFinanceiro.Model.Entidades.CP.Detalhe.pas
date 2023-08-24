unit SistemaFinanceiro.Model.Entidades.CP.Detalhe;
interface
type
  TModelCpDetalhe = class
    private
      FValor: Currency;
      FDetalhes: String;
      FId: Integer;
      FIdCP: Integer;
      FUsuario: String;
      FData: TDate;
    FValorDesc: Currency;
      procedure SetData(const Value: TDate);
      procedure SetDetalhes(const Value: String);
      procedure SetId(const Value: Integer);
      procedure SetIdCP(const Value: Integer);
      procedure SetUsuario(const Value: String);
      procedure SetValor(const Value: Currency);
      procedure SetValorDesc(const Value: Currency);
    public
      property Id        : Integer read FId write SetId;
      property IdCP      : Integer read FIdCP write SetIdCP;
      property Detalhes  : String read FDetalhes write SetDetalhes;
      property Valor     : Currency read FValor write SetValor;
      property Data      : TDate read FData write SetData;
      property Usuario   : String read FUsuario write SetUsuario;
      property ValorDesc : Currency read FValorDesc write SetValorDesc;
  end;
implementation
{ TModelCpDetalhe }
procedure TModelCpDetalhe.SetData(const Value: TDate);
begin
  FData := Value;
end;
procedure TModelCpDetalhe.SetDetalhes(const Value: String);
begin
  FDetalhes := Value;
end;
procedure TModelCpDetalhe.SetId(const Value: Integer);
begin
  FId := Value;
end;
procedure TModelCpDetalhe.SetIdCP(const Value: Integer);
begin
  FIdCP := Value;
end;
procedure TModelCpDetalhe.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;
procedure TModelCpDetalhe.SetValor(const Value: Currency);
begin
  FValor := Value;
end;
procedure TModelCpDetalhe.SetValorDesc(const Value: Currency);
begin
  FValorDesc := Value;
end;

end.
