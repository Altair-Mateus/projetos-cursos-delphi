unit SistemaFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
    DataSourceCaixa: TDataSource;
    lblNDoc: TLabel;
    edtNDoc: TEdit;
    lblDesc: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    RadioGroup: TRadioGroup;
    DateTimePicker: TDateTimePicker;
    lblData: TLabel;
    lblReceita: TLabel;
    lblDespesa: TLabel;
    memDesc: TMemo;
    cbTipoLcto: TComboBox;
    lblTipo: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaCampos;
    procedure HabilitaBotoes;

  public
    { Public declarations }

  protected

    procedure Pesquisar; override;

  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.Model.dmCaixa,
  SistemaFinanceiro.Utilitarios;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin

  //  Coloca o dataset em modo de edi��o
  DataModuleCaixa.ClientDataSetCaixa.Edit;

  inherited;

  //  Coloca o numero do registro no titulo
  Labeltitulo.Caption := 'Alterando lan�amento N� '+ DataModuleCaixa.ClientDataSetCaixaid.AsString;

  //  Carrega os dados
  edtNDoc.Text := DataModuleCaixa.ClientDataSetCaixanumero_doc.AsString;
  memDesc.Text := DataModuleCaixa.ClientDataSetCaixadescricao.AsString;
  edtValor.Text := DataModuleCaixa.ClientDataSetCaixavalor.AsString;
  DateTimePicker.Date := DataModuleCaixa.ClientDataSetCaixadata_cadastro.AsDateTime;

  if DataModuleCaixa.ClientDataSetCaixatipo.AsString = 'R' then
  begin

    RadioGroup.ItemIndex := 0;

  end
    else if DataModuleCaixa.ClientDataSetCaixatipo.AsString = 'D' then
    begin

      RadioGroup.ItemIndex := 1;

    end;



end;

procedure TfrmCaixa.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclus�o
  DataModuleCaixa.ClientDataSetCaixa.Cancel;

end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
var

  option : Word;

begin
  inherited;

  option := Application.MessageBox('Deseja excluir o lan�amento?', 'Confirma��o', MB_YESNO + MB_ICONQUESTION);

  if option = IDNO then
  begin
    exit;
  end;


  try

    //  Excluindo registro
    DataModuleCaixa.ClientDataSetCaixa.Delete;
    DataModuleCaixa.ClientDataSetCaixa.ApplyUpdates(0);

  except on E : Exception do

    Application.MessageBox(PWidechar(E.Message), 'Erro ao excluir lan�amento do caixa', MB_OK + MB_ICONERROR);

  end;

end;

procedure TfrmCaixa.btnIncluirClick(Sender: TObject);
begin
  inherited;



  if not (DataModuleCaixa.ClientDataSetCaixa.State in [dsInsert, dsEdit]) then
  begin

    //  Colocando o data set em modo de inser��o de dados
    DataModuleCaixa.ClientDataSetCaixa.Insert;

  end;

  DataModuleCaixa.GeraCodigo;

  //  Coloca a data atual no datetimepicker
  DateTimePicker.Date := now;

  //  Coloca o tipo de lan�amento como nulo
//  RadioGroup.ItemIndex := -1;

end;

procedure TfrmCaixa.btnPesquisaeClick(Sender: TObject);
begin

  Pesquisar;

  inherited;

end;

procedure TfrmCaixa.btnSalvarClick(Sender: TObject);
begin

  //  Valida os campos obrigat�rios
  ValidaCampos;

  //  Passando os dados para o dataset
  DataModuleCaixa.ClientDataSetCaixadata_cadastro.AsDateTime := DateTimePicker.DateTime;
  DataModuleCaixa.ClientDataSetCaixavalor.AsFloat := StrToFloat(Trim(edtValor.text));
  DataModuleCaixa.ClientDataSetCaixanumero_doc.AsString := Trim(edtNDoc.text);
  DataModuleCaixa.ClientDataSetCaixadescricao.AsString := Trim(memDesc.text);

  if RadioGroup.ItemIndex = 0 then
  begin

    DataModuleCaixa.ClientDataSetCaixatipo.AsString := 'R';

  end
    else if RadioGroup.ItemIndex = 1 then
    begin

      DataModuleCaixa.ClientDataSetCaixatipo.AsString := 'D';

    end;

  //  Gravando no banco de dados
  DataModuleCaixa.ClientDataSetCaixa.Post;
  DataModuleCaixa.ClientDataSetCaixa.ApplyUpdates(0);

  //  Retorna ao cardPesquisa;
  CardPanelPrincipal.ActiveCard := CardPesquisa;

  //  Atualiza a lista por ordem de usuario
  Pesquisar;

  inherited;

end;

procedure TfrmCaixa.HabilitaBotoes;
begin

  btnAlterar.Enabled := not DataSourceCaixa.DataSet.IsEmpty;
  btnExcluir.Enabled := not DataSourceCaixa.DataSet.IsEmpty;

end;

procedure TfrmCaixa.Pesquisar;
var
  LFiltroPesquisa : String;
  LFiltroTipo     : String;

begin

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  case cbTipoLcto.ItemIndex of

    1 : LFiltroTipo := ' AND TIPO = ''R'' ';
    2 : LFiltroTipo := ' AND TIPO = ''D'' ';

  end;

  DataModuleCaixa.ClientDataSetCaixa.Close;
  DataModuleCaixa.ClientDataSetCaixa.CommandText := 'SELECT * FROM CAIXA WHERE 1 = 1' + LFiltroPesquisa + LFiltroTipo + 'ORDER BY 1';
  DataModuleCaixa.ClientDataSetCaixa.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmCaixa.ValidaCampos;
begin

  if Trim(memDesc.Text) = '' then
  begin

    Application.MessageBox('Campo Descri��o n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    memDesc.SetFocus;

    abort;

  end;


  if Trim(edtValor.Text) = '' then
  begin

    Application.MessageBox('Campo Valor n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    edtValor.SetFocus;

    abort;

  end;

  if RadioGroup.ItemIndex = -1 then
  begin

    Application.MessageBox('Selecione o tipo do lan�amento!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

end;

end.
