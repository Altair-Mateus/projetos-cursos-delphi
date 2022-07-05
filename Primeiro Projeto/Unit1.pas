unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Dolar: TEdit;
    ButtonConverte: TButton;
    Real: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    taxaConversao: TEdit;
    procedure ButtonConverteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  varReal : real;


implementation

{$R *.dfm}

procedure TForm1.ButtonConverteClick(Sender: TObject);
begin

  varReal := strtofloat(dolar.Text) * strtofloat(taxaConversao.text);
  real.text := floattostr(varReal);

end;

end.
