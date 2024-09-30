unit udmPedidoVenda;

interface

uses
  System.SysUtils, System.Classes, udmBaseCadastro, uMethods, udmConexao,
  uClasses, Rest.Json, uInterfaces;

type
  TMethodsPedidoVenda = class(TdmCadPedidoVendaClient, IBaseCadastro)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;
  TdmPedidoVenda = class(TdmBaseCadastro)
    procedure DataModuleCreate(Sender: TObject);
  private
    FPedido: TPedido;
    { Private declarations }
  public
    { Public declarations }
    function CarregarDadosCliente(ID: Integer): TDadosCliente;
    property Pedido: TPedido read FPedido write FPedido;
    function SalvarCadastro: Boolean;override;
  end;

var
  dmPedidoVenda: TdmPedidoVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPedidoVenda }

function TdmPedidoVenda.CarregarDadosCliente(ID: Integer): TDadosCliente;
var
  Methods: TdmCadPedidoVendaClient;
begin
  Methods := TdmCadPedidoVendaClient.Create(dmConexao.rConexao);
  try
    Result := TJson.JsonToObject<TDadosCliente>(Methods.RetornaDadosCliente(ID));
  finally
    Methods.Free;
  end;
end;

procedure TdmPedidoVenda.DataModuleCreate(Sender: TObject);
begin
  FMethods := TMethodsPedidoVenda.Create(dmConexao.rConexao);
  inherited;
end;


function TdmPedidoVenda.SalvarCadastro: Boolean;
begin
  JsonSalvar := TJson.ObjectToJsonString(Pedido);
  Result := inherited;
end;

{ TMethodsPedidoVenda }

function TMethodsPedidoVenda.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := -1
end;

function TMethodsPedidoVenda._AddRef: Integer;
begin
  Result := -1
end;

function TMethodsPedidoVenda._Release: Integer;
begin
  Result := -1
end;

end.
