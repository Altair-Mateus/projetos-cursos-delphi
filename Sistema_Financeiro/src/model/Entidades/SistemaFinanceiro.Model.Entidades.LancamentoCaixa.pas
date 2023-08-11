unit SistemaFinanceiro.Model.Entidades.LancamentoCaixa;

interface
type
  TModelLancamentoCaixa = class

  private
    FNumeroDoc: string;
    FValor: Currency;
    FID: Integer;
    FDataCadastro: TDate;
    FDescricao: string;
    FTipo: string;
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetNumeroDoc(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetValor(const Value: Currency);


  public

    property ID : Integer read FID write SetID;
    property NumDoc : string read FNumeroDoc write SetNumeroDoc;
    property Desc : string read FDescricao write SetDescricao;
    property Valor : Currency read FValor write SetValor;
    property Tipo : string read FTipo write SetTipo;
    property DataCadastro : TDate read FDataCadastro write SetDataCadastro;

  end;

implementation

{ TModelLancamentoCaixa }

procedure TModelLancamentoCaixa.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TModelLancamentoCaixa.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelLancamentoCaixa.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TModelLancamentoCaixa.SetNumeroDoc(const Value: string);
begin
  FNumeroDoc := Value;
end;

procedure TModelLancamentoCaixa.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TModelLancamentoCaixa.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
