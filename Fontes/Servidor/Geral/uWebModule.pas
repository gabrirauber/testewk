unit uWebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, Datasnap.DSClientMetadata, Datasnap.DSCommonServer,
  Datasnap.DSHTTP, udmConsultaProduto, udmInserirProduto, udmConsultaPedido;

type
  TWebModule1 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServer1: TDSServer;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarClasses;

  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation


{$R *.dfm}

uses Web.WebReq,  uManagerSession, udmBase,
  udmbasecadastro, udmBaseConsulta, uComponentsDataSnap, udmCadPedidoVenda,
  udmConsultaCliente;

procedure TWebModule1.RegistrarClasses;

  procedure AddServerClass(_AClass: TPersistentClass; _ALifeCycle: string);
  var
    AServerClass: TDSServidorClass;
  begin
    AServerClass := TDSServidorClass.Create(Self);
    AServerClass.LifeCycle := _ALifeCycle;
    AServerClass.Server := DSServer1;
    AServerClass.ClassDisp := _AClass;
  end;

begin
  AddServerClass(TDMBase, 'Invocation');
  AddServerClass(TdmBaseCadastro, 'Invocation');
  AddServerClass(TdmBaseConsulta, 'Invocation');
  AddServerClass(TdmCadPedidoVenda, 'Invocation');
  AddServerClass(TdmConsultaCliente, 'Invocation');
  AddServerClass(TdmConsultaProduto, 'Invocation');
  AddServerClass(TdmInserirProduto, 'Invocation');
  AddServerClass(TdmConsultaPedido, 'Invocation');
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>DataSnap Server</title></head>' +
    '<body>DataSnap Server</body>' +
    '</html>';
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  DSServer1.Stop;
  RegistrarClasses;
  DSServer1.Start;
end;

procedure TWebModule1.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  TConnectionManager.RemoveDMConexao;
end;



initialization
finalization
  Web.WebReq.FreeWebModules;

end.

