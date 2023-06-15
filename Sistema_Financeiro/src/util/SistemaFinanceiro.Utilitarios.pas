unit SistemaFinanceiro.Utilitarios;

interface

uses
  Vcl.DBGrids;

type
  TUtilitario = class

    class function GetId : String;
    class function LikeFind(Pesquisa: String; Grid: TDBGrid) : String;

  end;

implementation

uses
  System.SysUtils;

{ TUtilitario }

class function TUtilitario.GetId: String;
begin

  Result := TGUID.NewGuid.ToString;

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

  for LContador := 0 to Pred(Grid.Columns.Count) do
  begin

    Result := Result + Grid.Columns.Items[LContador].FieldName +
              ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';

  end;

  Result := ' WHERE ' + Copy(Result, 1, Length(Result) - 4);

end;

end.
