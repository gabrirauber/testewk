unit udmBaseConsulta;

interface

uses
  System.SysUtils, System.Classes, udmBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON;

type
  TdmBaseConsulta = class(TDMBase)
    qryConsulta: TFDQuery;
  private
    { Private declarations }
  protected
    function RetornaCabecalhos: TJSONArray;virtual;
    function MontarSQLBase: String;virtual;
    procedure RealizarConsultaBD(Filtro: String);virtual;
  public
    { Public declarations }
    function RetornaDadosConsulta(Filtro: String): String;virtual;
  end;
var
  dmBaseConsulta: TdmBaseConsulta;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConsulta }

function TdmBaseConsulta.MontarSQLBase: String;
begin

end;

procedure TdmBaseConsulta.RealizarConsultaBD(Filtro: String);
begin
  qryConsulta.SQL.Text := MontarSQLBase;
end;

function TdmBaseConsulta.RetornaCabecalhos: TJSONArray;
begin
  Result := nil
end;

function TdmBaseConsulta.RetornaDadosConsulta(Filtro: String): String;
var
  Retorno: TJSONObject;
  Dados: TJSONArray;
  Cliente: TJSONObject;
  I: Integer;
begin
  RealizarConsultaBD(Filtro);
  Dados := TJSONArray.Create;
  qryConsulta.First;
  while not qryConsulta.Eof do
  begin
    Cliente := TJSONObject.Create;
    for I := 0 to qryConsulta.FieldCount -1 do
    begin
      case qryConsulta.Fields[i].DataType of
        ftCurrency,
        ftFloat,
        ftBCD: Cliente.AddPair(qryConsulta.Fields[I].FieldName, qryConsulta.Fields[I].AsCurrency);
        else
          Cliente.AddPair(qryConsulta.Fields[I].FieldName, qryConsulta.Fields[I].AsString);
      end
    end;
    Dados.Add(Cliente);
    qryConsulta.Next;
  end;

  Retorno := TJSONObject.Create;
  try
    Retorno.AddPair('cabecalho', RetornaCabecalhos);
    Retorno.AddPair('dados', Dados);
    Result := Retorno.ToString
  finally
    Retorno.Free;
  end;
end;

end.
