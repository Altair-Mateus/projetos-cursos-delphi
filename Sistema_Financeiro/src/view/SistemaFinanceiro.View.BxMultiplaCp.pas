unit SistemaFinanceiro.View.BxMultiplaCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.FaturaCartao, SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Model.dmFaturaCartao, Data.DB, Vcl.Grids, Vcl.DBGrids, System.DateUtils,
  Datasnap.DBClient, SistemaFinanceiro.View.FrPgto,
  SistemaFinanceiro.View.BxMultiCP.InfosBx;

type
  TfrmBxMultiplaCP = class(TForm)
    pnlFiltros: TPanel;
    pnlContas: TPanel;
    pnlBotoes: TPanel;
    dateInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dateFinal: TDateTimePicker;
    ImageList1: TImageList;
    btnVisualizar: TButton;
    edtFornecedor: TEdit;
    lblFornecedor: TLabel;
    btnPesquisaFornecedor: TButton;
    lblNomeFornecedor: TLabel;
    lblCodFatCartao: TLabel;
    edtCodFatCartao: TEdit;
    btnPesqFat: TButton;
    lblNomeFatCartao: TLabel;
    DataSourceBxMultiplaCP: TDataSource;
    btnConfirmar: TButton;
    btnSair: TButton;
    lblData: TLabel;
    cbData: TComboBox;
    pnlValorSelecionadas: TPanel;
    edtValorSel: TEdit;
    lblValorSelecionadas: TLabel;
    pnlQtdSelecionadas: TPanel;
    lblQtdSelecionada: TLabel;
    edtQtdSelecionada: TEdit;
    DBGrid1: TDBGrid;
    pnlQtdCp: TPanel;
    lblQtdCp: TLabel;
    edtQtdCp: TEdit;
    Panel2: TPanel;
    lblValorCps: TLabel;
    edtValorTotCP: TEdit;
    ImageList2: TImageList;
    pnlInfPag: TPanel;
    lblInfPag: TLabel;
    Label1: TLabel;
    lblValor: TLabel;
    lblDesconto: TLabel;
    lblValorDesc: TLabel;
    datePgto: TDateTimePicker;
    edtValor: TEdit;
    checkDesconto: TCheckBox;
    edtPorcDesc: TEdit;
    edtValorDesc: TEdit;
    lblCheckDesc: TLabel;
    checkParciais: TCheckBox;
    lblCheckParciais: TLabel;
    procedure btnPesquisaFornecedorClick(Sender: TObject);
    procedure btnPesqFatClick(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtCodFatCartaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtCodFatCartaoChange(Sender: TObject);
    procedure cbDataChange(Sender: TObject);
    procedure dateInicialChange(Sender: TObject);
    procedure dateFinalChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnConfirmarClick(Sender: TObject);
    procedure checkDescontoClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPorcDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPorcDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorDescKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure checkParciaisClick(Sender: TObject);
    procedure checkVencidasClick(Sender: TObject);

  private
    { Private declarations }
    procedure BuscaNomeFornecedor;
    procedure BuscaNomeFatCartao;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure Pesquisar;
    procedure CalcCpGrid;
    procedure CalcQtdCpGrid;
    procedure CalcQtdCpSel;

    function CalcCpSel : Currency;
    function CalcValorDesc : Currency;
    function CalcPorcentDesc : Currency;
    function CalcDescBx(ValorCP, ValorTot, ValorDesc : Currency) : Currency;


  public
    { Public declarations }
  end;

var
  frmBxMultiplaCP: TfrmBxMultiplaCP;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmCPagar, FireDAC.Stan.Param,
  SistemaFinanceiro.Utilitarios, SistemaFinanceiro.Model.Entidades.CP.Detalhe,
  SistemaFinanceiro.Model.dmFrPgto, SistemaFinanceiro.Model.dmUsuarios,
  SistemaFinanceiro.Model.dmPgtoBxCp;


procedure TfrmBxMultiplaCP.btnConfirmarClick(Sender: TObject);
var
  CpDetalhe         : TModelCpDetalhe;
  ValorCpSel        : Currency;
  ValorAbater       : Currency;
  ValorDesc         : Currency;
  ValorPgo          : Currency;
  Contador          : Integer;
  DtMaisAntiga      : TDateTime;
  DtCompraSel       : TDateTime;
  IndexDtMaisAntiga : Integer;
  FrPgto            : Integer;

begin

  //  Validações dos campos
//  if datePgto.Date > Date then
//  begin
//
//    datePgto.SetFocus;
//    Application.MessageBox('A data de pagamento não pode ser maior que a data atual!', 'Atenção', MB_OK + MB_ICONWARNING);
//    abort;
//
//  end;

  if DBGrid1.SelectedRows.Count > 0 then
  begin

    // Inicializa com o maior valor possível da data
    DtMaisAntiga := MaxDateTime;
    IndexDtMaisAntiga := -1;

    for Contador := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin

      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[Contador];

      //  Pega a data de compra
      DtCompraSel := DBGrid1.DataSource.DataSet.FieldByName('DATA_COMPRA').AsDateTime;

      if DtCompraSel < DtMaisAntiga then
      begin

        DtMaisAntiga := DtCompraSel;
        IndexDtMaisAntiga := Contador;

      end;

    end;


//    if datePgto.Date < DtMaisAntiga then
//    begin
//
//      datePgto.SetFocus;
//      Application.MessageBox('A data de pagamento não pode ser menor que a data da compra!', 'Atenção', MB_OK + MB_ICONWARNING);
//      abort;
//
//    end;

  end;

  ValorAbater := 0;
  ValorDesc   := 0;
  FrPgto      := 0;
  ValorCpSel  := 0;
  ValorPgo    := CalcCpSel;

//  if (not TryStrToCurr(edtValor.Text, ValorAbater)) or (ValorAbater <= 0)  then
//  begin
//    edtValor.SetFocus;
//    Application.MessageBox('Valor inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
//    abort;
//  end;
//
//  if ValorAbater > ValorCpCel then
//  begin
//    edtValor.SetFocus;
//    Application.MessageBox('Valor pago não pode ser maior que o valor das parcelas!', 'Atenção', MB_OK + MB_ICONWARNING);
//    abort;
//  end;
//
//  if checkDesconto.Checked then
//  begin
//
//    if (not TryStrToCurr(edtValorDesc.Text, ValorDesc)) or (ValorDesc > ValorCpCel) then
//    begin
//
//      edtValorDesc.SetFocus;
//      Application.MessageBox('Valor de desconto inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
//      abort;
//
//    end;
//
//  end;




  if DBGrid1.SelectedRows.Count > 0 then
  begin

    {Pega a data mais antiga}
    // Inicializa com o maior valor possível da data
    DtMaisAntiga := MaxDateTime;
    IndexDtMaisAntiga := -1;

    for Contador := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin

      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[Contador];

      //  Pega a data de compra
      DtCompraSel := DBGrid1.DataSource.DataSet.FieldByName('DATA_COMPRA').AsDateTime;

      if DtCompraSel < DtMaisAntiga then
      begin

        DtMaisAntiga := DtCompraSel;
        IndexDtMaisAntiga := Contador;

      end;

    end;


    {Chama a tela de Infos Baixa}
    try

      //  Cria o form
      frmInfoBxMultCp := TfrmInfoBxMultCp.Create(Self);

      //  Passa o valor total das contas selecionadas e a data da mais antiga
      frmInfoBxMultCp.ValorPago   := CalcCpSel;
      frmInfoBxMultCp.DtCpMaisAnt := DtMaisAntiga;

      //  Exibe o form
      frmInfoBxMultCp.ShowModal;

    except on E : Exception do

     Application.MessageBox(PWideChar(E.Message), 'Erro na forma de pagamento do documento!', MB_OK + MB_ICONWARNING);

    end;

    //  Verifica se deu tudo certo com as info de pgto
    if frmInfoBxMultCp.ModalResult <> mrOk then
    begin
      abort;
    end
    else
    begin

      FrPgto      := frmInfoBxMultCp.CodFrPgto;
      ValorAbater := frmInfoBxMultCp.ValorPago;
      ValorDesc   := frmInfoBxMultCp.ValorDesc;

      FreeAndNil(frmInfoBxMultCp);

    end;


    {Baixando as CPs}
    for Contador := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin

      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[Contador];

      CpDetalhe  := TModelCpDetalhe.Create;
      ValorCpSel := 0;

      try

        //  Pegando o valor da conta
        ValorCpSel := DBGrid1.DataSource.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;

        CpDetalhe.IdCP      := DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
        CpDetalhe.Detalhes  := 'CP baixada pela rotina de Baixa Múltipla';
        CpDetalhe.Data      := datePgto.Date;
        CpDetalhe.Usuario   := dmUsuarios.GetUsuarioLogado.Id;
        CpDetalhe.ValorDesc := CalcDescBx(ValorCpSel, ValorPgo, ValorDesc);

        showmessage(CurrToStr(CpDetalhe.ValorDesc));

        //  Valores pagos nas contas
        //  Aplica o desconto somente na primeira CP selecionada
//        if (Contador = 0) then
//        begin
//
//          CpDetalhe.ValorDesc := ValorDesc;
//          CpDetalhe.Valor     := ValorcpSel - ValorDesc;
//
//        end
//        else
//        begin

          if (ValorAbater - ValorCpSel) > 0 then
          begin

             //  Se for maior que 0 vai baixar a conta total
            CpDetalhe.Valor := (ValorCpSel - CpDetalhe.ValorDesc);

          end
          else if ValorAbater > 0 then
          begin

            //  Se ainda tiver ValorAbater mas não o suficiente
            //  para baicar toda a cp, ira baixar apenas o valor
            //  abater e o restante será gerado uma CP Parcial
            CpDetalhe.Valor := (ValorAbater - CpDetalhe.ValorDesc);

          end
          else
          begin

            //  Caso ainda tenha alguma CP selecionada porem
            //  ValorAbater já está zerado irá baixar a conta
            //  e irá gerar uma CP Parcial com o valor total
            CpDetalhe.Valor := 0;

          end;

//          showmessage('Valor abater antes' +  currtostr(valorabater));

          //  Se estiver na Bx da 1ª CP e tiver desconto
          //  Ira somar o valordesc no valor abater para
          //  que não acabe gerando duplicatas parcias
          //  sem precisar realmente gerar
//          if (Contador = 0) and (ValorDesc > 0) then
//          begin
//            ValorAbater := ValorAbater + ValorDesc;
//          end;

//        end;

        //  Calcula o restante do valor abater
        ValorAbater := ValorAbater - ValorCpSel;

//        showmessage('Valor abater depois' +  currtostr(valorabater));

        try

          dmCPagar.BaixarCP(CpDetalhe);
//          ShowMessage('entrou na baixa')

        except on E : Exception do
          Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento!', MB_OK + MB_ICONWARNING);
        end;


        try

          if dmPgtoBxCp.cdsPgtoBxCp.State in [dsBrowse, dsInactive] then
          begin
            dmPgtoBxCp.cdsPgtoBxCp.Insert;
          end;

          dmPgtoBxCp.GeraCodigo;
          dmPgtoBxCp.cdsPgtoBxCpID_CP.AsInteger       := CpDetalhe.IdCP ;
          dmPgtoBxCp.cdsPgtoBxCpID_FR_PGTO.AsInteger  := FrPgto;
          dmPgtoBxCp.cdsPgtoBxCpNR_FR.AsInteger       := 1;
          dmPgtoBxCp.cdsPgtoBxCpDATA_HORA.AsDateTime  := Now;
          dmPgtoBxCp.cdsPgtoBxCpVALOR_PAGO.AsCurrency := CpDetalhe.Valor;

          //  Gravando no banco
          dmPgtoBxCp.cdsPgtoBxCp.Post;
          dmPgtoBxCp.cdsPgtoBxCp.ApplyUpdates(0);

        except on E : Exception do
          Application.MessageBox(PWideChar(E.Message), 'Erro ao salvar Forma de pagamento!', MB_OK + MB_ICONWARNING)

        end;

      finally

        CpDetalhe.Free;

      end;

    end;

    Application.MessageBox('Contas baixadas com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);

  end
  else
  begin

     Application.MessageBox('Selecione uma ou mais contas!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

  end;

  Pesquisar;

end;

procedure TfrmBxMultiplaCP.btnPesqFatClick(Sender: TObject);
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtCodFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;
    edtCodFatCartao.SetFocus;

    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

end;


procedure TfrmBxMultiplaCP.btnPesquisaFornecedorClick(Sender: TObject);
begin

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do cliente selecionado
    edtFornecedor.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  edtFornecedor.SetFocus;

end;

procedure TfrmBxMultiplaCP.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBxMultiplaCP.btnVisualizarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.BuscaNomeFatCartao;
var
  NomeFatCartao : String;

begin

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    NomeFatCartao := dmFaturaCartao.GetNomeFatCartao(Trim(edtCodFatCartao.Text));

    if NomeFatCartao = '' then
    begin

      Application.MessageBox('Fatura de Cartão não encontrada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtCodFatCartao.SetFocus;
      edtCodFatCartao.Clear;
      abort;

    end;

    lblNomeFatCartao.Caption := NomeFatCartao;
    lblNomeFatCartao.Visible := True;

  end;

end;

procedure TfrmBxMultiplaCP.BuscaNomeFornecedor;
var
  NomeFornecedor : String;

begin

  if Trim(edtFornecedor.Text) <> '' then
  begin

    NomeFornecedor := dmFornecedores.GetNomeFornecedor(Trim(edtFornecedor.Text));

    if NomeFornecedor = '' then
    begin

      Application.MessageBox('Fornecedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtFornecedor.SetFocus;
      edtFornecedor.Clear;

    end;

    lblNomeFornecedor.Visible := True;
    lblNomeFornecedor.Caption := NomeFornecedor;

  end;

end;



procedure TfrmBxMultiplaCP.CalcCpGrid;
var
  TotalCp: Currency;

begin

  TotalCp := 0;

  //  Percorre e soma
  with DBGrid1.DataSource.DataSet do
  begin

    //  Desativa o controle
    DisableControls;

    //  Posiciona no primeiro reg
    First;

    while not Eof do
    begin

      TotalCp := TotalCp + FieldByName('VALOR_PARCELA').AsCurrency;

      Next;

    end;

    //  Reativa o controle
    EnableControls;

    edtValorTotCP.Text := TUtilitario.FormatoMoeda(TotalCp);

  end;

end;

function TfrmBxMultiplaCP.CalcCpSel : Currency;
var
  TotalCp: Currency;
  I : Integer;

begin

  TotalCp := 0.0;

   if DBGrid1.SelectedRows.Count > 0 then
   begin

    for I := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin

      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[I];
      TotalCp := TotalCp + DBGrid1.DataSource.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;

    end;

   end;

   Result := TotalCp;

end;

function TfrmBxMultiplaCP.CalcDescBx(ValorCP, ValorTot,
  ValorDesc: Currency): Currency;
var
  PercentCp   : Currency;
  ValorDescCp : Currency;

begin

  PercentCp   := 0;
  ValorDescCp := 0;
  Result      := 0;

  if (ValorCP < 0) then
  begin
    Application.MessageBox('Valor Conta a Pagar < 0!', 'Atenção', MB_OK + MB_ICONWARNING);
  end
  else if (ValorTot < 0)  then
  begin
    Application.MessageBox('Valor Total das Contas < 0!', 'Atenção', MB_OK + MB_ICONWARNING);
  end
  else if (ValorDesc < 0) then
  begin
    Application.MessageBox('Valor Desconto < 0!', 'Atenção', MB_OK + MB_ICONWARNING);
  end
  else
  begin

    //  Descobre o percentual da conta
    PercentCp := (ValorCP / ValorTot);

    //  Descobre o valor do desconto para a conta
    ValorDescCp := (PercentCp * ValorDesc);

    Result := ValorDescCp;

  end;

end;

function TfrmBxMultiplaCP.CalcPorcentDesc: Currency;
var
  ValorFinal : Currency;
  PorcentDesc : Currency;
  ValorDesc : Currency;
  ValorCp : Currency;

begin

  ValorCp     := CalcCpSel;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;
  Result      := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if PorcentDesc > 0 then
    begin

      //  Calcula o valor do desconto
      ValorDesc := (PorcentDesc / 100) * ValorCp;

      //  Atribui o valor do desconto ao campo
      edtValorDesc.Text := CurrToStr(ValorDesc);

      //  Calcula o valor final
      ValorFinal := ValorCp - ValorDesc;

      //  retorna o valor final
      Result := ValorFinal;

    end;


end;

procedure TfrmBxMultiplaCP.CalcQtdCpGrid;
var
  QtdCp: Integer;

begin

  QtdCp := 0;

  //  Realiza a conta
  QtdCp := DBGrid1.DataSource.DataSet.RecordCount;

  //  Exibe na label
  edtQtdCp.Text := IntToStr(QtdCp);

end;

procedure TfrmBxMultiplaCP.CalcQtdCpSel;
begin

  if Assigned(DBGrid1.SelectedRows) then
  begin

    //  Exibe no edit
    edtQtdSelecionada.Text := IntToStr(DBGrid1.SelectedRows.Count);

  end;

end;

function TfrmBxMultiplaCP.CalcValorDesc: Currency;
var
  ValorCp     : Currency;
  ValorDesc   : Currency;
  ValorFinal : Currency;
  PorcentDesc : Currency;

begin

  Result := 0;

  ValorCp := CalcCpSel;
  ValorDesc   := 0;
  ValorFinal  := 0;
  PorcentDesc := 0;

  TryStrToCurr(edtPorcDesc.Text, PorcentDesc);
  TryStrToCurr(edtValorDesc.Text, ValorDesc);

  if ValorDesc > 0 then
  begin

    //  Calcula a porcentagem de desconto
    PorcentDesc := (ValorDesc / ValorCp) * 100;

    //  Atribui a porcentagem no campo
    edtPorcDesc.Text := CurrToStr(PorcentDesc);

    //  Calcula o valor final
    ValorFinal := ValorCp - ValorDesc;

    //  retorna o valor final
    Result := ValorFinal;

  end;

end;

procedure TfrmBxMultiplaCP.cbDataChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.checkDescontoClick(Sender: TObject);
begin

  if checkDesconto.Checked then
  begin

    //  Libera e mostra os campos do desconto
    edtValorDesc.Enabled := True;
    edtValorDesc.Visible := True;
    edtPorcDesc.Visible  := True;
    edtPorcDesc.Enabled  := True;
    lblDesconto.Visible  := True;
    lblValorDesc.Visible := True;

  end
  else
  begin

    //  Bloqueia e oculta os campos do desconto
    edtValorDesc.Enabled := False;
    edtValorDesc.Visible := False;
    edtPorcDesc.Visible  := False;
    edtPorcDesc.Enabled  := False;
    lblDesconto.Visible  := False;
    lblValorDesc.Visible := False;


  end;

end;

procedure TfrmBxMultiplaCP.checkParciaisClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.checkVencidasClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.dateFinalChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.dateInicialChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCP.DBGrid1CellClick(Column: TColumn);
begin

//  if Column.Field = dmCPagar.cdsBxMultiplaSELECIONADO then
//  begin
//
//    dmCPagar.cdsBxMultipla.Edit;
//
//    dmCPagar.cdsBxMultiplaSELECIONADO.AsString := 'S';
//
////    dmCPagar.cdsBxMultipla.ApplyUpdates(0);
////
////    DBGrid1.Refresh;
//
//    CalcCpSel;
//    CalcQtdCpSel;
//
//  end;

  edtValorSel.Text := TUtilitario.FormatoMoeda(CalcCpSel);
  CalcQtdCpSel;
  edtValor.Text := Currtostr(CalccpSel);

end;

procedure TfrmBxMultiplaCP.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  //  Altera a cor das duplicatas vencidas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
      (DBGrid1.DataSource.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < Date)
      and (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'A')then
  begin
    DBGrid1.Canvas.Font.Color := clRed;  // Define a cor do texto da célula
  end;

  if (gdSelected in State) then
  begin

    DBGrid1.Canvas.Brush.Color := $00578B2E;  // Define a cor de fundo da célula selecionada
    DBGrid1.Canvas.Font.Color := clWhite;  // Define a cor do texto da célula selecionada

  end;



  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

//  if Column.Field = DBGrid1.DataSource.DataSet.FieldByName('SELECIONADO') then
//  begin
//    Column.Font.Size := 1;
//    Column.Font.Color := clWhite;
//    if (DBGrid1.DataSource.DataSet.FieldByName('SELECIONADO').AsString = 'S') then
//    begin
//      ImageList2.Draw(DBGrid1.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
//    end
//    else
//    begin
//      ImageList2.Draw(DBGrid1.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
//    end;
//  end;

end;

procedure TfrmBxMultiplaCP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_DOWN then
  begin

    edtValorSel.Text := TUtilitario.FormatoMoeda(CalcCpSel);
    CalcQtdCpSel;

  end;

end;

procedure TfrmBxMultiplaCP.EditKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
    //  Verifica se a tecla pressionada é o Enter
    //  Cancela o efeito do enter
    Key := #0;
    //  Pula para o proximo
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmBxMultiplaCP.edtCodFatCartaoChange(Sender: TObject);
begin

  if not ((GetKeyState(VK_BACK) and $8000) <> 0) then
  begin
    Pesquisar;
  end;

end;

procedure TfrmBxMultiplaCP.edtCodFatCartaoExit(Sender: TObject);
begin

  BuscaNomeFatCartao;

  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    if dmFaturaCartao.GetStatusFatCartao(Trim(edtCodFatCartao.Text)) = False then
    begin

      edtCodFatCartao.Clear;
      edtCodFatCartao.SetFocus;
      lblNomeFatCartao.Caption := '';
      Application.MessageBox('Fatura de Cartão não está Ativa, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;

  end;

end;



procedure TfrmBxMultiplaCP.edtFornecedorChange(Sender: TObject);
begin

  if not ((GetKeyState(VK_BACK) and $8000) <> 0) then
  begin
    Pesquisar;
  end;

end;

procedure TfrmBxMultiplaCP.edtFornecedorExit(Sender: TObject);
begin

  BuscaNomeFornecedor;

  if Trim(edtFornecedor.Text) <> '' then
  begin

    if dmFornecedores.GetStatus(Trim(edtFornecedor.Text)) = False then
    begin

      edtFornecedor.Clear;
      edtFornecedor.SetFocus;
      lblNomeFornecedor.Caption := '';
      Application.MessageBox('Fornecedor não está Ativo, verifique o cadastro!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      abort;

    end;


  end;

end;

procedure TfrmBxMultiplaCP.edtPorcDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmBxMultiplaCP.edtPorcDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcPorcentDesc);
end;

procedure TfrmBxMultiplaCP.edtValorDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmBxMultiplaCP.edtValorDescKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtValor.Text := CurrToStr(CalcValorDesc);
end;

procedure TfrmBxMultiplaCP.edtValorExit(Sender: TObject);
begin
  edtValor.Text := TUtilitario.FormatarValor(Trim(edtValor.Text));
end;


procedure TfrmBxMultiplaCP.FormCreate(Sender: TObject);
var
  I : Integer;

begin

  //  Percorre os componentes TEdit
  for I := 0 to ComponentCount - 1 do
  begin

    if (Components[I] is TEdit) or (Components[I] is TDateTimePicker) then
    begin
      //  Cria o evento OnKeyPress para cada Edit encontrado
      TEdit(Components[I]).OnKeyPress := EditKeyPress;
    end;

  end;

  //  Define as datas da consulta
  dateInicial.Date := StartOfTheMonth(Now);
  dateFinal.Date   := EndOfTheMonth(Now);

  datePgto.Date := Now;

end;

procedure TfrmBxMultiplaCP.FormShow(Sender: TObject);
begin

  //  Fecha o dataset para limpar o dbgrid;
  if Assigned(DataSourceBxMultiplaCP) and Assigned(DataSourceBxMultiplaCP.DataSet) then
  begin
    DataSourceBxMultiplaCP.DataSet.Close; // Fecha o conjunto de dados
  end;

end;

procedure TfrmBxMultiplaCP.Pesquisar;
var
  LFiltro    : String;
  LOrdem     : String;

begin

  //  Validações
  if dateInicial.Date > dateFinal.Date then
  begin

    dateFinal.SetFocus;
    Application.MessageBox('Data Inicial não pode ser maior que a data Final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbData.ItemIndex < 0 then
   begin

    cbData.SetFocus;
    Application.MessageBox('Selecione um tipo de DATA!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if (Trim(edtFornecedor.Text) = '' ) and (Trim(edtCodFatCartao.Text) = '') then
  begin

    edtFornecedor.SetFocus;
    Application.MessageBox('Defina um Código de Fornecedor ou de Fatura de Cartão!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  LFiltro     := '';
  LOrdem      := '';

  //  Limpa os parametros do cds
  dmCPagar.cdsBxMultipla.Params.Clear;

  //  Pesquisa por data
  if (dateInicial.Checked) and (dateFinal.Checked) then
  begin

    case cbData.ItemIndex of

      0 : LFiltro := LFiltro + ' AND CP.DATA_COMPRA BETWEEN :DTINI AND :DTFIM ';
      1 : LFiltro := LFiltro + ' AND CP.DATA_VENCIMENTO BETWEEN :DTINI AND :DTFIM ';

    end;


    //  Criando os parametros
    dmCPagar.cdsBxMultipla.Params.CreateParam(ftDate, 'DTINI', ptInput);
    dmCPagar.cdsBxMultipla.ParamByName('DTINI').AsDateTime := dateInicial.Date;
    dmCPagar.cdsBxMultipla.Params.CreateParam(ftDate, 'DTFIM', ptInput);
    dmCPagar.cdsBxMultipla.ParamByName('DTFIM').AsDateTime := dateFinal.Date;

  end;

  //  Pesquisa parciais
  if checkParciais.Checked then
  begin
    LFiltro := LFiltro + ' AND CP.PARCIAL = ''S'' ';
  end;

  //  Pesquisa por FORNECEDORES
  if Trim(edtFornecedor.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FORNECEDOR = :ID ';

    //  Criando os parametros
    dmCPagar.cdsBxMultipla.Params.CreateParam(TFieldType.ftString, 'ID', TParamType.ptInput);
    dmCPagar.cdsBxMultipla.ParamByName('ID').AsString := Trim(edtFornecedor.Text);

  end;

  //  Pesquisa por Fatura de Cartao
  if Trim(edtCodFatCartao.Text) <> '' then
  begin

    LFiltro := LFiltro + ' AND CP.ID_FATURA = :ID_FT ';

    //  Criando os parametros
    dmCPagar.cdsBxMultipla.Params.CreateParam(TFieldType.ftString, 'ID_FT', TParamType.ptInput);
    dmCPagar.cdsBxMultipla.ParamByName('ID_FT').AsString := Trim(edtCodFatCartao.Text);

  end;

  //  Ordem de pesquisa
  lOrdem := ' ORDER BY CP.DATA_VENCIMENTO';

  dmCPagar.cdsBxMultipla.Close;
  dmCPagar.cdsBxMultipla.CommandText := 'SELECT CP.*, '''' SELECIONADO, F.RAZAO_SOCIAL FROM CONTAS_PAGAR CP ' +
                                    'LEFT JOIN FORNECEDORES F ON CP.ID_FORNECEDOR = F.ID_FORNEC WHERE STATUS = ''A'' ' +
                                     LFiltro + lOrdem;
  dmCPagar.cdsBxMultipla.Open;


  //  Calcula a quantidade e valor
  CalcCpGrid;
  CalcQtdCpGrid;

end;

end.
