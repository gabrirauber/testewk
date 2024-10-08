unit udmInserirProduto;

interface

uses
  System.SysUtils, System.Classes, udmBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClasses, Rest.Json;

type
{$METHODINFO ON}
  TdmInserirProduto = class(TDMBase)
    qryConsulta: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function RetornaDadosProduto(ID: Integer): String;
  end;
{$METHODINFO OFF}
var
  dmInserirProduto: TdmInserirProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmInserirProduto }

function TdmInserirProduto.RetornaDadosProduto(ID: Integer): String;
var
  DadoProduto: TDadosProduto;
begin
  Result := '';
  qryConsulta.SQL.Text := 'SELECT * ' +
                         'FROM PRODUTO ' +
                         'WHERE ID = :ID';
  qryConsulta.ParamByName('ID').AsInteger := ID;
  qryConsulta.Open();
  if qryConsulta.RecordCount = 0 then
    Exit;

  DadoProduto := TDadosProduto.Create;
  DadoProduto.ID := qryConsulta.FieldByName('id').AsInteger;
  DadoProduto.Descricao := qryConsulta.FieldByName('descricao').AsString;
  DadoProduto.PrecoVenda := qryConsulta.FieldByName('precovenda').AsCurrency;

  Result := TJson.ObjectToJsonString(DadoProduto);
end;

end.
