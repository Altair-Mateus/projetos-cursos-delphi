unit Classe_Administrativo;

interface

uses
  Classe_Pessoa;

type
  TAdministrativo = class(TPessoa)
  private
    FBonus: Currency;
    procedure SetBonus(const Value: Currency);

  public
    property Bonus: Currency read FBonus write SetBonus;
    function CalcularSalario : Currency; override;

  end;

implementation

{ TAdministrativo }

function TAdministrativo.CalcularSalario: Currency;
begin

  Result := Salario + Bonus;

end;

procedure TAdministrativo.SetBonus(const Value: Currency);
begin
  FBonus := Value;
end;

end.
