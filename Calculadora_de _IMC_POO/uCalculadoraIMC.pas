unit uCalculadoraIMC;

interface

uses
  uPessoa, uResultadoIMC, System.SysUtils;

 Type
    TCalculadoraIMC = class
    private
      { private declarations }
    protected
      { protected declarations }
    public
      { public declarations }
      function Calcular(pPessoa: TPessoa): RResultadoIMC;
    published
      { published declarations }
    end;
implementation

{ TCalculadoraIMC }

function TCalculadoraIMC.Calcular(pPessoa: TPessoa): RResultadoImc;
var

  imc: Double;
  str_imc: String;

begin

  try

    imc := (pPessoa.Peso / (pPessoa.Altura * pPessoa.Altura));

    if (imc < 18.5) then
    begin

      str_imc := 'MAGREZA';

    end
      else
        if (imc >= 18.5) AND (imc <= 24.9) then
        begin

          str_imc := 'NORMAL';

        end
          else
            if (imc >= 25) and (imc <= 29.9) then
            begin

              str_imc := 'SOBREPESO';

            end
              else
                if (imc >= 30) and (imc <= 39.9) then
                begin

                  str_imc := 'OBESIDADE';

                end
                  else
                  begin

                    str_imc := 'OBESIDADE GRAVE'

                  end;


    Result.Valor     := imc;
    Result.Descricao := str_imc;

  except

    raise Exception.Create('Erro ao efetuar o cálculo');

  end;

end;

end.
