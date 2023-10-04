unit fAula3;

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


  TfrmAula3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAula3: TfrmAula3;

implementation

{$R *.dfm}

{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: String);
begin

end;

procedure TfrmAula3.Button1Click(Sender: TObject);
var
  MinhaGarrafa : TGarrafa;

begin

  //  Cria o objeto
  MinhaGarrafa := TGarrafa.Create;

  try

    MinhaGarrafa.Modelo := 'Vidro';
    MinhaGarrafa.Cor    := 'Vermelha';

  finally

    //  Destroi o objeto
    MinhaGarrafa.Free;

  end;




end;

end.
