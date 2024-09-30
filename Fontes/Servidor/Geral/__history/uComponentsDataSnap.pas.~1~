unit uComponentsDataSnap;

interface

uses Classes, DSServer, DSTCPServerTransport, DSReflect, SysUtils,
     DSCommonServer, rtti;

type

TDSServidorClass = Class(TDSServerClass)
private
  FClassDisp: TPersistentClass;
protected
  function GetDSClass: TDSClass; override;
published
   property ClassDisp: TPersistentClass read FClassDisp write FClassDisp;
end;

implementation

uses DataBKR, DSNames, DBXCommon, DSServerResStrs, Dialogs;

function TDSServidorClass.GetDSClass;
begin
  Result := nil;
  if FClassDisp <> nil then
    Result := TDSClass.Create(FClassDisp, False)
  else
    Result := inherited GetDSClass;
end;

end.
