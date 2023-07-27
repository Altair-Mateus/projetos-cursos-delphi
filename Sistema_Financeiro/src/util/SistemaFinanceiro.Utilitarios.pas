unit SistemaFinanceiro.Utilitarios;

interface

uses
  Vcl.DBGrids, Vcl.Controls;

type
  TUtilitario = class

    class function GetId : String;
    class function LikeFind(Pesquisa: String; Grid: TDBGrid) : String;
    class function FormatoMoeda(Valor: Currency) : String;
    class function FormatarValor(Valor: Currency; Decimais : Integer = 2) : string; overload;
    class function FormatarValor(Valor: String; Decimais : Integer = 2) : string; overload;
    class function TruncarValor(Valor: Currency; Decimais : Integer = 2) : Currency;

    class procedure KeyPressValor(Sender: TObject; var Key: Char);

  end;

implementation

uses
  System.SysUtils,
  System.Math,
  Vcl.StdCtrls;

{ TUtilitario }

class function TUtilitario.FormatarValor(Valor: Currency;
  Decimais: Integer): string;
begin

  Valor := TruncarValor(Valor, Decimais);

  Result := FormatCurr('0.' + StringOfChar('0', Decimais), Valor);

end;

class function TUtilitario.FormatarValor(Valor: String;
  Decimais: Integer): string;
var
  LValor : Currency;

begin

  LValor :=0;

  TryStrToCurr(Valor, Lvalor);

  Result := FormatarValor(LValor, Decimais);

end;

class function TUtilitario.FormatoMoeda(Valor: Currency): String;
begin

  Result := Format('%m', [Valor]);
end;

class function TUtilitario.GetId: String;
begin

  Result := TGUID.NewGuid.ToString;
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);

end;

class procedure TUtilitario.KeyPressValor(Sender: TObject; var Key: Char);
begin

  //  Se for digitado um ponto, será convertido para virgula
  if Key = FormatSettings.ThousandSeparator then
   begin
      Key := #0;
    end;


  // Permite apenas digitar os caracteres dentro do charinset
  if not (CharInSet(Key, ['0'..'9', FormatSettings.DecimalSeparator, #8])) then
  begin
    Key := #0;
  end;


  // Valida se já existe o ponto decimal
  if (Key = FormatSettings.DecimalSeparator) and (pos(Key, TEdit(Sender).Text) > 0) then
  begin
    Key := #0;
  end;
end;

class function TUtilitario.LikeFind(Pesquisa: String; Grid: TDBGrid): String;
var

  LContador : Integer;

begin

  Result := '';

  //  Valida se a pesquisa veio vazia
  if Pesquisa.Trim.IsEmpty then
  begin
    exit;
  end;


  //  Função upper converte a string em letras maiusculas
  //  Função QuotedStr trata o texto e o coloca dentro aspas simples
  //  Função trim remove os espaços no inicio e fim do texto
  for LContador := 0 to Pred(Grid.Columns.Count) do
  begin

    Result := Result + 'upper(trim(' + Grid.Columns.Items[LContador].FieldName + '))' +
              ' LIKE ' + QuotedStr('%' + UpperCase(Trim(Pesquisa)) + '%') + ' OR ';

  end;

  Result := ' AND (' + Copy(Result, 1, Length(Result) - 4) + ')';

end;

class function TUtilitario.TruncarValor(Valor: Currency;
  Decimais: Integer): Currency;
var
  LFator: Double;

begin

  LFator := Power(10, Decimais);

  Result := Trunc(Valor * LFator) / LFator;

end;

end.
