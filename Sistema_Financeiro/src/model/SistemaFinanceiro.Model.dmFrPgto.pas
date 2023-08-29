unit SistemaFinanceiro.Model.dmFrPgto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmFrPgto = class(TDataModule)
    FDQueryFrPgto: TFDQuery;
    DataSetProviderFrPgto: TDataSetProvider;
    cdsFrPgto: TClientDataSet;
    cdsFrPgtoID_FR: TIntegerField;
    cdsFrPgtoNOME_FR: TWideStringField;
    cdsFrPgtoDESC: TWideStringField;
    cdsFrPgtoSTATUS: TWideStringField;
    cdsFrPgtoDATA_CADASTRO: TSQLTimeStampField;
    cdsFrPgtoDATA_ALTERACAO: TSQLTimeStampField;
    cdsFrPgtoMETODO_PAG: TWideStringField;
    procedure cdsFrPgtoSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    function GetNomeFrPgto(Id : String) : String;


  end;

var
  dmFrPgto: TdmFrPgto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.udmDados;

{$R *.dfm}

{ TdmFrPgto }

procedure TdmFrPgto.cdsFrPgtoSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsString = 'A' then
  begin
    Text := 'ATIVO';
  end
  else if Sender.AsString = 'I' then
       begin
         Text := 'INATIVO';
       end;
end;

procedure TdmFrPgto.GeraCodigo;
var
  cod: integer;
  FDQueryId : TFDQuery;

begin

  cod := 0;
  FDQueryId := TFDQuery.Create(nil);

  try

     //  Estabelece a conexao com o banco
     FDQueryId.Connection :=  DataModule1.FDConnection;

     FDQueryId.Close;
     FDQueryId.SQL.Clear;
     FDQueryId.Open('SELECT MAX(ID_FR) AS ID FROM FR_PGTO');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('ID').AsInteger + 1;

    cdsFrPgtoID_FR.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;

end;

function TdmFrPgto.GetNomeFrPgto(Id: String): String;
var
  FDQueryNome : TFDQuery;

begin

   FDQueryNome := TFDQuery.Create(Self);
   Result := '';

   try

    //  Estabelece conexão
    FDQueryNome.Connection := DataModule1.FDConnection;

    FDQueryNome.Close;
    FDQueryNome.SQL.Clear;
    FDQueryNome.SQL.Add('SELECT NOME_FR FROM FR_PGTO WHERE ID_FR = :ID');

    FDQueryNome.ParamByName('ID').AsString := Id;

    FDQueryNome.Open;

    Result := FDQueryNome.FieldByName('NOME_FR').AsString;

   finally

    FDQueryNome.Close;
    FDQueryNome.Free;

   end;

end;

end.
