unit uFrmCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uFrmTabIMC,
  uCalculadoraIMC, uPessoa, uResultadoIMC, uFrmResultado;

type
  TFormCalc = class(TForm)
    PanelTitulo: TPanel;
    PanelCalculadora: TPanel;
    LabelTitulo: TLabel;
    LabelAltura: TLabel;
    EditAltura: TEdit;
    EditPeso: TEdit;
    LabelPeso: TLabel;
    LabelSexo: TLabel;
    ComboBoxSexo: TComboBox;
    ButtonCalc: TButton;
    ButtonTabIMC: TButton;
    procedure ButtonTabIMCClick(Sender: TObject);
    procedure ButtonCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.dfm}

procedure TFormCalc.ButtonCalcClick(Sender: TObject);
var

  temp_pessoa: TPessoa;
  temp_calc: TCalculadoraIMC;
  temp_result: RResultadoIMC;

begin

  try

    try

      //  Criado objeto pessoa
      temp_pessoa := TPessoa.Create;

      //  Passando valores para seus atributos
      temp_pessoa.Altura := StrToFloat(EditAltura.Text);
      temp_pessoa.Peso   := StrToFloat(EditPeso.Text);
      temp_pessoa.Sexo   := ComboBoxSexo.Text[1];

      //  Criando objeto calculadora
      temp_calc := TCalculadoraIMC.Create;

      //  Chamando a function calcular
      temp_result := temp_calc.Calcular(temp_pessoa);

      //  Mostrando o form com o resultado
      FormResultado := TFormResultado.Create(Self, temp_pessoa, temp_result);
      FormResultado.ShowModal;

    except

      on E: exception do
        ShowMessage('Erro ao Calcular o IMC.' + #13 + 'Erro original: ' + E.Message);

    end;

  finally

    if Assigned(temp_pessoa) then
      FreeAndNil(temp_pessoa);

    if Assigned(temp_calc) then
      FreeAndNil(temp_calc);

    if Assigned(FormResultado) then
      FreeAndNil(FormResultado);

    EditAltura.Text := '';
    EditPeso.Text   := '';
    ComboBoxSexo.ItemIndex := -1;
    EditAltura.SetFocus;
  end;

end;

procedure TFormCalc.ButtonTabIMCClick(Sender: TObject);
begin


  try

    FormTabImc := TFormTabImc.Create(Self);
    FormTabImc.ShowModal;

  finally

    FreeAndNil(FormTabImc);

  end;

end;

end.
