unit View_Pirincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
