unit fAula4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TGarrafa = class
    Cor    : String;
    Modelo : String;
    Tampa  : String;

    procedure ArmazenarLiquido(Liquido : String);

  end;

  TfrmAula4 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAula4: TfrmAula4;

implementation

{$R *.dfm}


{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: String);
begin

end;

procedure TfrmAula4.Button1Click(Sender: TObject);
var
  MinhaGarrafa : TGarrafa;

begin

  MinhaGarrafa := nil;

  if Assigned(MinhaGarrafa) then
    ShowMessage('Estou instanciado')
  else
    ShowMessage('N�o estou instanciado');


  //  Cria o objeto
  MinhaGarrafa := TGarrafa.Create;

  try

    MinhaGarrafa.Modelo := 'Vidro';
    MinhaGarrafa.Cor    := 'Vermelha';

  finally

    //  Destroi o objeto
    FreeAndNil(MinhaGarrafa);

  end;



end;


end.
