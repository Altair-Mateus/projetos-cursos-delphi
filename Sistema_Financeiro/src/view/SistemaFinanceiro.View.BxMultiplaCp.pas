unit SistemaFinanceiro.View.BxMultiplaCp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList,
  SistemaFinanceiro.View.Fornecedores,
  SistemaFinanceiro.View.FaturaCartao,
  SistemaFinanceiro.Model.dmFornecedores,
  SistemaFinanceiro.Model.dmFaturaCartao,
  Data.DB, Vcl.Grids, Vcl.DBGrids, System.DateUtils,
  Datasnap.DBClient, SistemaFinanceiro.View.FrPgto,
  SistemaFinanceiro.View.BxMulti.InfosBx;

type
  TfrmBxMultiplaCp = class(TForm)
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
    pnlQtdTotCP: TPanel;
    lblValorCps: TLabel;
    edtValorTotCP: TEdit;
    ImageList2: TImageList;
    checkParciais: TCheckBox;
    lblCheckParciais: TLabel;
    checkSelAll: TCheckBox;
    lblCheckSelAll: TLabel;
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
    procedure dateInicialChange(Sender: TObject);
    procedure dateFinalChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure checkParciaisClick(Sender: TObject);
    procedure checkSelAllClick(Sender: TObject);
    procedure cbDataClick(Sender: TObject);

  private
    { Private declarations }
    procedure BuscaNomeFornecedor;
    procedure BuscaNomeFatCartao;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure SelAllReg(DBGrid: TDBGrid);
    procedure Pesquisar;
    procedure CalcCpGrid;
    procedure CalcQtdCpGrid;
    procedure CalcQtdCpSel;

    function CalcCpSel : Currency;
    function CalcDescBx(ValorCP, ValorTot, ValorDesc : Currency) : Currency;


  public
    { Public declarations }
  end;

var
  frmBxMultiplaCp: TfrmBxMultiplaCp;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmCPagar,
  FireDAC.Stan.Param,
  SistemaFinanceiro.Utilitarios,
  SistemaFinanceiro.Model.Entidades.CP.Detalhe,
  SistemaFinanceiro.Model.dmFrPgto,
  SistemaFinanceiro.Model.dmUsuarios,
  SistemaFinanceiro.Model.dmPgtoBxCp;


procedure TfrmBxMultiplaCp.btnConfirmarClick(Sender: TObject);
var
  CpDetalhe         : TModelCpDetalhe;
  ValorCpSel        : Currency;
  ValorAbater       : Currency;
  ValorDesc         : Currency;
  ValorTotCpSel     : Currency;
  Contador          : Integer;
  DtMaisAntiga      : TDateTime;
  DtCompraSel       : TDateTime;
  FrPgto            : Integer;
  DtPgto            : TDateTime;

begin

  //  Inicialização das variaveis
  ValorAbater   := 0;
  ValorDesc     := 0;
  FrPgto        := 0;
  ValorCpSel    := 0;
  ValorTotCpSel := CalcCpSel;
  DtPgto        := MaxDateTime;


  if DBGrid1.SelectedRows.Count > 0 then
  begin

    {Pega a data mais antiga}
    // Inicializa com o maior valor possível da data
    DtMaisAntiga      := MaxDateTime;

    for Contador := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin

      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[Contador];

      //  Pega a data de compra
      DtCompraSel := DBGrid1.DataSource.DataSet.FieldByName('DATA_COMPRA').AsDateTime;

      if DtCompraSel < DtMaisAntiga then
      begin

        DtMaisAntiga      := DtCompraSel;

      end;

    end;


    {Chama a tela de Infos Baixa}
    try

      //  Cria o form
      frmInfoBxMult := TfrmInfoBxMult.Create(Self);

      //  Passa o valor total das contas selecionadas e a data da mais antiga
      frmInfoBxMult.ValorPago   := CalcCpSel;
      frmInfoBxMult.DtMaisAnt   := DtMaisAntiga;

      //  Exibe o form
      frmInfoBxMult.ShowModal;

    except on E : Exception do

     Application.MessageBox(PWideChar(E.Message), 'Erro na forma de pagamento do documento!', MB_OK + MB_ICONWARNING);

    end;

    //  Verifica se deu tudo certo com as info de pgto
    if frmInfoBxMult.ModalResult <> mrOk then
    begin
      abort;
    end
    else
    begin

      FrPgto      := frmInfoBxMult.CodFrPgto;
      ValorAbater := frmInfoBxMult.ValorPago;
      ValorDesc   := frmInfoBxMult.ValorDesc;
      DtPgto      := frmInfoBxMult.DataPgto;

      FreeAndNil(frmInfoBxMult);

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
        CpDetalhe.Data      := DtPgto;
        CpDetalhe.Usuario   := dmUsuarios.GetUsuarioLogado.Id;
        CpDetalhe.ValorDesc := CalcDescBx(ValorCpSel, ValorTotCpSel, ValorDesc);


        if (ValorAbater - (ValorCpSel - CpDetalhe.ValorDesc)) > 0 then
        begin

          //  Se for maior que 0 vai baixar a conta total
          CpDetalhe.Valor := (ValorCpSel - CpDetalhe.ValorDesc);

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

        //  Calcula o restante do valor abater
        ValorAbater := (ValorAbater - (ValorCpSel - CpDetalhe.ValorDesc));

        {Enviando a cp para ser baixada}
        try

          dmCPagar.BaixarCP(CpDetalhe);

        except on E : Exception do
          Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento!', MB_OK + MB_ICONWARNING);
        end;


        {Gravando a forma de pgto}
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

  //  Desmarca os checks e atualiza o grid
  checkParciais.Checked := False;
  checkSelAll.Checked   := False;

  Pesquisar;

end;

procedure TfrmBxMultiplaCp.btnPesqFatClick(Sender: TObject);
begin

  //  Cria o form
  frmFaturaCartao := TfrmFaturaCartao.Create(Self);

  try

    //  Exibe o form
    frmFaturaCartao.ShowModal;

  finally

    //  Pega a Id da fatura selecionada
    edtCodFatCartao.Text := frmFaturaCartao.DataSourceFaturaCartao.DataSet.FieldByName('ID_FT').AsString;


    //  Libera da memória
    FreeAndNil(frmFaturaCartao);

  end;

  edtCodFatCartao.SetFocus;

end;


procedure TfrmBxMultiplaCp.btnPesquisaFornecedorClick(Sender: TObject);
begin

  //  Cria o form
  frmFornecedores := TfrmFornecedores.Create(Self);

  try

    //  Exibe o form
    frmFornecedores.ShowModal;

  finally

    //  Pega a ID do fornecedor selecionado
    edtFornecedor.Text := frmFornecedores.DataSourceFornecedor.DataSet.FieldByName('ID_FORNEC').AsString;

    //  Libera da  memoria
    FreeAndNil(frmFornecedores);

  end;

  edtFornecedor.SetFocus;

end;

procedure TfrmBxMultiplaCp.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBxMultiplaCp.btnVisualizarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCp.BuscaNomeFatCartao;
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

procedure TfrmBxMultiplaCp.BuscaNomeFornecedor;
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



procedure TfrmBxMultiplaCp.CalcCpGrid;
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

function TfrmBxMultiplaCp.CalcCpSel : Currency;
var
  I, OriginalRecNo: Integer;

begin

  Result := 0.0;

  if DBGrid1.SelectedRows.Count > 0 then
  begin

    // Salvar o RecNo original
    OriginalRecNo := DBGrid1.DataSource.DataSet.RecNo;

    try
      for I := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin

        // Alterar para o Bookmark do item selecionado
        DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[I];

        // Adicionar ao resultado
        Result := Result + DBGrid1.DataSource.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;

      end;
    finally

      // Restaurar o RecNo original
      DBGrid1.DataSource.DataSet.RecNo := OriginalRecNo;

    end;
  end;


end;


function TfrmBxMultiplaCp.CalcDescBx(ValorCP, ValorTot,
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

procedure TfrmBxMultiplaCp.CalcQtdCpGrid;
var
  QtdCp: Integer;

begin

  QtdCp := 0;

  //  Realiza a conta
  QtdCp := DBGrid1.DataSource.DataSet.RecordCount;

  //  Exibe na label
  edtQtdCp.Text := IntToStr(QtdCp);

end;

procedure TfrmBxMultiplaCp.CalcQtdCpSel;
begin

    if Assigned(DBGrid1.SelectedRows) then
    begin

      //  Exibe no edit
      edtQtdSelecionada.Text := IntToStr(DBGrid1.SelectedRows.Count);

    end;

end;



procedure TfrmBxMultiplaCp.cbDataClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCp.checkParciaisClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCp.checkSelAllClick(Sender: TObject);
begin

  //  Seleciona todas as contas no dbgrid
  SelAllReg(DBGrid1);

  //  Exibe o valor total das selecionadas
  edtValorSel.Text := TUtilitario.FormatoMoeda(CalcCpSel);
  CalcQtdCpSel;

end;

procedure TfrmBxMultiplaCp.dateFinalChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCp.dateInicialChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmBxMultiplaCp.DBGrid1CellClick(Column: TColumn);
begin

  //  Atualiza valores e quantidades de cps selecionadas
  edtValorSel.Text := TUtilitario.FormatoMoeda(CalcCpSel);
  CalcQtdCpSel;

end;

procedure TfrmBxMultiplaCp.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  //  Altera a cor das duplicatas vencidas
  if (not DBGrid1.DataSource.DataSet.IsEmpty) and
      (DBGrid1.DataSource.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < Date)
      and (DBGrid1.DataSource.DataSet.FieldByName('STATUS').AsString = 'A')then
  begin
    DBGrid1.Canvas.Font.Color := clRed;  // Define a cor do texto da célula
  end;

  //  Intercala a cor das contas não selecionadas
  if (gdSelected in State) then
  begin

    DBGrid1.Canvas.Brush.Color := $00578B2E;  // Define a cor de fundo da célula selecionada
    DBGrid1.Canvas.Font.Color := clWhite;  // Define a cor do texto da célula selecionada

  end;


  // Desenha a célula com as propriedades de cor atualizadas
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmBxMultiplaCp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  //  Realiza o calculo caso o user use o shift + seta para baixo
  //  para selecionar as contas
  if key = VK_DOWN then
  begin

    edtValorSel.Text := TUtilitario.FormatoMoeda(CalcCpSel);
    CalcQtdCpSel;

  end;

end;

procedure TfrmBxMultiplaCp.EditKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmBxMultiplaCp.edtCodFatCartaoChange(Sender: TObject);
begin

  //  Se apagar o cod da fatura apaga o nome da mesma
  if ((GetKeyState(VK_BACK) and $8000) <> 0) then
    lblNomeFatCartao.Caption := '';

    Pesquisar;


end;

procedure TfrmBxMultiplaCp.edtCodFatCartaoExit(Sender: TObject);
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



procedure TfrmBxMultiplaCp.edtFornecedorChange(Sender: TObject);
begin

  //  Se apagar o cod do fornec apaga o nome do mesmo
  if ((GetKeyState(VK_BACK) and $8000) <> 0) then
    lblNomeFornecedor.Caption := '';


    Pesquisar;

end;

procedure TfrmBxMultiplaCp.edtFornecedorExit(Sender: TObject);
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


procedure TfrmBxMultiplaCp.FormCreate(Sender: TObject);
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

end;

procedure TfrmBxMultiplaCp.FormShow(Sender: TObject);
begin

  //  Fecha o dataset para limpar o dbgrid;
  if Assigned(DataSourceBxMultiplaCP) and Assigned(DataSourceBxMultiplaCP.DataSet) then
  begin
    DataSourceBxMultiplaCP.DataSet.Close; // Fecha o conjunto de dados
  end;

end;

procedure TfrmBxMultiplaCp.Pesquisar;
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
//    Application.MessageBox('Defina um Código de Fornecedor ou de Fatura de Cartão!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     DataSourceBxMultiplaCP.DataSet.Close;
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

  //  Coloca na primeira posição
  DBGrid1.DataSource.DataSet.First;

end;

procedure TfrmBxMultiplaCp.SelAllReg(DBGrid: TDBGrid);
var
  i: Integer;

begin

  // Verifica se o DBGrid está conectado a um DataSource
  if Assigned(DBGrid.DataSource) and Assigned(DBGrid.DataSource.DataSet) then
  begin

    // Verifica se o data set esta aberto
    if DBGrid.DataSource.DataSet.Active then
    begin

      // Verifica se o conjunto de dados não está vazio
      if not DBGrid.DataSource.DataSet.IsEmpty then
      begin

        // Desativa controles de atualização para melhorar o desempenho
        DBGrid.DataSource.DataSet.DisableControls;

        //  Coloca na primeira posição
        DBGrid.DataSource.DataSet.first;

        try

          for i := 0 to DBGrid.DataSource.DataSet.RecordCount - 1 do
          begin

            if checkSelAll.Checked then
            begin

              // Marca a linha como selecionada
              DBGrid.SelectedRows.CurrentRowSelected := True;

            end
            else
            begin

              // Marca a linha como selecionada
              DBGrid.SelectedRows.CurrentRowSelected := False;

            end;



            DBGrid.DataSource.DataSet.Next;

          end;

        finally

          // Reativa controles
          DBGrid.DataSource.DataSet.EnableControls;

        end;

      end;

    end;

  end;

end;



end.
