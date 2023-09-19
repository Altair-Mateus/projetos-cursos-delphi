unit SistemaFinanceiro.Model.dmUsuarios;
interface
uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  SistemaFinanceiro.Model.Entidades.Usuario;
type
  TdmUsuarios = class(TDataModule)
    FDQueryUsuarios: TFDQuery;
    cdsUsuarios: TClientDataSet;
    DataSetProviderUsuarios: TDataSetProvider;
    cdsUsuariosid: TIntegerField;
    cdsUsuariosdata_cadastro: TDateField;
    cdsUsuariosnome: TWideStringField;
    cdsUsuarioslogin: TWideStringField;
    cdsUsuariossenha: TWideStringField;
    cdsUsuariosstatus: TWideStringField;
    cdsUsuariossenha_temp: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsUsuariosstatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FUsuario : TModelUsuario;
    { Private declarations }
  public
    { Public declarations }
    procedure GeraCodigo;
    procedure EfetuaLogin(Login: String; Senha : String);
    procedure LimparSenhaTemp(IdUsuario: String);
    procedure RedefinirSenha(Usuario: TModelUsuario);
    procedure CadastrarUsuario(Usuario : TModelUsuario);
    function VerificaLogin(Login: String; Id: String) : Boolean;
    function GetUsuarioLogado: TModelUsuario;
    function TblUsuariosVazia : Boolean;
    CONST TEMP_PASSWORD = '12345';


  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  BCrypt, SistemaFinanceiro.Model.udmDados;
{$R *.dfm}

{ TDataModuleUsuarios }

procedure TdmUsuarios.CadastrarUsuario(Usuario: TModelUsuario);
var
  FDQueryUser :TFDQuery;
  SQL : String;

begin

  FDQueryUser := TFDQuery.Create(nil);

  try

    SQL := 'INSERT INTO USUARIOS (ID, NOME, LOGIN, SENHA, STATUS, DATA_CADASTRO, SENHA_TEMP) ' +
           ' VALUES (:ID, :NOME, :LOGIN, :SENHA, :STATUS, :DATA, :SENHATEMP)';


    //  Conexao com o BD
    FDQueryUser.Connection := DataModule1.FDConnection;

    FDQueryUser.Close;
    FDQueryUser.SQL.Clear;
    FDQueryUser.SQL.Add(SQL);

    FDQueryUser.ParamByName('ID').AsInteger    := 1;
    FDQueryUser.ParamByName('NOME').AsString   := Usuario.Nome;
    FDQueryUser.ParamByName('LOGIN').AsString  := Usuario.Login;
    FDQueryUser.ParamByName('SENHA').AsString  := TBCrypt.GenerateHash(Usuario.Senha);
    FDQueryUser.ParamByName('DATA').AsDate     := Now;
    FDQueryUser.ParamByName('STATUS').AsString := 'A';

    if Usuario.Senha_Temp then
    begin
      FDQueryUser.ParamByName('SENHATEMP').AsString := 'S';
    end
    else
    begin
      FDQueryUser.ParamByName('SENHATEMP').AsString := 'N';
    end;

    FDQueryUser.Prepare;
    FDQueryUser.ExecSQL;

  finally

    FDQueryUser.Close;
    FDQueryUser.Free;

  end;

end;

procedure TdmUsuarios.cdsUsuariosstatusGetText(Sender: TField; var Text: string;
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

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin

  //  Instanciando o objeto
  FUsuario := TModelUsuario.Create;

end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin

  //  Liberando da memoria
  FUsuario.Free;

end;

procedure TdmUsuarios.EfetuaLogin(Login, Senha: String);
var
  FDQueryLogin : TFDQuery;

begin

  FDQueryLogin := TFDQuery.Create(nil);

  try
    //  Estabelece a conexao com o banco
    FDQueryLogin.Connection :=  DataModule1.FDConnection;
    FDQueryLogin.Close;
    FDQueryLogin.SQL.Clear;
    FDQueryLogin.SQL.Add('select * from usuarios where login = :LOGIN');

    FDQueryLogin.ParamByName('LOGIN').AsString := Login;
    FDQueryLogin.Open;

    //  Valida usuario
    if FDQueryLogin.IsEmpty then
    begin
      raise Exception.Create('Usuário e/ou senha inválidos');
    end;

    //  Valida se o usuario esta ativo
    if FDQueryLogin.FieldByName('STATUS').AsString <> 'A' then
    begin
      raise Exception.Create('Usuário não está ativo! Contate o Administrador');
    end;

    //  Valida o hash da senha
    if not TBCrypt.CompareHash(Senha, FDQueryLogin.FieldByName('SENHA').AsString) then
    begin
      raise Exception.Create('Usuário e/ou senha inválidos');
    end;

    FUsuario.Id         := FDQueryLogin.FieldByName('ID').AsString;
    FUsuario.Nome       := FDQueryLogin.FieldByName('NOME').AsString;
    FUsuario.Login      := FDQueryLogin.FieldByName('LOGIN').AsString;
    FUsuario.Senha      := FDQueryLogin.FieldByName('SENHA').AsString;
    FUsuario.Senha_Temp := FDQueryLogin.FieldByName('SENHA_TEMP').AsString = 'S';

  finally

    FDQueryLogin.Close;
    FDQueryLogin.Free;
  end;

end;

procedure TdmUsuarios.GeraCodigo;
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
     FDQueryId.sql.Clear;
     FDQueryId.Open('select max(id) as id from usuarios');

    //  Ultimo codigo usado + 1
    cod := FDQueryId.FieldByName('id').AsInteger + 1;

    cdsUsuariosid.AsInteger := cod;

    //  Insere o registro no final da tabela
    FDQueryId.Append();

  finally

    FDQueryId.Close;
    FDQueryId.Free;

  end;
end;

function TdmUsuarios.GetUsuarioLogado: TModelUsuario;
begin
  Result := FUsuario;
end;

procedure TdmUsuarios.LimparSenhaTemp(IdUsuario: String);
var
  FDQueryLSenha : TFDQuery;

begin
  FDQueryLSenha := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryLSenha.Connection := DataModule1.FDConnection;

    FDQueryLSenha.SQL.Clear;
    FDQueryLSenha.SQL.Add('UPDATE USUARIOS SET SENHA_TEMP = :SENHA_TEMP, ');
    FDQueryLSenha.SQL.Add('SENHA = :SENHA WHERE ID = :ID');

    FDQueryLSenha.ParamByName('SENHA_TEMP').AsString := 'S';
    FDQueryLSenha.ParamByName('SENHA').AsString      := TBCrypt.GenerateHash(TEMP_PASSWORD);
    FDQueryLSenha.ParamByName('ID').AsString         := IdUsuario;

    FDQueryLSenha.ExecSQL;

  finally

    FDQueryLSenha.Close;
    FDQueryLSenha.Free;

  end;
end;

procedure TdmUsuarios.RedefinirSenha(Usuario: TModelUsuario);
var
  FDQueryRSenha : TFDQuery;

begin

  FDQueryRSenha := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryRSenha.Connection := DataModule1.FDConnection;

    FDQueryRSenha.SQL.Clear;
    FDQueryRSenha.SQL.Add('UPDATE USUARIOS SET SENHA_TEMP = :SENHA_TEMP, ');
    FDQueryRSenha.SQL.Add('SENHA = :SENHA WHERE ID = :ID');

    FDQueryRSenha.ParamByName('SENHA_TEMP').AsString := 'N';
    FDQueryRSenha.ParamByName('SENHA').AsString      := TBCrypt.GenerateHash(Usuario.Senha);
    FDQueryRSenha.ParamByName('ID').AsString         := Usuario.Id;

    FDQueryRSenha.ExecSQL;

  finally

    FDQueryRSenha.Close;
    FDQueryRSenha.Free;

  end;
end;

function TdmUsuarios.TblUsuariosVazia: Boolean;
var
  FDQueryUser : TFDQuery;

begin

  FDQueryUser := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQueryUser.Connection := DataModule1.FDConnection;

    FDQueryUser.Close;
    FDQueryUser.SQL.Clear;
    FDQueryUser.Open('SELECT * FROM USUARIOS');

    Result := FDQueryUser.IsEmpty;

  finally

    FDQueryUser.Close;
    FDQueryUser.Free;

  end;

end;

function TdmUsuarios.VerificaLogin(Login, Id: String): Boolean;
var
  FDQueryLogin : TFDQuery;

begin

  Result := False;
  FDQueryLogin := TFDQuery.Create(nil);

  try
    //  Estabelece a conexao com o banco
    FDQueryLogin.Connection :=  DataModule1.FDConnection;

    FDQueryLogin.Close;
    FDQueryLogin.SQL.Clear;
    FDQueryLogin.SQL.Add('select id from usuarios where login = :LOGIN');

    FDQueryLogin.ParamByName('LOGIN').AsString := Login;
    FDQueryLogin.Open();

    //  Se não estiver vazia
    if not FDQueryLogin.IsEmpty then
    begin
      Result:= FDQueryLogin.FieldByName('ID').AsString <> ID;
    end;

  finally
    FDQueryLogin.Close;
    FDQueryLogin.Free;
  end;

end;
end.
