unit uFormFiltroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormFiltroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, uFormCadastroClientes;

type
  TFormFiltroCliente = class(TFormFiltroPai)
    DBGrid1: TDBGrid;
    LabelFantasia: TLabel;
    EditFantasia: TEdit;
    LabelCnpj: TLabel;
    EditCnpj: TEdit;
    EditCodigo: TEdit;
    LabelCodigo: TLabel;
    FDQueryFiltroID_CLIENTE: TIntegerField;
    FDQueryFiltroRAZAO_SOCIAL: TWideStringField;
    FDQueryFiltroFANTASIA: TWideStringField;
    FDQueryFiltroCPF_CNPJ: TWideStringField;
    FDQueryFiltroTIPO_FJ: TWideStringField;
    FDQueryFiltroNOME: TWideStringField;
    FDQueryFiltroEMAIL: TWideStringField;
    FDQueryFiltroSITE: TWideStringField;
    FDQueryFiltroENDERECO: TWideStringField;
    FDQueryFiltroCOMPLEMENTO: TWideStringField;
    FDQueryFiltroNUMERO: TWideStringField;
    FDQueryFiltroBAIRRO: TWideStringField;
    FDQueryFiltroIE: TWideStringField;
    FDQueryFiltroIM: TWideStringField;
    FDQueryFiltroDT_EXCLUIDO: TDateField;
    FDQueryFiltroID_CIDADE: TIntegerField;
    FDQueryFiltroID_ESTADO: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure ButtonNovClick(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonVisualizarClick(Sender: TObject);
  private
    { Private declarations }

    procedure Pesquisar;

  public
    { Public declarations }
  end;

var
  FormFiltroCliente: TFormFiltroCliente;

implementation

{$R *.dfm}

{ TFormFiltroCliente }

procedure TFormFiltroCliente.Button1Click(Sender: TObject);
begin
  inherited;

  //  Chama a procedure de pesquisas
  Pesquisar;

end;

procedure TFormFiltroCliente.ButtonNovClick(Sender: TObject);
begin
  inherited;

  //  Cria o form
  FormCadastroCliente := TFormCadastroCliente.Create(Self);

  try

    //  Modo de insert
    FormCadastroCliente.FDQueryCadastro.Insert;

    //  Exibe o Form
    FormCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCliente);

  end;

end;

procedure TFormFiltroCliente.ButtonNovoClick(Sender: TObject);
begin
  inherited;

   //  Cria o form
  FormCadastroCliente := TFormCadastroCliente.Create(Self);

  try

    //  Modo de insert
    FormCadastroCliente.FDQueryCadastro.Insert;

    //  Exibe o Form
    FormCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCliente);

  end;

end;

procedure TFormFiltroCliente.ButtonVisualizaClick(Sender: TObject);
begin
  inherited;

   //  Cria o form
  FormCadastroCliente := TFormCadastroCliente.Create(Self);

  try

    //  Locate = quando a query esta aberta ele ira localizar o registro selecionado
    FormCadastroCliente.FDQueryCadastro.Locate('id_cliente', FDQueryFiltroid_cliente.AsInteger, []);

    //  Exibe o Form
    FormCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCliente);
  end;

end;

procedure TFormFiltroCliente.ButtonVisualizarClick(Sender: TObject);
begin
  inherited;

  //ValidaQueryVazia;

   //  Cria o form
  FormCadastroCliente := TFormCadastroCliente.Create(Self);

  try

    //  Locate = quando a query esta aberta ele ira localizar o registro selecionado
    FormCadastroCliente.FDQueryCadastro.Locate('id_cliente', FDQueryFiltroid_cliente.AsInteger, []);

    //  Exibe o Form
    FormCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(FormCadastroCliente);
  end;

end;

procedure TFormFiltroCliente.Pesquisar;
begin

  //  Fechando a query
  FDQueryFiltro.Close;

  //  Limpando o sql da query
  FDQueryFiltro.SQL.Clear;

  //  Adicionado o sql inicial
  FDQueryFiltro.SQL.Add('select * from cliente where 1 = 1');

  //  Funcao trim remove os espaços no inicio e fim do texto
  if Trim(EditFiltro.Text) <> '' then
  begin

    //  Incrementando o sql
    //  Funcao upper converte a string em letras maiusculas
    //  Funcao QuotedStr trata o texto e o coloca dentr aspas simples
    FDQueryFiltro.SQL.Add('and upper(trim(razao_social)) like ' + QuotedStr( '%' + UpperCase(Trim(EditFiltro.Text)) + '%') );

  end;

  //  Pesquisa por nome fantasia
  if Trim(EditFantasia.Text) <> '' then
  begin

    FDQueryFiltro.SQL.Add('and upper(trim(fantasia)) like ' + QuotedStr('%' + UpperCase(Trim(EditFantasia.Text)) + '%'));

  end;

  //  Pesquisa por cpf e cnpj
  if Trim(EditCnpj.Text) <> '' then
  begin

    FDQueryFiltro.SQL.Add('and upper(trim(replace (replace (replace (cpf_cnpj, ''.'', '''' ), ''-'', '''' ), ''/'', '''' ))) like ' + QuotedStr('%' + UpperCase(Trim(EditCnpj.Text)) + '%'));

  end;

  //  Pesquisa por codigo
  if StrToIntDef(EditCodigo.Text, 0) > 0 then
  begin

    FDQueryFiltro.SQL.Add('and id_cliente = ' + EditCodigo.Text);

  end;


  FDQueryFiltro.Open();
  FDQueryFiltro.FetchAll;

end;



end.
