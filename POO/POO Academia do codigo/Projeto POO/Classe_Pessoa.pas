unit Classe_Pessoa;

interface

uses
  System.SysUtils;

type

  TPessoa = class
  private
    FNome: String;
    FFuncao: String;
    FSalario: Currency;
    procedure SetNome(const Value: String);
    procedure SetFuncao(const Value: String);
    procedure SetSalario(const Value: Currency);

  public
    property Nome: String read FNome write SetNome;
    property Funcao: String read FFuncao write SetFuncao;
    property Salario: Currency read FSalario write SetSalario;

  end;

implementation

{ TPessoa }

procedure TPessoa.SetFuncao(const Value: String);
begin

  if Value = '' then
    raise Exception.Create('Fun��o n�o pode ser vazia!');

  FFuncao := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin

  if Value = '' then
    raise Exception.Create('Nome n�o pode ser vazio!!');


  FNome := Value;
end;

procedure TPessoa.SetSalario(const Value: Currency);
begin

  if Value <= 0 then
    raise Exception.Create('Sal�rio n�o pode ser igual ou menor que zero!');

  FSalario := Value;
end;

end.
