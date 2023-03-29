program prjCalculadoraImcPoo;

uses
  Vcl.Forms,
  uFrmCalc in 'uFrmCalc.pas' {FormCalc},
  uFrmResultado in 'uFrmResultado.pas' {FormResultado},
  uPessoa in 'uPessoa.pas',
  uResultadoIMC in 'uResultadoIMC.pas',
  uCalculadoraIMC in 'uCalculadoraIMC.pas',
  uFrmTabIMC in 'uFrmTabIMC.pas' {FormTabImc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCalc, FormCalc);
  Application.CreateForm(TFormResultado, FormResultado);
  Application.CreateForm(TFormTabImc, FormTabImc);
  Application.Run;
end.
