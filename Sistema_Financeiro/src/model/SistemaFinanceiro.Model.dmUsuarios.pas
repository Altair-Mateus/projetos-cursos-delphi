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
    function VerificaLogin(Login: String; Id: String) : Boolean;
    function GetUsuarioLogado: TModelUsuario;
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

    FUsuario.IdUsuarioLogado    := FDQueryLogin.FieldByName('ID').AsString;
    FUsuario.NomeUsuarioLogado  := FDQueryLogin.FieldByName('NOME').AsString;
    FUsuario.LoginUsuarioLogado := FDQueryLogin.FieldByName('LOGIN').AsString;
    FUsuario.Senha              := FDQueryLogin.FieldByName('SENHA').AsString;
    FUsuario.Senha_Temp         := FDQueryLogin.FieldByName('SENHA_TEMP').AsString = 'S';

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
  FDQuery : TFDQuery;

begin
  FDQuery := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQuery.Connection := DataModule1.FDConnection;

    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('UPDATE USUARIOS SET SENHA_TEMP = :SENHA_TEMP, ');
    FDQuery.SQL.Add('SENHA = :SENHA WHERE ID = :ID');

    FDQuery.ParamByName('SENHA_TEMP').AsString := 'S';
    FDQuery.ParamByName('SENHA').AsString      := TBCrypt.GenerateHash(TEMP_PASSWORD);
    FDQuery.ParamByName('ID').AsString         := IdUsuario;

    FDQuery.ExecSQL;

  finally

    FDQuery.Close;
    FDQuery.Free;

  end;
end;

procedure TdmUsuarios.RedefinirSenha(Usuario: TModelUsuario);
var
  FDQuery : TFDQuery;

begin

  FDQuery := TFDQuery.Create(nil);

  try

    //  Estabelece a conexao com o banco
    FDQuery.Connection := DataModule1.FDConnection;

    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('UPDATE USUARIOS SET SENHA_TEMP = :SENHA_TEMP, ');
    FDQuery.SQL.Add('SENHA = :SENHA WHERE ID = :ID');

    FDQuery.ParamByName('SENHA_TEMP').AsString := 'N';
    FDQuery.ParamByName('SENHA').AsString      := TBCrypt.GenerateHash(Usuario.Senha);
    FDQuery.ParamByName('ID').AsString         := Usuario.IdUsuarioLogado;

    FDQuery.ExecSQL;

  finally

    FDQuery.Close;
    FDQuery.Free;

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
