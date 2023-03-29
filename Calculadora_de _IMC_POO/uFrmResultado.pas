unit uFrmResultado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCalculadoraIMC, uPessoa, uResultadoIMC;

type
  TFormResultado = class(TForm)
    PanelResultado: TPanel;
    LabelAltura: TLabel;
    LabelPeso: TLabel;
    LabelSexo: TLabel;
    PanelTitulo: TPanel;
    LabelTitulo: TLabel;
    LabelDesc: TLabel;
    LabelImc: TLabel;
    LabelResultPeso: TLabel;
    LabelResultAltura: TLabel;
    LabelResultSexo: TLabel;
    LabelResultDesc: TLabel;
    LabelResultImc: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }

    constructor Create(AOwner: TComponent; pPessoa: TPessoa; pResultadoIMC: RResultadoIMC);

  end;

var
  FormResultado: TFormResultado;

implementation

{$R *.dfm}

{ TFormResultado }

constructor TFormResultado.Create(AOwner: TComponent; pPessoa: TPessoa;
  pResultadoIMC: RResultadoIMC);
begin

  inherited create(AOwner);

  try

    LabelResultAltura.Caption := FloatToStr(pPessoa.Altura);
    LabelResultPeso.Caption   := FloatToStr(pPessoa.Peso);
    LabelResultSexo.Caption   := pPessoa.Sexo;
    LabelResultImc.Caption    := FormatFloat('#.##', pResultadoIMC.Valor);
    LabelResultDesc.Caption   := pResultadoIMC.Descricao;

  except

    on e: exception do
      raise Exception.Create(E.Message);

  end;


end;

end.
