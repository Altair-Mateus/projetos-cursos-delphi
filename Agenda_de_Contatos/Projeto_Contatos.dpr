program Projeto_Contatos;

uses
  Vcl.Forms,
  Unit1_Contatos in 'Unit1_Contatos.pas' {Form_contatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_contatos, Form_contatos);
  Application.Run;
end.
