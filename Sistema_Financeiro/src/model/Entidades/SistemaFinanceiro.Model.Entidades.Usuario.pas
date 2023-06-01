unit SistemaFinanceiro.Model.Entidades.Usuario;

interface

type

  TModelUsuario = class
  private
    FLoginUsuarioLogado: String;
    FNomeUsuarioLogado: String;
    FIdUsuarioLogado: String;
    FSenha_Temp: Boolean;
    FSenha: String;

    procedure SetIdUsuarioLogado(const Value: String);
    procedure SetLoginUsuarioLogado(const Value: String);
    procedure SetNomeUsuarioLogado(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetSenha_Temp(const Value: Boolean);

  public
    property NomeUsuarioLogado  : String read FNomeUsuarioLogado write SetNomeUsuarioLogado;
    property LoginUsuarioLogado : String read FLoginUsuarioLogado write SetLoginUsuarioLogado;
    property IdUsuarioLogado    : String read FIdUsuarioLogado write SetIdUsuarioLogado;
    property Senha              : String read FSenha write SetSenha;
    property Senha_Temp         : Boolean read FSenha_Temp write SetSenha_Temp;



  end;

implementation

{ TModelUsuario }

procedure TModelUsuario.SetIdUsuarioLogado(const Value: String);
begin
  FIdUsuarioLogado := Value;
end;

procedure TModelUsuario.SetLoginUsuarioLogado(const Value: String);
begin
  FLoginUsuarioLogado := Value;
end;

procedure TModelUsuario.SetNomeUsuarioLogado(const Value: String);
begin
  FNomeUsuarioLogado := Value;
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
