unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Contatos1: TMenuItem;
    Contatos2: TMenuItem;
    Label1: TLabel;
    procedure Contatos2Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses UnitContatos;

procedure TForm2.Contatos1Click(Sender: TObject);
begin
  Form1.show;
end;

procedure TForm2.Contatos2Click(Sender: TObject);
begin
  Form2.Close;
end;

end.