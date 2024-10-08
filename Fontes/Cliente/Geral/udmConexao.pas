unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, uMethods, Datasnap.DSClientRest, uArquivoIni,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON;

type
  TdmConexao = class(TDataModule)
    rConexao: TDSRestConnection;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    FInstanceOwner: Boolean;
    { Private declarations }
    procedure ConfigurarConexao;
  public
    constructor Create(AOwner: TComponent); override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;

end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.ConfigurarConexao;
var
  Retorno: String;
begin
  Retorno := TArquivoIni.LerArquivoIni('CONEXAO','IP');
  if Retorno = '' then
  begin
    TArquivoIni.GravarArquivoIni('CONEXAO','IP','127.0.0.1');
    Retorno := '127.0.0.1';
  end;
  rConexao.Host := Retorno;
  Retorno := TArquivoIni.LerArquivoIni('CONEXAO','PORTA');
  if Retorno = '' then
  begin
    TArquivoIni.GravarArquivoIni('CONEXAO','PORTA','8080');
    Retorno := '8080';
  end;
  rConexao.Port := StrToInt(Retorno);

end;

constructor TdmConexao.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
  ConfigurarConexao;

end;


end.
