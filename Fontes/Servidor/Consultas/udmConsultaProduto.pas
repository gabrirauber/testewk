unit udmConsultaProduto;

interface

uses
  System.SysUtils, System.Classes, udmBaseConsulta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON;

type
{$METHODINFO ON}
  TdmConsultaProduto = class(TdmBaseConsulta)
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
  dmConsultaProduto: TdmConsultaProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConsultaProduto }

function TdmConsultaProduto.MontarSQLBase: String;
begin
  Result := 'SELECT ID, ' +
            '       DESCRICAO, ' +
            '       PRECOVENDA ' +
            'FROM PRODUTO';
end;

procedure TdmConsultaProduto.RealizarConsultaBD(Filtro: String);
begin
  inherited;
  if Filtro <> '' then
    qryConsulta.SQL.Text := qryConsulta.SQL.Text + ' WHERE UPPER(DESCRICAO) LIKE UPPER('+ QuotedStr( '%' + Filtro + '%') +')';

  qryConsulta.Open();
end;

function TdmConsultaProduto.RetornaCabecalhos: TJSONArray;
begin
  Result := TJSONArray.Create;
  Result.Add('Código');
  Result.Add('Descrição');
  Result.Add('Preço venda');

end;

end.
