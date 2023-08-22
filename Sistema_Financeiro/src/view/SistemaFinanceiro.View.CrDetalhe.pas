unit SistemaFinanceiro.View.CrDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,SistemaFinanceiro.Model.Entidades.CR.Detalhe;

type
  TfrmCrDetalhe = class(TForm)
    pnlPesquisa: TPanel;
    ImageList1: TImageList;
    pnlBotoes: TPanel;
    btnSair: TButton;
    pnlGrid: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DataSourceConsultaCr: TDataSource;
    lblTNDoc: TLabel;
    lblTVencimento: TLabel;
    lblTNumParcela: TLabel;
    lblNumParcela: TLabel;
    lblVencimento: TLabel;
    lblNumDoc: TLabel;
    lblValorVenda: TLabel;
    lblDesc: TLabel;
    lblValorParcela: TLabel;
    lblTValorParcela: TLabel;
    lblTValorVenda: TLabel;
    lblTDesc: TLabel;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibirCRDetalhes(IDCR : integer);

  end;

var
  frmCrDetalhe: TfrmCrDetalhe;

implementation

{$R *.dfm}

uses


  SistemaFinanceiro.Model.dmCReceber, SistemaFinanceiro.Model.Entidades.CR,
  SistemaFinanceiro.Utilitarios;

{ TfrmConsultarCr }

procedure TfrmCrDetalhe.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCrDetalhe.ExibirCRDetalhes(IDCR: integer);
var
  CR : TModelCr;
  SQL : String;

begin

  if IDCR <= 0 then
  begin
    raise Exception.Create('ID do contas a receber inv�lido!');
  end;

  CR := dmCReceber.GetCR(IDCR);

  try

    if CR.ID.IsEmpty then
    begin
      raise Exception.Create('Conta a Receber n�o encontrado!');
    end;

    //  Carrega os dados da CR
    if CR.Doc <> '' then
    begin
      lblNumDoc.Caption := CR.Doc;
    end
      else
      begin
        lblNumDoc.Caption := 'N�o Informado';
      end;

    lblDesc.Caption         := Cr.Desc;
    lblVencimento.Caption   := FormatDateTime('DD/MM/YYYY', Cr.DataVencimento);
    lblNumParcela.Caption   := IntToStr(Cr.Parcela);
    lblValorVenda.Caption   := TUtilitario.FormatoMoeda(Cr.ValorVenda);
    lblValorParcela.Caption := TUtilitario.FormatoMoeda(Cr.ValorParcela);

  finally

    Cr.Free;

  end;

  //  Montando o SQL
  SQL := 'SELECT * FROM CONTAS_RECEBER_DETALHE CR' +
         ' LEFT JOIN USUARIOS US ON CR.USUARIO = US.ID ' +
         ' WHERE ID_CONTA_RECEBER = :IDCR';

  dmCReceber.FDQueryCrDetalhe.Close;
  dmCReceber.FDQueryCrDetalhe.SQL.Clear;
  dmCReceber.FDQueryCrDetalhe.Params.Clear;
  dmCReceber.FDQueryCrDetalhe.SQL.Add(SQL);

  dmCReceber.FDQueryCrDetalhe.ParamByName('IDCR').AsInteger := IDCR;
  dmCReceber.FDQueryCrDetalhe.Prepare;
  dmCReceber.FDQueryCrDetalhe.Open();

end;

end.