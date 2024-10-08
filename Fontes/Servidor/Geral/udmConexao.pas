unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.Client, vcl.Forms,
  FireDAC.Stan.StorageXML, uArquivoIni, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL;

type
  TdmConexao = class(TDataModule)
    fdConexao: TFDConnection;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure fdConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.fdConexaoBeforeConnect(Sender: TObject);
begin
  fdConexao.Params.Values['DriverID'] := 'MySQL';
  fdConexao.Params.Values['DataBase'] := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD,'Database');
  fdConexao.Params.Values['User_name'] := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD,'Username');
  fdConexao.Params.Values['Password'] := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD,'Password');
  fdConexao.Params.Values['Server'] := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD,'Server');
  fdConexao.Params.Values['Port'] := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD,'Port');

  FDPhysMySQLDriverLink1.VendorLib := TArquivoIni.LerArquivoIni(SESSAOGERAL,'pathdll',ExtractFileDir(ParamStr(0)) + '\DLL\') + 'libmysql.dll';
end;

end.
