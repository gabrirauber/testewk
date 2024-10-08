unit udmConsultaPedido;

interface

uses
  System.SysUtils, System.Classes, udmBaseConsulta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON;

type
{$METHODINFO ON}
  TdmConsultaPedido = class(TdmBaseConsulta)
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
  dmConsultaPedido: TdmConsultaPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConsultaPedido }

function TdmConsultaPedido.MontarSQLBase: String;
begin
  Result := 'SELECT P.ID, ' +
            '       CL.NOME, ' +
            '       P.DATAEMISSAO, ' +
            '       P.VALORTOTAL ' +
            ' FROM PEDIDO P ' +
            ' JOIN CLIENTE CL ON' +
            '   CL.ID = P.IDCLIENTE';
end;

procedure TdmConsultaPedido.RealizarConsultaBD(Filtro: String);
begin
  inherited;
  if Filtro <> '' then
    qryConsulta.SQL.Text := qryConsulta.SQL.Text + ' WHERE UPPER(NOME) LIKE UPPER('+ QuotedStr( '%' + Filtro + '%') +')';
  qryConsulta.Open();
end;

function TdmConsultaPedido.RetornaCabecalhos: TJSONArray;
begin
  Result := TJSONArray.Create;
  Result.Add('Pedido');
  Result.Add('Cliente');
  Result.Add('Data de emiss�o');
  Result.Add('Valor total');
end;

end.
