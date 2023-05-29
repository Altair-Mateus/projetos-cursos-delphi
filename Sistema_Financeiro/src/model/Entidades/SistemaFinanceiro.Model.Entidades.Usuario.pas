unit SistemaFinanceiro.Model.Entidades.Usuario;

interface

type

  TModelUsuario = class
  private
    FLoginUsuarioLogado: String;
    FNomeUsuarioLogado: String;
    FIdUsuarioLogado: String;
    procedure SetIdUsuarioLogado(const Value: String);
    procedure SetLoginUsuarioLogado(const Value: String);
    procedure SetNomeUsuarioLogado(const Value: String);

  public
    property NomeUsuarioLogado : String read FNomeUsuarioLogado write SetNomeUsuarioLogado;
    property LoginUsuarioLogado : String read FLoginUsuarioLogado write SetLoginUsuarioLogado;
    property IdUsuarioLogado : String read FIdUsuarioLogado write SetIdUsuarioLogado;



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

end.
