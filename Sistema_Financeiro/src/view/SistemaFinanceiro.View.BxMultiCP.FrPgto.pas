unit SistemaFinanceiro.View.BxMultiCP.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.View.FrPgto;

type
  TfrmFrPgtoBxMultiCp = class(TForm)
    pnlBotoes: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlForma: TPanel;
    lblCodFrPgto: TLabel;
    lblValorForma: TLabel;
    lblValorTotalCr: TLabel;
    lblValorRest: TLabel;
    lblNomeFrPgto: TLabel;
    edtCodFrPgto: TEdit;
    btnPesqFrPgto: TButton;
    edtValorForma: TEdit;
    edtValorCp: TEdit;
    edtValorRest: TEdit;
    btnAdiciona: TButton;
    btnLimpar: TButton;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    cdsFrPgto: TClientDataSet;
    cdsFrPgtoID_FR: TIntegerField;
    cdsFrPgtoNOME: TWideStringField;
    cdsFrPgtoVALORPAGO: TCurrencyField;
    dsFrPgto: TDataSource;
    procedure btnPesqFrPgtoClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtCodFrPgtoExit(Sender: TObject);
    procedure edtValorFormaEnter(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ValorDesc : Currency;
    DataSetCp : TDataSet;
    DBGridCp: TDBGrid;
    procedure BuscaNomeFrPgto;

  public
    { Public declarations }
    procedure FrPgtoCP(ValorCp, Desc : Currency; DBGrid: TDBGrid);

  end;

var
  frmFrPgtoBxMultiCp: TfrmFrPgtoBxMultiCp;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFrPgto, SistemaFinanceiro.Model.dmPgtoBxCp;

procedure TfrmFrPgtoBxMultiCp.btnAdicionaClick(Sender: TObject);
var
  ValorForma : Currency;
  ValorRest  : Currency;
  ValorCp    : Currency;

begin

  //  Valida Campos
  if (not TryStrToCurr(edtValorCp.Text, ValorCp)) or (ValorCp <= 0) then
  begin
    Application.MessageBox('Valor da Conta a Pagar Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if not TryStrToCurr(edtValorRest.Text, ValorRest) then
  begin
    Application.MessageBox('Valor Restante Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if (not TryStrToCurr(edtValorForma.Text, ValorForma)) or (ValorForma <= 0) then
  begin
    edtValorForma.SetFocus;
    Application.MessageBox('Valor da Forma Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if Trim(edtCodFrPgto.Text) = '' then
  begin

    edtCodFrPgto.SetFocus;
    Application.MessageBox('Forma de Pagamento não informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;

  if (ValorForma > ValorCp) or (ValorForma > ValorRest) then
  begin

    edtValorForma.Clear;
    edtValorForma.SetFocus;
    Application.MessageBox('Valor da Forma não pode ser maior que o valor da conta!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;



  //  Calculando o valor restante
  ValorRest         := ValorRest - ValorForma;
  edtValorRest.Text := CurrToStr(ValorRest);

  //  Coloca o dataset em modo de inserção
  cdsFrPgto.Insert;

  //  Alimenta as colunas
  cdsFrPgtoid_fr.AsString       := Trim(edtCodFrPgto.Text);
  cdsFrPgtoNome.AsString        := lblNomeFrPgto.Caption;
  cdsFrPgtovalorpago.AsCurrency := ValorForma;

  // Salva no data set
  cdsFrPgto.Post;


  edtValorForma.Clear;
  edtCodFrPgto.Clear;
  edtCodFrPgto.SetFocus;
  lblNomeFrPgto.Caption:= '';

  if ValorRest = 0 then
  begin
    btnConfirmar.SetFocus;
  end;


end;

procedure TfrmFrPgtoBxMultiCp.btnConfirmarClick(Sender: TObject);
var
  ContadorFr : Integer;
  ContadorCp : Integer;
  TotalPgtos : Currency;
  ValorCp    : Currency;
  ValorCpSel : Currency;

begin

  TotalPgtos := 0;
  ContadorFr := 0;

  //  Valida valor Cp
  if (not TryStrToCurr(edtValorCp.Text, ValorCp)) or (ValorCp <= 0) then
  begin
    Application.MessageBox('Valor da Conta a Pagar Inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;
  end;

  if cdsFrPgto.IsEmpty then
  begin

    Application.MessageBox('Nenhuma forma de pagamento informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;


  // Coloca na primeira posição do dataset
  cdsFrPgto.First;

  //  Soma o total das formas de pagamento
  while not cdsFrPgto.Eof do
  begin

    TotalPgtos := TotalPgtos + cdsFrPgto.FieldByName('VALORPAGO').AsCurrency;

    cdsFrPgto.Next;

  end;

  //  Compara o valor total e o valor da conta
  if TotalPgtos < ValorCp then
  begin

    Application.MessageBox('Valor das formas de pagamento menor que o valor da conta!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    abort;

  end;


  // Coloca na primeira posição do dataset
  cdsFrPgto.First;

  //  Gravando as formas de pagamento
  if DBGridCp.SelectedRows.Count > 0 then
  begin

    for ContadorCp := 0 to DBGridCp.SelectedRows.Count - 1 do
    begin

      DBGridCp.DataSource.DataSet.Bookmark := DBGridCp.SelectedRows[ContadorCp];

      //  Pegando o valor da conta
      ValorCpSel := DBGridCp.DataSource.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;

      while not cdsFrPgto.Eof do
      begin

        ContadorFr := ContadorFr + 1;

        if dmPgtoBxCp.cdsPgtoBxCp.State in [dsBrowse, dsInactive] then
        begin
          dmPgtoBxCp.cdsPgtoBxCp.Insert;
        end;

        dmPgtoBxCp.GeraCodigo;
        dmPgtoBxCp.cdsPgtoBxCpID_CP.AsInteger       := DBGridCp.DataSource.DataSet.FieldByName('ID').AsInteger;
        dmPgtoBxCp.cdsPgtoBxCpID_FR_PGTO.AsInteger  := cdsFrPgtoID_FR.AsInteger;
        dmPgtoBxCp.cdsPgtoBxCpNR_FR.AsInteger       := ContadorFr;
        dmPgtoBxCp.cdsPgtoBxCpDATA_HORA.AsDateTime  := Now;

//        dmPgtoBxCp.cdsPgtoBxCpVALOR_PAGO.AsCurrency := cdsFrPgtoVALORPAGO.AsCurrency;

         //  Valores pagos nas contas
        //  Aplica o desconto somente na primeira CP selecionada
        if (ContadorCp = 0) then
        begin

          dmPgtoBxCp.cdsPgtoBxCpVALOR_PAGO.AsCurrency := ValorcpSel - ValorDesc;

        end
        else
        begin

          if (ValorAbater - ValorCpSel) > 0 then
          begin

             //  Se for maior que 0 vai baixar a conta total
            CpDetalhe.Valor := ValorCpSel;

          end
          else if ValorAbater > 0 then
          begin

            //  Se ainda tiver ValorAbater mas não o suficiente
            //  para baicar toda a cp, ira baixar apenas o valor
            //  abater e o restante será gerado uma CP Parcial
            CpDetalhe.Valor := ValorAbater;

          end
          else
          begin

            //  Caso ainda tenha alguma CP selecionada porem
            //  ValorAbater já está zerado irá baixar a conta
            //  e irá gerar uma CP Parcial com o valor total
            CpDetalhe.Valor := 0;

          end;



        //  Gravando no banco
        dmPgtoBxCp.cdsPgtoBxCp.Post;
        dmPgtoBxCp.cdsPgtoBxCp.ApplyUpdates(0);

        cdsFrPgto.Next;

      end;

    end;
  end;

  //  Fecha a tela
  ModalResult := mrOk;


//  if not DBGridCp.DataSource.DataSet.IsEmpty then
//  begin
//
//    if DBGridCp.SelectedRows.Count > 0 then
//    begin
//
//      for Contador := 0 to DBGridCp.SelectedRows.Count - 1 do
//      begin
//
//        DBGridCp.DataSource.DataSet.Bookmark := DBGridCp.SelectedRows[Contador];
//
//        ShowMessage(DBGridCp.DataSource.DataSet.FieldByName('ID').AsString);
//      end;
//
//    end;
//
//  end;



end;

procedure TfrmFrPgtoBxMultiCp.btnLimparClick(Sender: TObject);
begin

  cdsFrPgto.EmptyDataSet;

  //  Reinicia o valor restante
  edtValorRest.Text := Trim(edtValorCp.Text);

  //  Limpa os campos
  edtCodFrPgto.Clear;
  edtValorForma.Clear;
  lblNomeFrPgto.Caption := '';

  edtCodFrPgto.SetFocus;

end;

procedure TfrmFrPgtoBxMultiCp.btnPesqFrPgtoClick(Sender: TObject);
begin

  //  Cria o form
  frmFrPgto := TfrmFrPgto.Create(Self);

  try

    //  Exibe o form
    frmFrPgto.ShowModal;

  finally

    //  Pega a ID da forma de pgto selecionado
    edtCodFrPgto.Text := frmFrPgto.DataSourceFrPgto.DataSet.FieldByName('ID_FR').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFrPgto);

  end;

  edtCodFrPgto.SetFocus;

end;

procedure TfrmFrPgtoBxMultiCp.BuscaNomeFrPgto;
var
  NomeFrPgto : String;

begin

  if Trim(edtCodFrPgto.Text) <> '' then
  begin

    NomeFrPgto := dmFrPgto.GetNomeFrPgto(Trim(edtCodFrPgto.Text));

    if (Trim(edtCodFrPgto.Text) = '') or (NomeFrPgto = '') then
    begin

      Application.MessageBox('Forma de Pagamento não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFrPgto.SetFocus;
      edtCodFrPgto.Clear;

    end;

    lblNomeFrPgto.Visible := True;
    lblNomeFrPgto.Caption := NomeFrPgto;

  end;


end;

procedure TfrmFrPgtoBxMultiCp.edtCodFrPgtoExit(Sender: TObject);
begin

  BuscaNomeFrPgto;

  if Trim(edtCodFrPgto.Text) <> '' then
  begin
    if dmFrPgto.GetStatus(Trim(edtCodFrPgto.Text)) = False then
    begin

      edtCodFrPgto.Clear;
      edtCodFrPgto.SetFocus;
      lblNomeFrPgto.Caption := '';
      Application.MessageBox('Forma de Pagamento não está Ativa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;
  end;

end;

procedure TfrmFrPgtoBxMultiCp.edtValorFormaEnter(Sender: TObject);
begin

  //  Assume previamente o valor total da Cp
  edtValorForma.Text := edtValorRest.Text;

end;

procedure TfrmFrPgtoBxMultiCp.FrPgtoCP(ValorCp, Desc: Currency; DBGrid: TDBGrid);
begin

  if ValorCp <= 0 then
  begin
    raise Exception.Create('Valor da Conta a Pagar Inválido!');
  end;

  if ValorDesc < 0 then
  begin
    raise Exception.Create('Valor do Desconto Inválido!');
  end;

  ValorDesc := Desc;
  DBGridCp := DBGrid;

  // Puxa o valor da Cp
  edtValorCp.Text   := CurrToStr(ValorCp);
  edtValorRest.Text := CurrToStr(ValorCp);

  edtValorForma.Clear;


end;

end.
