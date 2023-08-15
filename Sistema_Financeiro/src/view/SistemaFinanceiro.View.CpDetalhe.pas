unit SistemaFinanceiro.View.CpDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmCpDetalhe = class(TForm)
    ImageList1: TImageList;
    pnlBotoes: TPanel;
    btnSair: TButton;
    pnlGrid: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    pnlPesquisa: TPanel;
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
    DataSourceCPDetalhe: TDataSource;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibirCPDetalhes(IDCp : integer);
  end;

var
  frmCpDetalhe: TfrmCpDetalhe;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCPagar,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe,
  SistemaFinanceiro.Model.Entidades.CP, SistemaFinanceiro.Utilitarios;

{ TfrmCpDetalhe }

procedure TfrmCpDetalhe.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCpDetalhe.ExibirCPDetalhes(IDCp: integer);
var
  Cp : TModelCp;
  SQL : String;

begin

  if IDCp <= 0 then
  begin
    raise Exception.Create('ID do contas a pagar inválido!');
  end;

  Cp := dmCPagar.GetCp(IDCp);

  try

    if Cp.ID.IsEmpty then
    begin
      raise Exception.Create('Conta a pagar não encontrado!');
    end;

    //  Carrega os dados da CR
    if Cp.Doc <> '' then
    begin
      lblNumDoc.Caption := Cp.Doc;
    end
      else
      begin
        lblNumDoc.Caption := 'Não Informado';
      end;

    lblDesc.Caption         := Cp.Desc;
    lblVencimento.Caption   := FormatDateTime('DD/MM/YYYY', Cp.DataVencimento);
    lblNumParcela.Caption   := IntToStr(Cp.Parcela);
    lblValorVenda.Caption   := TUtilitario.FormatoMoeda(Cp.ValorCompra);
    lblValorParcela.Caption := TUtilitario.FormatoMoeda(Cp.ValorParcela);

  finally

    Cp.Free;

  end;

  //  Montando o SQL
  SQL := 'SELECT * FROM CONTAS_PAGAR_DETALHE CP' +
         ' LEFT JOIN USUARIOS US ON CP.USUARIO = US.ID ' +
         ' WHERE ID_CONTA_PAGAR = :IDCP';



  dmCPagar.FDQueryCpDetalhes.Close;
  dmCPagar.FDQueryCpDetalhes.SQL.Clear;
  dmCPagar.FDQueryCpDetalhes.Params.Clear;
  dmCPagar.FDQueryCpDetalhes.SQL.Add(SQL);

  dmCPagar.FDQueryCpDetalhes.ParamByName('IDCP').AsInteger := IDCp;
  dmCPagar.FDQueryCpDetalhes.Prepare;
  dmCPagar.FDQueryCpDetalhes.Open();

end;



end.
