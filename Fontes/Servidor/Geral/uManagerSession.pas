unit uManagerSession;

interface

uses udmConexao, Generics.Collections, Datasnap.DSSession, Dialogs, SysUtils;

type
  TConnectionManager = class
    class var FDictionaryConnection: TDictionary<Integer, TDMConexao>;
    class function GetDMConexao: TDMConexao;
    class procedure RemoveDMConexao;
  end;

implementation

{ TConnectionManager }

class function TConnectionManager.GetDMConexao: TDMConexao;
var
  ASessionID: Integer;
begin
  ASessionID := TDSSessionManager.GetThreadSession.Id;
  if not FDictionaryConnection.TryGetValue(ASessionID, Result) then
  begin
    Result := TDMConexao.Create(nil);
    FDictionaryConnection.Add(ASessionID, Result);
  end;
end;

class procedure TConnectionManager.RemoveDMConexao;
var
  ADMConexao: TDMConexao;
  ASessionID: Integer;
begin
  TMonitor.Enter(FDictionaryConnection);
  try
    ASessionID := TDSSessionManager.GetThreadSession.Id;
    if FDictionaryConnection.TryGetValue(ASessionID, ADMConexao) then
      ADMConexao.Free;
    FDictionaryConnection.Remove(ASessionID);
  finally
    TMonitor.Exit(FDictionaryConnection);
  end;
end;

initialization
  TConnectionManager.FDictionaryConnection := TDictionary<Integer, TDMConexao>.Create();
finalization
  TConnectionManager.FDictionaryConnection.Free;
end.
