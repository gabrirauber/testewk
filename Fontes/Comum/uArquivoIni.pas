unit uArquivoIni;

interface

uses System.IniFiles, SysUtils;

type
  TArquivoIni = class
  private
    FArquivo: TIniFile;
    function getArquivoIni: TIniFile;
    property Arquivo: TIniFile read getArquivoIni write FArquivo;
  public
    class procedure GravarArquivoIni(Secao, Identificador, Valor: string);
    class function LerArquivoIni(Secao, Identificador: String; ValorPadrao: String = ''): String;
    destructor Destroy; override;
  end;

CONST SESSAOCONEXAOSERV = 'CONEXAOSERVIDOR';
CONST SESSAOCONEXAOBD = 'CONEXAOBANCO';
CONST SESSAOGERAL = 'GERAL';

implementation



{ TArquivoIni }

destructor TArquivoIni.Destroy;
begin
  Arquivo.Free;
  inherited;
end;

function TArquivoIni.getArquivoIni: TIniFile;
begin
  if not Assigned(FArquivo) then
    FArquivo := TIniFile.Create(ExtractFileDir(ParamStr(0)) + '\config.ini');
  Result := FArquivo;
end;

class procedure TArquivoIni.GravarArquivoIni(Secao, Identificador,
  Valor: string);
var
  ArquivoIni: TArquivoIni;
begin
  ArquivoIni := TArquivoIni.Create;
  try
    ArquivoIni.Arquivo.WriteString(Secao, Identificador, Valor);
  finally
    ArquivoIni.Free;
  end;
end;

class function TArquivoIni.LerArquivoIni(Secao, Identificador: string; ValorPadrao: String = ''): String;
var
  ArquivoIni: TArquivoIni;
  Aux: String;
begin
  ArquivoIni := TArquivoIni.Create;
  try
    Result := '';
    Result := ArquivoIni.Arquivo.ReadString(Secao, Identificador, Aux);
    if Result = '' then
      Result := ValorPadrao;

  finally
    ArquivoIni.Free;
  end;

end;

end.
