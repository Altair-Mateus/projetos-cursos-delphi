unit uPessoa;

interface

uses
  System.SysUtils;

Type

  TPessoa = class

    private
      FPeso: Double;
      FAltura: Double;
      FSexo: Char;

      procedure SetPeso(const Value: Double);
      procedure SetAltura(const Value: Double);
      procedure SetSexo(const Value: Char);

    public
      property Altura: Double read Faltura write FAltura;
      property Peso: Double read FPeso write FPeso;
      property Sexo: Char read FSexo write FSexo;

  end;

implementation

{ TPessoa }

procedure TPessoa.SetAltura(const Value: Double);
begin

  FAltura := Value;

end;

procedure TPessoa.SetPeso(const Value: Double);
begin

  FPeso := Value;

end;

procedure TPessoa.SetSexo(const Value: Char);
begin

  if Value in ['F', 'M'] then
  begin

    FSexo := Value;

  end
  else
  begin

    raise Exception.Create('Sexo inválido');

  end;

end;

end.
