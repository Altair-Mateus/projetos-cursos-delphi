unit uCliente;

interface

Type

  TCliente = class

  private
    FEmail : String;
    FNome  : String;

  protected


  public
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;

  published


  end;

implementation

end.
