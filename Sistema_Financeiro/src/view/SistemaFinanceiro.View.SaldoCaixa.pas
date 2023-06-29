unit SistemaFinanceiro.View.SaldoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.WinXPanels;

type
  TfrmSaldoCaixa = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisa: TPanel;
    ImageList1: TImageList;
    btnPesquisae: TButton;
    dateInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    dateFinal: TDateTimePicker;
    lblDataFinal: TLabel;
    pnlRelat: TPanel;
    StackPanel1: TStackPanel;
    pnlSaldoInicial: TPanel;
    lblSaldoInicial: TLabel;
    lblValorSaldoInicial: TLabel;
    pnlSaldoFinal: TPanel;
    lblSaldoFinal: TLabel;
    lblValorSaldoFinal: TLabel;
    pnlSaldoParcial: TPanel;
    lblSaldoParcial: TLabel;
    lblValorSaldoParcial: TLabel;
    pnlSaidas: TPanel;
    lblTotalSaidas: TLabel;
    lblValorTotalSaidas: TLabel;
    pnlEntradas: TPanel;
    lblTotalEntradas: TLabel;
    lblValorTotalEntradas: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
  private
    { Private declarations }

    procedure Pesquisar;

  public
    { Public declarations }
  end;

var
  frmSaldoCaixa: TfrmSaldoCaixa;

implementation

{$R *.dfm}

uses

  SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.Model.dmCaixa,
  SistemaFinanceiro.Model.Entidades.ResumoCaixa,
  System.DateUtils;

{ TfrmSaldoCaixa }

procedure TfrmSaldoCaixa.btnPesquisaeClick(Sender: TObject);
begin

  Pesquisar;

end;

procedure TfrmSaldoCaixa.FormShow(Sender: TObject);
begin

  dateInicial.Date := IncDay(Now, -7);
  Pesquisar;

end;

procedure TfrmSaldoCaixa.Pesquisar;
var
  ResumoCaixa : TModelResumoCaixa;

begin

  ResumoCaixa := DataModuleCaixa.ResumoCaixa(dateInicial.Date, dateFinal.Date);

  try

    //  Alimentando as Labels
    lblValorSaldoInicial.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoInicial);
    lblValorTotalEntradas.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalEntradas);
    lblValorTotalSaidas.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.TotalSaidas);
    lblValorSaldoParcial.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoParcial);
    lblValorSaldoFinal.Caption := TUtilitario.FormatoMoeda(ResumoCaixa.SaldoFinal);

  finally

    ResumoCaixa.Free;

  end;

end;

end.
