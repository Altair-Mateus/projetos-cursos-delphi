unit fPesquisarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fPesquisarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, uDmDados, Vcl.ComCtrls,
  fItensVenda;

type
  TfrmPesquisarVenda = class(TfrmPesquisarPai)
    FDQueryPesquisarNRNOTA: TIntegerField;
    FDQueryPesquisarEMISSAO: TDateField;
    FDQueryPesquisarCLIENTE: TIntegerField;
    FDQueryPesquisarTIPO_VENDA: TWideStringField;
    FDQueryPesquisarVALOR_VENDA: TBCDField;
    FDQueryPesquisarOPERACAO_VENDA: TWideStringField;
    FDQueryClientes: TFDQuery;
    FDQueryPesquisarNomeCliente: TStringField;
    PanelTipoVenda: TPanel;
    LabelTiposVenda: TLabel;
    LabelVista: TLabel;
    LabelPrazo: TLabel;
    PanelOpVenda: TPanel;
    LabelOpVenda: TLabel;
    LabelOrc: TLabel;
    LabelPreVenda: TLabel;
    LabelVenda: TLabel;
    DateTimePickerInicial: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    LabelPeriodoInicial: TLabel;
    LabelPeriodoFinal: TLabel;
    RadioButtonData: TRadioButton;
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa;

  public
    { Public declarations }
  end;

var
  frmPesquisarVenda: TfrmPesquisarVenda;

implementation

{$R *.dfm}

{ TfrmPesquisarVenda }

procedure TfrmPesquisarVenda.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;

  Pesquisa;

end;

procedure TfrmPesquisarVenda.ButtonVisualizarClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  frmItensVenda := TfrmItensVenda.Create(Self);

  try

    //  Pega o registro selecionado na tabela e abre o cadastro
    frmItensVenda.FDQueryCadastro.Locate('NRNOTA', FDQueryPesquisarNRNOTA.AsInteger, []);

    //  Exibe o form
    frmItensVenda.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmItensVenda);

  end;

end;

procedure TfrmPesquisarVenda.Pesquisa;
begin

    // Fechando a Query
   FDQueryPesquisar.Close;

   // Limpando o sql da query
   FDQueryPesquisar.SQL.Clear;

   // Adicionando o sql inicial
   FDQueryPesquisar.SQL.Add('select * from venda where 1 = 1');


  // Pesquisa por codigo
  if StrToIntDef(EditCodigo.Text, 0) > 0 then
  begin

    FDQueryPesquisar.SQL.Add('and nrnota = ' + EditCodigo.Text);

  end;

  //  Pesquisa por periodo
  if (DateTimePickerInicial.Date <> null) and (DateTimePickerFinal.Date <> null) then
  begin

    FDQueryPesquisar.SQL.Add('and emissao between :dtIni and :dtFim');
    FDQueryPesquisar.ParamByName('dtIni').AsDateTime := DateTimePickerInicial.DateTime;
    FDQueryPesquisar.ParamByName('dtFim').AsDateTime := DateTimePickerFinal.DateTime;

  end;


  //  Ordena o resultado pelo nome
  if RadioButtonNome.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add(' order by cliente');

  end;

  //  Ordena o resultado por código
  if RadioButtonCodigo.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add('order by nrnota');

  end;

  //  Ordena o resultado por data
  if RadioButtonData.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add(' order by emissao');

  end;


  FDQueryPesquisar.Open();
  FDQueryPesquisar.FetchAll;
end;

end.
