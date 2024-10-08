unit udmConsultaCliente;

interface

uses
  System.SysUtils, System.Classes, udmBaseConsulta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON;

type
{$METHODINFO ON}
  TdmConsultaCliente = class(TdmBaseConsulta)
  private
    { Private declarations }
  protected
    function RetornaCabecalhos: TJSONArray;override;
    function MontarSQLBase: String;override;
    procedure RealizarConsultaBD(Filtro: String);override;
  public
    { Public declarations }
  end;
{$METHODINFO OFF}
var
  dmConsultaCliente: TdmConsultaCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConsultaCliente }

function TdmConsultaCliente.MontarSQLBase: String;
begin
  Result := 'SELECT ID,' +
             '       NOME,' +
             '       CIDADE,' +
             '       UF' +
             ' FROM CLIENTE '
end;

procedure TdmConsultaCliente.RealizarConsultaBD(Filtro: String);
begin
  inherited;
  if Filtro <> '' then
    qryConsulta.SQL.Text := qryConsulta.SQL.Text + ' WHERE UPPER(NOME) LIKE UPPER('+ QuotedStr( '%' + Filtro + '%') +')';
  qryConsulta.Open();
end;

function TdmConsultaCliente.RetornaCabecalhos: TJSONArray;
begin
  Result := TJSONArray.Create;
  Result.Add('C�digo');
  Result.Add('Nome');
  Result.Add('Cidade');
  Result.Add('UF');
end;


end.
