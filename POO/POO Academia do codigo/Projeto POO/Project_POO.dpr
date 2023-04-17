program Project_POO;

uses
  Vcl.Forms,
  View_Pirincipal in 'View_Pirincipal.pas' {Form1},
  Classe_Pessoa in 'Classe_Pessoa.pas',
  Classe_Vendedor in 'Classe_Vendedor.pas',
  Classe_Administrativo in 'Classe_Administrativo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
