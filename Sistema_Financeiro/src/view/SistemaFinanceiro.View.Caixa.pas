unit SistemaFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
    DataSourceCaixa: TDataSource;
    lblNDoc: TLabel;
    edtNDoc: TEdit;
    edtDesc: TEdit;
    lblDesc: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    RadioGroup: TRadioGroup;
    DateTimePicker: TDateTimePicker;
    lblData: TLabel;
    lblReceita: TLabel;
    lblDespesa: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisaeClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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

procedure TfrmCaixa.btnCancelarClick(Sender: TObject);
begin
  inherited;

  //  Cancelando inclusão
  DataModuleCaixa.ClientDataSetCaixa.Cancel;

end;

procedure TfrmCaixa.btnIncluirClick(Sender: TObject);
begin
  inherited;



  if not (DataModuleCaixa.ClientDataSetCaixa.State in [dsInsert, dsEdit]) then
  begin

    //  Colocando o data set em modo de inserção de dados
    DataModuleCaixa.ClientDataSetCaixa.Insert;

  end;

  DataModuleCaixa.GeraCodigo;

  //  Coloca a data atual no datetimepicker
  DateTimePicker.Date := now;

  //  Coloca o tipo de lançamento como nulo
  RadioGroup.ItemIndex := -1;

end;

procedure TfrmCaixa.btnPesquisaeClick(Sender: TObject);
begin

  Pesquisar;

  inherited;

end;

procedure TfrmCaixa.btnSalvarClick(Sender: TObject);
begin

  //  Valida os campos obrigatórios
  ValidaCampos;

  //  Passando os dados para o dataset
  DataModuleCaixa.ClientDataSetCaixadata_cadastro.AsDateTime := DateTimePicker.DateTime;
  DataModuleCaixa.ClientDataSetCaixavalor.AsFloat := StrToFloat(Trim(edtValor.text));
  DataModuleCaixa.ClientDataSetCaixanumero_doc.AsString := Trim(edtNDoc.text);
  DataModuleCaixa.ClientDataSetCaixadescricao.AsString := Trim(edtDesc.text);

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

begin

  LFiltroPesquisa := TUtilitario.LikeFind(edtPesquisar.Text, DBGrid1);

  DataModuleCaixa.ClientDataSetCaixa.Close;
  DataModuleCaixa.ClientDataSetCaixa.CommandText := 'SELECT * FROM CAIXA ' + LFiltroPesquisa + 'ORDER BY 1';
  DataModuleCaixa.ClientDataSetCaixa.Open;

  HabilitaBotoes;

  inherited;

end;

procedure TfrmCaixa.ValidaCampos;
begin

  if Trim(edtDesc.Text) = '' then
  begin

    Application.MessageBox('Campo Descrição não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtDesc.SetFocus;

    abort;

  end;


  if Trim(edtValor.Text) = '' then
  begin

    Application.MessageBox('Campo Valor não pode estar vazio!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtValor.SetFocus;

    abort;

  end;

  if RadioGroup.ItemIndex = -1 then
  begin

    Application.MessageBox('Selecione o tipo do lançamento!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

    abort;

  end;

end;

end.
