unit SistemaFinanceiro.Model.Entidades.Usuario;

interface

type

  TModelUsuario = class
  private
    FLogin: String;
    FNome: String;
    FId: String;
    FSenha_Temp: Boolean;
    FSenha: String;

    procedure SetId(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetSenha_Temp(const Value: Boolean);

  public
    property Nome         : String read FNome write SetNome;
    property Login        : String read FLogin write SetLogin;
    property Id           : String read FId write SetId;
    property Senha        : String read FSenha write SetSenha;
    property Senha_Temp   : Boolean read FSenha_Temp write SetSenha_Temp;



  end;

implementation

{ TModelUsuario }

procedure TModelUsuario.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TModelUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TModelUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TModelUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TModelUsuario.SetSenha_Temp(const Value: Boolean);
begin
  FSenha_Temp := Value;
end;

end.
