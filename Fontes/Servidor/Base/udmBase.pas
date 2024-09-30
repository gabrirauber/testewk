unit udmBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Option,
  uManagerSession, FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet;

type
{$METHODINFO ON}
  TDMBase = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  protected
    procedure SetConnection;
  public
    procedure CorrigirTFDQuery;
    function GetDataHoraServidor: Double;
  end;
{$METHODINFO OFF}

var
  DMBase: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMBase }



procedure TDMBase.CorrigirTFDQuery;
var
  i:Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TFDQuery then
    begin
      (Components[i] as TFDQuery).CachedUpdates := True;
      (Components[i] as TFDQuery).FetchOptions.Mode := fmAll;
      (Components[i] as TFDQuery).UpdateOptions.CountUpdatedRecords := False;
      (Components[i] as TFDQuery).UpdateOptions.RefreshMode := rmManual;
    end;
  end;
end;

procedure TDMBase.DataModuleCreate(Sender: TObject);
begin
  SetConnection;
  CorrigirTFDQuery;
end;

function TDMBase.GetDataHoraServidor: Double;
begin
  Result := Now;
end;

procedure TDMBase.SetConnection;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TFDQuery) then
      (Components[i] as TFDQuery).Connection := TConnectionManager.GetDMConexao.fdConexao;
  end;
end;

end.
