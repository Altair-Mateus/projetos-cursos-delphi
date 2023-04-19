unit View_Pirincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe_Administrativo,
  Classe_Pessoa, Classe_Vendedor;

type
  TForm1 = class(TForm)
    LabelFuncao: TLabel;
    ComboBoxFuncao: TComboBox;
    LabelNome: TLabel;
    EditNome: TEdit;
    EditBonus: TEdit;
    LabelBonus: TLabel;
    EditSalario: TEdit;
    LabelSalario: TLabel;
    ButtonSalvar: TButton;
    ButtonCalcSalario: TButton;
    ButtonRetorna: TButton;
    ButtonAvanca: TButton;
    Memo1: TMemo;
    procedure ButtonCalcSalarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Funcionario: Array[1..100] of TPessoa;
    QtdFunc: Integer;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonCalcSalarioClick(Sender: TObject);
begin

  if ComboBoxFuncao.ItemIndex = 0 then
  begin

  end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  QtdFunc := 0;

end;

end.
