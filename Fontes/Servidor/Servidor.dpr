program Servidor;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  Winapi.Windows,
  IdHTTPWebBrokerBridge,
  udmBase in 'Base\udmBase.pas' {DMBase: TDataModule},
  udmBaseCadastro in 'Base\udmBaseCadastro.pas' {dmBaseCadastro: TDataModule},
  udmConexao in 'Geral\udmConexao.pas' {dmConexao: TDataModule},
  uManagerSession in 'Geral\uManagerSession.pas',
  uWebModule in 'Geral\uWebModule.pas' {WebModule1: TWebModule},
  uArquivoIni in '..\Comum\uArquivoIni.pas',
  uClasses in '..\Comum\uClasses.pas',
  ufrmPrincipal in 'Geral\ufrmPrincipal.pas' {frmPrincipal},
  System.SysUtils {dmCadPessoa: TDataModule},
  ufrmConfigIni in 'Geral\ufrmConfigIni.pas' {frmConfigIni},
  udmCadPedidoVenda in 'Cadastros\udmCadPedidoVenda.pas' {dmCadPedidoVenda: TDataModule},
  udmBaseConsulta in 'Base\udmBaseConsulta.pas' {dmBaseConsulta: TDataModule},
  udmConsultaCliente in 'Consultas\udmConsultaCliente.pas' {dmConsultaCliente: TDataModule},
  uComponentsDataSnap in 'Geral\uComponentsDataSnap.pas',
  udmConsultaProduto in 'Consultas\udmConsultaProduto.pas' {dmConsultaProduto: TDataModule},
  udmInserirProduto in 'Geral\udmInserirProduto.pas' {dmInserirProduto: TDataModule},
  udmConsultaPedido in 'Consultas\udmConsultaPedido.pas' {dmConsultaPedido: TDataModule};

{$R *.res}
var
  PastaDLL: String;
begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmBaseConsulta, dmBaseConsulta);
  Application.CreateForm(TdmConsultaCliente, dmConsultaCliente);
  Application.CreateForm(TdmConsultaProduto, dmConsultaProduto);
  Application.CreateForm(TdmInserirProduto, dmInserirProduto);
  Application.CreateForm(TdmConsultaPedido, dmConsultaPedido);
  PastaDLL := TArquivoIni.LerArquivoIni(SESSAOGERAL, 'pathdll');
  if PastaDLL = '' then
    SetDllDirectory(pwidechar(ExtractFileDir(ParamStr(0)) + '\DLL\'))
  else
    SetDllDirectory(pwidechar(PastaDLL));
  Application.Run;
end.
