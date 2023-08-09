unit SistemaFinanceiro.View.ConsultarCr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmConsultarCr = class(TForm)
    pnlPesquisa: TPanel;
    lblPesquisar: TLabel;
    edtPesquisar: TEdit;
    btnPesquisae: TButton;
    ImageList1: TImageList;
    pnlBotoes: TPanel;
    btnSair: TButton;
    btnBaixarCR: TButton;
    pnlGrid: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DataSourceConsultaCr: TDataSource;
    dateInicial: TDateTimePicker;
    dateFinal: TDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCr: TfrmConsultarCr;

implementation

{$R *.dfm}

end.
