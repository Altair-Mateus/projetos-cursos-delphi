unit uAviao;

interface

uses
  Vcl.Dialogs;

type
TAviao = class
  Descricao: string;
  Capacidade: integer;
  HorasVoo: integer;

  procedure Mover;
end;

implementation

{ TAviao }

procedure TAviao.Mover;
begin

  ShowMessage(Descricao + ' entrou em movimento!');

end;

end.
