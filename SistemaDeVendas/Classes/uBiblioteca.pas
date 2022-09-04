unit uBiblioteca;

interface
uses
IniFiles, System.SysUtils;

  procedure setValorIni(pLocal, pSessao, pSubSessao, pValor: string);
  function getValorIni(pLocal, pSessao, pSubSessao: string): string;

implementation

uses
  Vcl.Forms;

  procedure setValorIni(pLocal, pSessao, pSubSessao, pValor: string);

  var vArquivo: TIniFile;

  begin

    //  Criando arquivo ini
    vArquivo := TIniFile.Create(pLocal);

    //  Escrevendo no ini
    vArquivo.WriteString(pSessao, pSubSessao, pValor);

    vArquivo.Free;
  end;
  //ExtractFilePath(Application.ExeName) + 'config.ini'

  function getValorIni(pLocal, pSessao, pSubSessao: string): string;

  var vArquivo: TIniFile;

  begin

  vArquivo := TIniFile.Create(pLocal);

  Result := vArquivo.ReadString(pSessao, pSubSessao, '');

  vArquivo.Free;

  end;
end.
