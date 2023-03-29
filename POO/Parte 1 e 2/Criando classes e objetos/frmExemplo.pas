unit frmExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAviao, uCarro;

type
  TForm1 = class(TForm)
    GroupBoxCarro: TGroupBox;
    LabelDescricao: TLabel;
    LabelQuilometragem: TLabel;
    LabelCapacidade: TLabel;
    EdtDescCarro: TEdit;
    EdtQuilometragem: TEdit;
    EdtCapCarro: TEdit;
    ButtonCriar: TButton;
    ButtonLiberar: TButton;
    GroupBoxAviao: TGroupBox;
    LabelDescricaoAviao: TLabel;
    LabelQuilometragemAviao: TLabel;
    LabelCapacidadeAviao: TLabel;
    EdtDescAviao: TEdit;
    EdtHorasVoo: TEdit;
    EdtCapAviao: TEdit;
    ButtonCriarAviao: TButton;
    ButtonLiberarAviao: TButton;
    ButtonMoverAviao: TButton;
    ButtonMoverCarro: TButton;
    procedure ButtonCriarClick(Sender: TObject);
    procedure ButtonCriarAviaoClick(Sender: TObject);
    procedure ButtonLiberarClick(Sender: TObject);
    procedure ButtonLiberarAviaoClick(Sender: TObject);
    procedure ButtonMoverCarroClick(Sender: TObject);
    procedure ButtonMoverAviaoClick(Sender: TObject);
  private
    { Private declarations }
  public

    Carro: TCarro;
    Aviao: TAviao;


  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonCriarAviaoClick(Sender: TObject);
begin

  Aviao := TAviao.Create;

  if EdtDescAviao.Text <> '' then
  Aviao.Descricao := EdtDescAviao.Text;

  if EdtCapAviao.Text <> '' then
  Aviao.Capacidade := StrToIntDef(EdtCapAviao.Text, 0);

  if EdtHorasVoo.Text <> '' then
  Aviao.HorasVoo := StrToIntDef(EdtHorasVoo.Text, 0);

end;

procedure TForm1.ButtonCriarClick(Sender: TObject);
begin

  // cria o objeto e inicializa campos conforme valores dos edits
  Carro:=TCarro.Create;

  if EdtDescCarro.Text <> '' then
  Carro.Descricao := EdtDescCarro.Text;

  if EdtCapCarro.Text <> '' then
  Carro.Capacidade := StrToIntDef(EdtCapCarro.Text,0);

  if EdtQuilometragem.Text <> '' then
  Carro.Quilometragem := StrToIntDef(EdtQuilometragem.Text,0);

end;

procedure TForm1.ButtonLiberarAviaoClick(Sender: TObject);
begin

  FreeAndNil(Aviao);

end;

procedure TForm1.ButtonLiberarClick(Sender: TObject);
begin

  FreeAndNil(Carro);

end;

procedure TForm1.ButtonMoverAviaoClick(Sender: TObject);
begin

  Aviao.Mover;

end;

procedure TForm1.ButtonMoverCarroClick(Sender: TObject);
begin

  Carro.Mover;

end;

end.