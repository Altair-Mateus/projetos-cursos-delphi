unit fCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uDmDados, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroCliente = class(TfrmCadastroPai)
    FDQueryCadastroCODIGO: TIntegerField;
    FDQueryCadastroNOME: TWideStringField;
    FDQueryCadastroENDERECO: TWideStringField;
    FDQueryCadastroBAIRRO: TWideStringField;
    FDQueryCadastroCIDADE: TWideStringField;
    FDQueryCadastroCEP: TWideStringField;
    FDQueryCadastroUF: TWideStringField;
    FDQueryCadastroFONE: TWideStringField;
    FDQueryCadastroCELULAR: TWideStringField;
    FDQueryCadastroEMAIL: TWideStringField;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelCodigo: TLabel;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelBairro: TLabel;
    DBEditBairro: TDBEdit;
    LabelCidade: TLabel;
    DBEditCidade: TDBEdit;
    LabelCep: TLabel;
    DBEditCep: TDBEdit;
    LabelUf: TLabel;
    DBEditUf: TDBEdit;
    LabelFone: TLabel;
    DBEditFone: TDBEdit;
    LabelCelular: TLabel;
    DBEditCelular: TDBEdit;
    LabelEmail: TLabel;
    DBEditEmail: TDBEdit;
    DBEditCodigo: TDBEdit;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure limpa;
    procedure geraCodigo;
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos;
    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.BitBtnSalvarClick(Sender: TObject);
begin

  ValidaCampos;
  inherited;


  limpa;

  BitBtnSalvar.Enabled := False;
  BitBtnCancelar.Enabled := False;
  BitBtnNovo.Enabled := True;

end;

procedure TfrmCadastroCliente.geraCodigo;
var
  cod: integer;
  FDQueryCliente: TFDQuery;
begin

  cod := 0;

  //  Cria query
  FDQueryCliente := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryCliente.Connection := dmDados.FDConnection;

    //  Ve o ultimo codigo usado
    FDQueryCliente.Close;
    FDQueryCliente.SQL.Clear;
    FDQueryCliente.SQL.Add(' select max(codigo) as codigo' );
    FDQueryCliente.SQL.Add(' from cliente ');
    FDQueryCliente.Open;

    //  Ultimo codigo usado + 1
    cod := FDQueryCliente.FieldByName('codigo').AsInteger + 1;

    //  Insere o registro no final da tabela
    FDQueryCliente.Append();

    //  Seta no edit o codigo gerado
    DBEditCodigo.Text := IntToStr(cod);

    //  Posiciona o cursor
    DBEditNome.SetFocus;

  finally

    //  Libera da memoria
    FDQueryCliente.free;

  end;



end;

procedure TfrmCadastroCliente.limpa;
var
  i: integer;
begin

  //  Limpa os campos
  for i := 0 to frmCadastroCliente.ComponentCount -1 do
  begin
    if frmCadastroCliente.Components[i] is TDBEdit then
      TDBEdit(frmCadastroCliente.Components[i]).Clear

  end;



end;

procedure TfrmCadastroCliente.LimpaCampos;
var
  i: Integer;
begin

  for i := 0 to Self.ComponentCount - 1 do
  begin

    (self.Components[i] as TDBEdit).Clear;

  end;


end;

procedure TfrmCadastroCliente.ValidaCampos;
begin

  //  Valida se o campo Nome foi preenchido
  if DBEditNome.Text = EmptyStr then
  begin

    ShowMessage('Preencha o Nome do Cliente!');
    DBEditNome.SetFocus;
    Abort
         ;
  end;

end;

procedure TfrmCadastroCliente.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;

  frmCadastroCliente.Close

end;

procedure TfrmCadastroCliente.BitBtnNovoClick(Sender: TObject);
begin
inherited;

  //  Limpa os Dbedits
  limpa;

  //  Gera codigo do cadastro
  geraCodigo;

end;

end.
