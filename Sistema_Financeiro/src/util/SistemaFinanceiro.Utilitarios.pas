unit SistemaFinanceiro.Utilitarios;

interface
type
  TUtilitario = class

    class function GetId : String;

  end;

implementation

uses
  System.SysUtils;

{ TUtilitario }

class function TUtilitario.GetId: String;
begin

  Result := TGUID.NewGuid.ToString;

end;

end.
