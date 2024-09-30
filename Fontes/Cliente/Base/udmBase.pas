unit udmBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Option;

type
  TdmBase = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CorrigirFetchOptionsMode;
  end;

var
  dmBase: TdmBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmBase.CorrigirFetchOptionsMode;
var
  i:Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TFDMemTable then
    begin
      (Components[i] as TFDMemTable).FetchOptions.Mode := fmAll;
      (Components[i] as TFDMemTable).UpdateOptions.CountUpdatedRecords := False;
      (Components[i] as TFDMemTable).UpdateOptions.RefreshMode := rmManual;
    end;
  end;

end;

procedure TdmBase.DataModuleCreate(Sender: TObject);
begin
  CorrigirFetchOptionsMode;
end;

end.
