unit Classe_Pessoa;

interface

uses
  System.SysUtils;

type

  TPessoa = class
  private
    FNome: String;
    FSalario: Currency;
    procedure SetNome(const Value: String);
    procedure SetSalario(const Value: Currency);

  public
    property Nome: String read FNome write SetNome;
    property Salario: Currency read FSalario write SetSalario;
    function CalcularSalario : Currency; virtual;
  end;

implementation

{ TPessoa }

function TPessoa.CalcularSalario: Currency;
begin

  Result := Salario;

end;

procedure TPessoa.SetNome(const Value: String);
begin

  if Value = '' then
    raise Exception.Create('Nome não pode ser vazio!!');


  FNome := Value;
end;

procedure TPessoa.SetSalario(const Value: Currency);
begin

  if Value <= 0 then
    raise Exception.Create('Salário não pode ser igual ou menor que zero!');

  FSalario := Value;
end;

end.
