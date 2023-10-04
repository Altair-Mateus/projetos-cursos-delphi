unit fAula2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type

  TGarrafa = class
    Cor : String;
    Modelo : String;
    Tampa : String;

    procedure ArmazenarLiquido(Liquido : String);

  end;


  TLivro = class

    public
      Titulo : String;
      Autor : String;

      function Paginacao(Pagina: Integer) : String;
  end;

  TAutor = class(TLivro)
  public
    Livro : fAula2.TLivro;

  end;

  TGibi = class(TLivro)
  public

  end;


  TfrmAula2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAula2: TfrmAula2;

implementation

{$R *.dfm}

{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: String);
begin

end;

{ TLivro }

function TLivro.Paginacao(Pagina: Integer): String;
begin

end;

end.
