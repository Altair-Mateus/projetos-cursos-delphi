unit SistemaFinanceiro.View.FrPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls,
  SistemaFinanceiro.View.Relatorios.FrPgto;

type
  TfrmFrPgto = class(TfrmCadastroPadrao)
    DataSourceFrPgto: TDataSource;
    LabelNome: TLabel;
    edtNome: TEdit;
    LabelStatus: TLabel;
    ToggleStatus: TToggleSwitch;
    lblDesc: TLabel;
    edtDesc: TEdit;
    gbMetodo: TGroupBox;
    rbDinheiro: TRadioButton;
    rbCCred: TRadioButton;
    rbPix: TRadioButton;
    rbCDeb: TRadioButton;
    rbDv: TRadioButton;
    rbCheque: TRadioButton;
    cbStatus: TComboBox;
    lblStatus: TLabel;
    LBLmET: TLabel;
    cbMet: TComboBox;
    procedure btnPesquisaeClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbStatusClick(Sender: TObject);
    procedure cbMetClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaBotoes;
    procedure ValidaCampos;
    procedure EditarFrPgto;

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmFrPgto: TfrmFrPgto;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.dmFrPgto, SistemaFinanceiro.Utilitarios;

{ TfrmFrPgto }

procedure TfrmFrPgto.btnAlterarClick(Sender: TObject);
begin
  inherited;

  EditarFrPgto;

end;

procedure TfrmFrPgto.btnExcluirClick(Sender: TObject);
var
  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o registro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;

  try

    //  Excluindo registro
    dmFrPgto.cdsFrPgto.Delete;
     dmFrPgto.cdsFrPgto.ApplyUpdates(0);

  except on E : Exception do
    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir Forma de pagamento', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmFrPgto.btnImprimirClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmRelFrPgto := TfrmRelFrPgto.Create(Self);

  try

    frmRelFrPgto.DataSourceFrPgto.DataSet := DataSourceFrPgto.DataSet;

    //  Mostra a pre vizualizacao
    frmRelFrPgto.RLReport.Preview;

  finally

    FreeAndNil(frmRelFrPgto);

  end;

end;

procedure TfrmFrPgto.btnIncluirClick(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'Inserindo uma nova Forma de Pagamento';

  if not (dmFrPgto.cdsFrPgto.State in [dsInsert, dsEdit]) then
  begin

    //  Coloca o dataset em modo de inserção
    dmFrPgto.cdsFrPgto.Insert;

  end;

  edtNome.SetFocus;

  //  Seta previamente o metodo como dinheiro
  rbDinheiro.Checked := True;
  rbCCred.Checked    := False;
  rbCDeb.Checked     := False;
  rbPix.Checked      := False;
  rbCheque.Checked   := False;
  rbDv.Checked       := False;

end;

procedure TfrmFrPgto.btnPesquisaeClick(Sender: TObject);
begin
  inherited;

  Pesquisar;

end;

procedure TfrmFrPgto.btnSalvarClick(Sender: TObject);
var
  LStatus : String;
  LMetodoPag: String;

begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Se for novo cad
  if dmFrPgto.cdsFrPgto.State in [dsInsert] then
  begin

    dmFrPgto.GeraCodigo;
    dmFrPgto.cdsFrPgtoDATA_CADASTRO.AsDateTime := Now;

  end;

  //  Se for edição de um cad
  if dmFrPgto.cdsFrPgto.State in [dsEdit] then
  begin

    dmFrPgto.cdsFrPgtoDATA_ALTERACAO.AsDateTime := Now;

  end;

  //  Define o status da forma
  if ToggleStatus.State = tssOn then
  begin
    LStatus := 'A';
  end
  else
  begin
    LStatus := 'I';
  end;

  //  Define o metodo de pagamento
  if rbDinheiro.Checked then
  begin
    LMetodoPag := 'DI';
  end
  else if rbCCred.Checked then
       begin
        LMetodoPag := 'CC';
       end
      else if rbPix.Checked then
           begin
            LMetodoPag := 'PX';
           end
           else if rbCDeb.Checked then
                begin
                  LMetodoPag := 'CD';
                end
                else if rbDv.Checked then
                     begin
                       LMetodoPag := 'DV';
                     end
                     else if rbCheque.Checked then
                          begin
                            LMetodoPag := 'CH';
                          end;


  //  Passando os dados para o dataset
  dmFrPgto.cdsFrPgtoNOME_FR.AsString := Trim(edtNome.Text);
  dmFrPgto.cdsFrPgtoDESC.AsString    := Trim(edtDesc.Text);
  dmFrPgto.cdsFrPgtoSTATUS.AsString  := LStatus;
  dmFrPgto.cdsFrPgtoMETODO_PAG.AsString := LMetodoPag;

  //  Gravando no banco
  dmFrPgto.cdsFrPgto.Post;
  dmFrPgto.cdsFrPgto.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista de pesquisa
  Pesquisar;

  inherited;

end;

procedure TfrmFrPgto.cbMetClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFrPgto.cbStatusClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFrPgto.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  EditarFrPgto;
end;

procedure TfrmFrPgto.EditarFrPgto;
begin

  //  Coloca o data set em modo de edição
  dmFrPgto.cdsFrPgto.Edit;

  //  Coloca o nome da forma no titulo
  lblTitulo.Caption := dmFrPgto.cdsFrPgtoID_FR.AsString + ' - ' + dmFrPgto.cdsFrPgtoNOME_FR.AsString;

  //  Carrega os dados
  edtNome.Text := dmFrPgto.cdsFrPgtoNOME_FR.AsString;
  edtDesc.Text := dmFrPgto.cdsFrPgtoDESC.AsString;

  if dmFrPgto.cdsFrPgtoSTATUS.AsString = 'A' then
  begin
    ToggleStatus.State := tssOn;
  end
    else
    begin
      ToggleStatus.State := tssOff;
    end;

  if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'DI' then
  begin

    rbDinheiro.Checked := True;
    rbCCred.Checked    := False;
    rbCDeb.Checked     := False;
    rbPix.Checked      := False;
    rbCheque.Checked   := False;
    rbDv.Checked       := False;

  end
    else if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'CC' then
    begin

      rbDinheiro.Checked := False;
      rbCCred.Checked    := True;
      rbCDeb.Checked     := False;
      rbPix.Checked      := False;
      rbCheque.Checked   := False;
      rbDv.Checked       := False;

    end
    else if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'CD' then
         begin

          rbDinheiro.Checked := False;
          rbCCred.Checked    := False;
          rbCDeb.Checked     := True;
          rbPix.Checked      := False;
          rbCheque.Checked   := False;
          rbDv.Checked       := False;

         end
         else if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'PX' then
              begin

                rbDinheiro.Checked := False;
                rbCCred.Checked    := False;
                rbCDeb.Checked     := False;
                rbPix.Checked      := True;
                rbCheque.Checked   := False;
                rbDv.Checked       := False;

              end
              else if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'CH' then
                   begin

                    rbDinheiro.Checked := False;
                    rbCCred.Checked    := False;
                    rbCDeb.Checked     := False;
                    rbPix.Checked      := False;
                    rbCheque.Checked   := True;
                    rbDv.Checked       := False;

                   end
                   else if dmFrPgto.cdsFrPgtoMETODO_PAG.AsString = 'DV' then
                        begin

                          rbDinheiro.Checked := False;
                          rbCCred.Checked    := False;
                          rbCDeb.Checked     := False;
                          rbPix.Checked      := False;
                          rbCheque.Checked   := False;
                          rbDv.Checked       := True;

                        end;




end;

procedure TfrmFrPgto.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmFrPgto.HabilitaBotoes;
begin

  btnAlterar.Enabled  := not DataSourceFrPgto.DataSet.IsEmpty;
  btnExcluir.Enabled  := not DataSourceFrPgto.DataSet.IsEmpty;
  btnImprimir.Enabled := not DataSourceFrPgto.DataSet.IsEmpty;

end;

procedure TfrmFrPgto.Pesquisar;
var
  LFiltroEdit : String;
  LFiltro : String;

begin

  //  Validações
  if cbStatus.ItemIndex < 0 then
  begin

    cbStatus.SetFocus;
    Application.MessageBox('Selecione um tipo de STATUS!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  if cbMet.ItemIndex < 0 then
  begin

    cbMet.SetFocus;
    Application.MessageBox('Selecione um tipo de MÉTODO DE PAGAMENTO!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;

  end;

  dmFrPgto.cdsFrPgto.Params.Clear;

  LFiltroEdit := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);
  LFiltro     := '';

  case cbMet.ItemIndex of

    1 : LFiltro := LFiltro + ' AND METODO_PAG = ''DI'' ';
    2 : LFiltro := LFiltro + ' AND METODO_PAG = ''CC'' ';
    3 : LFiltro := LFiltro + ' AND METODO_PAG = ''CD'' ';
    4 : LFiltro := LFiltro + ' AND METODO_PAG = ''PX'' ';
    5 : LFiltro := LFiltro + ' AND METODO_PAG = ''CH'' ';
    6 : LFiltro := LFiltro + ' AND METODO_PAG = ''DV'' ';

  end;

  case cbStatus.ItemIndex of

    1 : LFiltro := LFiltro + ' AND STATUS = ''A'' ';
    2 : LFiltro := LFiltro + ' AND STATUS = ''I'' ';

  end;

  dmFrPgto.cdsFrPgto.Close;
  dmFrPgto.cdsFrPgto.CommandText := 'SELECT * FROM FR_PGTO WHERE 1 = 1' + LFiltroEdit + LFiltro + 'ORDER BY 1';
  dmFrPgto.cdsFrPgto.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmFrPgto.ValidaCampos;
begin

  if Trim(edtNome.Text) = '' then
  begin

    Application.MessageBox('Campo Nome não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    abort;

  end;

end;

end.
