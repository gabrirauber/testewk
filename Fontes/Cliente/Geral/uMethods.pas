//
// Created by the DataSnap proxy generator.
// 30/09/2024 16:42:07
//

unit uMethods;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDMBaseClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmBaseCadastroClient = class(TDSAdminRestClient)
  private
    FSalvarCadastroCommand: TDSRestCommand;
    FExcluirCadastroCommand: TDSRestCommand;
    FRetornaDadosCadastroCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SalvarCadastro(Json: string; var Erro: string; const ARequestFilter: string = ''): Boolean;
    function ExcluirCadastro(ID: Integer; var Erro: string; const ARequestFilter: string = ''): Boolean;
    function RetornaDadosCadastro(ID: Integer; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmBaseConsultaClient = class(TDSAdminRestClient)
  private
    FRetornaDadosConsultaCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmCadPedidoVendaClient = class(TDSAdminRestClient)
  private
    FRetornaDadosClienteCommand: TDSRestCommand;
    FSalvarCadastroCommand: TDSRestCommand;
    FExcluirCadastroCommand: TDSRestCommand;
    FRetornaDadosCadastroCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosCliente(ID: Integer; const ARequestFilter: string = ''): string;
    function SalvarCadastro(Json: string; var Erro: string; const ARequestFilter: string = ''): Boolean;
    function ExcluirCadastro(ID: Integer; var Erro: string; const ARequestFilter: string = ''): Boolean;
    function RetornaDadosCadastro(ID: Integer; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmConsultaClienteClient = class(TDSAdminRestClient)
  private
    FRetornaDadosConsultaCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmConsultaProdutoClient = class(TDSAdminRestClient)
  private
    FRetornaDadosConsultaCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmInserirProdutoClient = class(TDSAdminRestClient)
  private
    FRetornaDadosProdutoCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosProduto(ID: Integer; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

  TdmConsultaPedidoClient = class(TDSAdminRestClient)
  private
    FRetornaDadosConsultaCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FCorrigirTFDQueryCommand: TDSRestCommand;
    FGetDataHoraServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string = ''): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor(const ARequestFilter: string = ''): Double;
  end;

const
  TDMBase_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TDMBase_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmBaseCadastro_SalvarCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Json'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TdmBaseCadastro_ExcluirCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TdmBaseCadastro_RetornaDadosCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmBaseCadastro_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmBaseCadastro_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmBaseConsulta_RetornaDadosConsulta: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Filtro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmBaseConsulta_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmBaseConsulta_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmCadPedidoVenda_RetornaDadosCliente: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmCadPedidoVenda_SalvarCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Json'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TdmCadPedidoVenda_ExcluirCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TdmCadPedidoVenda_RetornaDadosCadastro: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmCadPedidoVenda_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmCadPedidoVenda_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmConsultaCliente_RetornaDadosConsulta: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Filtro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmConsultaCliente_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmConsultaCliente_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmConsultaProduto_RetornaDadosConsulta: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Filtro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmConsultaProduto_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmConsultaProduto_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmInserirProduto_RetornaDadosProduto: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmInserirProduto_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmInserirProduto_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

  TdmConsultaPedido_RetornaDadosConsulta: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Filtro'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Erro'; Direction: 3; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TdmConsultaPedido_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TdmConsultaPedido_GetDataHoraServidor: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 7; TypeName: 'Double')
  );

implementation

procedure TDMBaseClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TDMBase."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TDMBase_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TDMBaseClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TDMBase.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TDMBaseClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TDMBase.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TDMBase_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TDMBaseClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDMBaseClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDMBaseClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmBaseCadastroClient.SalvarCadastro(Json: string; var Erro: string; const ARequestFilter: string): Boolean;
begin
  if FSalvarCadastroCommand = nil then
  begin
    FSalvarCadastroCommand := FConnection.CreateCommand;
    FSalvarCadastroCommand.RequestType := 'GET';
    FSalvarCadastroCommand.Text := 'TdmBaseCadastro.SalvarCadastro';
    FSalvarCadastroCommand.Prepare(TdmBaseCadastro_SalvarCadastro);
  end;
  FSalvarCadastroCommand.Parameters[0].Value.SetWideString(Json);
  FSalvarCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FSalvarCadastroCommand.Execute(ARequestFilter);
  Erro := FSalvarCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FSalvarCadastroCommand.Parameters[2].Value.GetBoolean;
end;

function TdmBaseCadastroClient.ExcluirCadastro(ID: Integer; var Erro: string; const ARequestFilter: string): Boolean;
begin
  if FExcluirCadastroCommand = nil then
  begin
    FExcluirCadastroCommand := FConnection.CreateCommand;
    FExcluirCadastroCommand.RequestType := 'GET';
    FExcluirCadastroCommand.Text := 'TdmBaseCadastro.ExcluirCadastro';
    FExcluirCadastroCommand.Prepare(TdmBaseCadastro_ExcluirCadastro);
  end;
  FExcluirCadastroCommand.Parameters[0].Value.SetInt32(ID);
  FExcluirCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FExcluirCadastroCommand.Execute(ARequestFilter);
  Erro := FExcluirCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FExcluirCadastroCommand.Parameters[2].Value.GetBoolean;
end;

function TdmBaseCadastroClient.RetornaDadosCadastro(ID: Integer; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosCadastroCommand = nil then
  begin
    FRetornaDadosCadastroCommand := FConnection.CreateCommand;
    FRetornaDadosCadastroCommand.RequestType := 'GET';
    FRetornaDadosCadastroCommand.Text := 'TdmBaseCadastro.RetornaDadosCadastro';
    FRetornaDadosCadastroCommand.Prepare(TdmBaseCadastro_RetornaDadosCadastro);
  end;
  FRetornaDadosCadastroCommand.Parameters[0].Value.SetInt32(ID);
  FRetornaDadosCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosCadastroCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosCadastroCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmBaseCadastroClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmBaseCadastro."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmBaseCadastro_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmBaseCadastroClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmBaseCadastro.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmBaseCadastroClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmBaseCadastro.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmBaseCadastro_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmBaseCadastroClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmBaseCadastroClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmBaseCadastroClient.Destroy;
begin
  FSalvarCadastroCommand.DisposeOf;
  FExcluirCadastroCommand.DisposeOf;
  FRetornaDadosCadastroCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmBaseConsultaClient.RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosConsultaCommand = nil then
  begin
    FRetornaDadosConsultaCommand := FConnection.CreateCommand;
    FRetornaDadosConsultaCommand.RequestType := 'GET';
    FRetornaDadosConsultaCommand.Text := 'TdmBaseConsulta.RetornaDadosConsulta';
    FRetornaDadosConsultaCommand.Prepare(TdmBaseConsulta_RetornaDadosConsulta);
  end;
  FRetornaDadosConsultaCommand.Parameters[0].Value.SetWideString(Filtro);
  FRetornaDadosConsultaCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosConsultaCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosConsultaCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosConsultaCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmBaseConsultaClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmBaseConsulta."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmBaseConsulta_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmBaseConsultaClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmBaseConsulta.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmBaseConsultaClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmBaseConsulta.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmBaseConsulta_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmBaseConsultaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmBaseConsultaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmBaseConsultaClient.Destroy;
begin
  FRetornaDadosConsultaCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmCadPedidoVendaClient.RetornaDadosCliente(ID: Integer; const ARequestFilter: string): string;
begin
  if FRetornaDadosClienteCommand = nil then
  begin
    FRetornaDadosClienteCommand := FConnection.CreateCommand;
    FRetornaDadosClienteCommand.RequestType := 'GET';
    FRetornaDadosClienteCommand.Text := 'TdmCadPedidoVenda.RetornaDadosCliente';
    FRetornaDadosClienteCommand.Prepare(TdmCadPedidoVenda_RetornaDadosCliente);
  end;
  FRetornaDadosClienteCommand.Parameters[0].Value.SetInt32(ID);
  FRetornaDadosClienteCommand.Execute(ARequestFilter);
  Result := FRetornaDadosClienteCommand.Parameters[1].Value.GetWideString;
end;

function TdmCadPedidoVendaClient.SalvarCadastro(Json: string; var Erro: string; const ARequestFilter: string): Boolean;
begin
  if FSalvarCadastroCommand = nil then
  begin
    FSalvarCadastroCommand := FConnection.CreateCommand;
    FSalvarCadastroCommand.RequestType := 'GET';
    FSalvarCadastroCommand.Text := 'TdmCadPedidoVenda.SalvarCadastro';
    FSalvarCadastroCommand.Prepare(TdmCadPedidoVenda_SalvarCadastro);
  end;
  FSalvarCadastroCommand.Parameters[0].Value.SetWideString(Json);
  FSalvarCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FSalvarCadastroCommand.Execute(ARequestFilter);
  Erro := FSalvarCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FSalvarCadastroCommand.Parameters[2].Value.GetBoolean;
end;

function TdmCadPedidoVendaClient.ExcluirCadastro(ID: Integer; var Erro: string; const ARequestFilter: string): Boolean;
begin
  if FExcluirCadastroCommand = nil then
  begin
    FExcluirCadastroCommand := FConnection.CreateCommand;
    FExcluirCadastroCommand.RequestType := 'GET';
    FExcluirCadastroCommand.Text := 'TdmCadPedidoVenda.ExcluirCadastro';
    FExcluirCadastroCommand.Prepare(TdmCadPedidoVenda_ExcluirCadastro);
  end;
  FExcluirCadastroCommand.Parameters[0].Value.SetInt32(ID);
  FExcluirCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FExcluirCadastroCommand.Execute(ARequestFilter);
  Erro := FExcluirCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FExcluirCadastroCommand.Parameters[2].Value.GetBoolean;
end;

function TdmCadPedidoVendaClient.RetornaDadosCadastro(ID: Integer; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosCadastroCommand = nil then
  begin
    FRetornaDadosCadastroCommand := FConnection.CreateCommand;
    FRetornaDadosCadastroCommand.RequestType := 'GET';
    FRetornaDadosCadastroCommand.Text := 'TdmCadPedidoVenda.RetornaDadosCadastro';
    FRetornaDadosCadastroCommand.Prepare(TdmCadPedidoVenda_RetornaDadosCadastro);
  end;
  FRetornaDadosCadastroCommand.Parameters[0].Value.SetInt32(ID);
  FRetornaDadosCadastroCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosCadastroCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosCadastroCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosCadastroCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmCadPedidoVendaClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmCadPedidoVenda."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmCadPedidoVenda_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmCadPedidoVendaClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmCadPedidoVenda.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmCadPedidoVendaClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmCadPedidoVenda.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmCadPedidoVenda_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmCadPedidoVendaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmCadPedidoVendaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmCadPedidoVendaClient.Destroy;
begin
  FRetornaDadosClienteCommand.DisposeOf;
  FSalvarCadastroCommand.DisposeOf;
  FExcluirCadastroCommand.DisposeOf;
  FRetornaDadosCadastroCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmConsultaClienteClient.RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosConsultaCommand = nil then
  begin
    FRetornaDadosConsultaCommand := FConnection.CreateCommand;
    FRetornaDadosConsultaCommand.RequestType := 'GET';
    FRetornaDadosConsultaCommand.Text := 'TdmConsultaCliente.RetornaDadosConsulta';
    FRetornaDadosConsultaCommand.Prepare(TdmConsultaCliente_RetornaDadosConsulta);
  end;
  FRetornaDadosConsultaCommand.Parameters[0].Value.SetWideString(Filtro);
  FRetornaDadosConsultaCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosConsultaCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosConsultaCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosConsultaCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmConsultaClienteClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmConsultaCliente."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmConsultaCliente_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmConsultaClienteClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmConsultaCliente.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmConsultaClienteClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmConsultaCliente.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmConsultaCliente_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmConsultaClienteClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmConsultaClienteClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmConsultaClienteClient.Destroy;
begin
  FRetornaDadosConsultaCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmConsultaProdutoClient.RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosConsultaCommand = nil then
  begin
    FRetornaDadosConsultaCommand := FConnection.CreateCommand;
    FRetornaDadosConsultaCommand.RequestType := 'GET';
    FRetornaDadosConsultaCommand.Text := 'TdmConsultaProduto.RetornaDadosConsulta';
    FRetornaDadosConsultaCommand.Prepare(TdmConsultaProduto_RetornaDadosConsulta);
  end;
  FRetornaDadosConsultaCommand.Parameters[0].Value.SetWideString(Filtro);
  FRetornaDadosConsultaCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosConsultaCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosConsultaCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosConsultaCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmConsultaProdutoClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmConsultaProduto."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmConsultaProduto_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmConsultaProdutoClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmConsultaProduto.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmConsultaProdutoClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmConsultaProduto.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmConsultaProduto_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmConsultaProdutoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmConsultaProdutoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmConsultaProdutoClient.Destroy;
begin
  FRetornaDadosConsultaCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmInserirProdutoClient.RetornaDadosProduto(ID: Integer; const ARequestFilter: string): string;
begin
  if FRetornaDadosProdutoCommand = nil then
  begin
    FRetornaDadosProdutoCommand := FConnection.CreateCommand;
    FRetornaDadosProdutoCommand.RequestType := 'GET';
    FRetornaDadosProdutoCommand.Text := 'TdmInserirProduto.RetornaDadosProduto';
    FRetornaDadosProdutoCommand.Prepare(TdmInserirProduto_RetornaDadosProduto);
  end;
  FRetornaDadosProdutoCommand.Parameters[0].Value.SetInt32(ID);
  FRetornaDadosProdutoCommand.Execute(ARequestFilter);
  Result := FRetornaDadosProdutoCommand.Parameters[1].Value.GetWideString;
end;

procedure TdmInserirProdutoClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmInserirProduto."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmInserirProduto_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmInserirProdutoClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmInserirProduto.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmInserirProdutoClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmInserirProduto.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmInserirProduto_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmInserirProdutoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmInserirProdutoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmInserirProdutoClient.Destroy;
begin
  FRetornaDadosProdutoCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

function TdmConsultaPedidoClient.RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string): string;
begin
  if FRetornaDadosConsultaCommand = nil then
  begin
    FRetornaDadosConsultaCommand := FConnection.CreateCommand;
    FRetornaDadosConsultaCommand.RequestType := 'GET';
    FRetornaDadosConsultaCommand.Text := 'TdmConsultaPedido.RetornaDadosConsulta';
    FRetornaDadosConsultaCommand.Prepare(TdmConsultaPedido_RetornaDadosConsulta);
  end;
  FRetornaDadosConsultaCommand.Parameters[0].Value.SetWideString(Filtro);
  FRetornaDadosConsultaCommand.Parameters[1].Value.SetWideString(Erro);
  FRetornaDadosConsultaCommand.Execute(ARequestFilter);
  Erro := FRetornaDadosConsultaCommand.Parameters[1].Value.GetWideString;
  Result := FRetornaDadosConsultaCommand.Parameters[2].Value.GetWideString;
end;

procedure TdmConsultaPedidoClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TdmConsultaPedido."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TdmConsultaPedido_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TdmConsultaPedidoClient.CorrigirTFDQuery;
begin
  if FCorrigirTFDQueryCommand = nil then
  begin
    FCorrigirTFDQueryCommand := FConnection.CreateCommand;
    FCorrigirTFDQueryCommand.RequestType := 'GET';
    FCorrigirTFDQueryCommand.Text := 'TdmConsultaPedido.CorrigirTFDQuery';
  end;
  FCorrigirTFDQueryCommand.Execute;
end;

function TdmConsultaPedidoClient.GetDataHoraServidor(const ARequestFilter: string): Double;
begin
  if FGetDataHoraServidorCommand = nil then
  begin
    FGetDataHoraServidorCommand := FConnection.CreateCommand;
    FGetDataHoraServidorCommand.RequestType := 'GET';
    FGetDataHoraServidorCommand.Text := 'TdmConsultaPedido.GetDataHoraServidor';
    FGetDataHoraServidorCommand.Prepare(TdmConsultaPedido_GetDataHoraServidor);
  end;
  FGetDataHoraServidorCommand.Execute(ARequestFilter);
  Result := FGetDataHoraServidorCommand.Parameters[0].Value.GetDouble;
end;

constructor TdmConsultaPedidoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TdmConsultaPedidoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TdmConsultaPedidoClient.Destroy;
begin
  FRetornaDadosConsultaCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FCorrigirTFDQueryCommand.DisposeOf;
  FGetDataHoraServidorCommand.DisposeOf;
  inherited;
end;

end.

