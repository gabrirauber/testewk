unit udmCadPedidoVenda;

interface

uses
  System.SysUtils, System.Classes, udmBaseCadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClasses, Rest.Json,
  udmConexao, uManagerSession;

type
{$METHODINFO ON}
  TdmCadPedidoVenda = class(TdmBaseCadastro)
  private
    { Private declarations }
    function RetornaProximoNumeroPedido: Integer;
    procedure SalvarPedido(Pedido: TPedido);
    procedure SalvarItens(Pedido: TPedido);
  protected
    function SalvarDados(Json: String): Boolean;override;
    function ExcluirDados(ID: Integer): Boolean;override;
    function RetornaDados(ID: Integer): String;override;
  public
    { Public declarations }
    function RetornaDadosCliente(ID: Integer): String;
  end;
{$METHODINFO OFF}
var
  dmCadPedidoVenda: TdmCadPedidoVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadPedidoVenda }

function TdmCadPedidoVenda.ExcluirDados(ID: Integer): Boolean;
begin
  TConnectionManager.GetDMConexao.fdConexao.StartTransaction;
  try
    Result := True;
    qryCadastro.SQL.Text := 'DELETE FROM PEDIDOITENS ' +
                            ' WHERE IDPEDIDO = :IDPEDIDO';
    qryCadastro.ParamByName('idpedido').AsInteger := ID;
    qryCadastro.ExecSQL;

    qryCadastro.SQL.Text := 'DELETE FROM PEDIDO ' +
                            ' WHERE ID = :IDPEDIDO';
    qryCadastro.ParamByName('idpedido').AsInteger := ID;
    qryCadastro.ExecSQL;

    TConnectionManager.GetDMConexao.fdConexao.Commit;
  except
    on E: Exception do
    begin
      Result := False;
      TConnectionManager.GetDMConexao.fdConexao.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TdmCadPedidoVenda.RetornaDados(ID: Integer): String;
var
  Pedido: TPedido;
  Item: TDadosItemPedido;
begin
  qryConsulta.SQL.Text := 'SELECT P.ID, ' +
                          '       P.VALORTOTAL, ' +
                          '       P.DATAEMISSAO, ' +
                          '       C.ID IDCLIENTE, ' +
                          '       C.NOME,' +
                          '       C.CIDADE,' +
                          '       C.UF  ' +
                          ' FROM PEDIDO P ' +
                          '   JOIN CLIENTE C ON ' +
                          '     C.ID = P.IDCLIENTE ' +
                          ' WHERE P.ID = :ID';
  qryConsulta.ParamByName('ID').AsInteger := ID;
  qryConsulta.Open();
  Pedido := TPedido.Create;
  try
    Pedido.ID := qryConsulta.FieldByName('id').AsInteger;
    Pedido.DataEmissao := qryConsulta.FieldByName('DATAEMISSAO').AsDateTime;
    Pedido.ValorTotal := qryConsulta.FieldByName('VALORTOTAL').AsCurrency;
    Pedido.Cliente := TDadosCliente.Create;
    Pedido.Cliente.ID := qryConsulta.FieldByName('IDCLIENTE').AsInteger;
    Pedido.Cliente.Nome := qryConsulta.FieldByName('NOME').AsString;
    Pedido.Cliente.Cidade := qryConsulta.FieldByName('CIDADE').AsString;
    Pedido.Cliente.UF := qryConsulta.FieldByName('UF').AsString;

    qryConsulta.SQL.Text := 'SELECT PI.ID, ' +
                          '       PI.VALORTOTAL, ' +
                          '       PI.QUANTIDADE, ' +
                          '       PI.VALORUNITARIO, ' +
                          '       P.ID IDPRODUTO,' +
                          '       P.DESCRICAO,' +
                          '       P.PRECOVENDA  ' +
                          ' FROM PEDIDOITENS PI ' +
                          '   JOIN PRODUTO P ON ' +
                          '     P.ID = PI.IDPRODUTO ' +
                          ' WHERE PI.IDPEDIDO = :ID';
    qryConsulta.ParamByName('ID').AsInteger := ID;
    qryConsulta.Open();
    qryConsulta.First;
    while not qryConsulta.Eof do
    begin
      Item := TDadosItemPedido.Create;
      Item.ID := qryConsulta.FieldByName('id').AsInteger;
      Item.Quantidade := qryConsulta.FieldByName('QUANTIDADE').AsFloat;
      Item.ValorUnitario := qryConsulta.FieldByName('VALORUNITARIO').AsCurrency;
      Item.ValorTotal := qryConsulta.FieldByName('VALORTOTAL').AsCurrency;
      Item.Produto := TDadosProduto.Create;
      Item.Produto.ID := qryConsulta.FieldByName('IDPRODUTO').AsInteger;
      Item.Produto.Descricao := qryConsulta.FieldByName('DESCRICAO').AsString;
      Item.Produto.PrecoVenda := qryConsulta.FieldByName('PRECOVENDA').AsCurrency;

      Pedido.InserirItem(Item, -1);

      qryConsulta.Next;
    end;

    Result := TJson.ObjectToJsonString(Pedido);
  finally
    Pedido.Free;
  end;
end;

function TdmCadPedidoVenda.RetornaDadosCliente(ID: Integer): String;
var
  DadoCliente: TDadosCliente;
begin
  Result := '';
  qryConsulta.SQL.Text := 'SELECT * ' +
                         'FROM CLIENTE ' +
                         'WHERE ID = :ID';
  qryConsulta.ParamByName('ID').AsInteger := ID;
  qryConsulta.Open();
  if qryConsulta.RecordCount = 0 then
    Exit;

  DadoCliente := TDadosCliente.Create;
  DadoCliente.ID := qryConsulta.FieldByName('id').AsInteger;
  DadoCliente.Nome := qryConsulta.FieldByName('NOME').AsString;
  DadoCliente.Cidade := qryConsulta.FieldByName('CIDADE').AsString;
  DadoCliente.UF := qryConsulta.FieldByName('UF').AsString;

  Result := TJson.ObjectToJsonString(DadoCliente);
end;

function TdmCadPedidoVenda.RetornaProximoNumeroPedido: Integer;
begin
  qryConsulta.Open('SELECT MAX(ID) MAXID ' +
                   'FROM PEDIDO');
  Result := qryConsulta.FieldByName('MAXID').AsInteger + 1;
end;

function TdmCadPedidoVenda.SalvarDados(Json: String): Boolean;
var
  Pedido: TPedido;
begin
  Result := True;
  Pedido := TJson.JsonToObject<TPedido>(Json);
  TConnectionManager.GetDMConexao.fdConexao.StartTransaction;
  try
    SalvarPedido(Pedido);
    SalvarItens(Pedido);
    TConnectionManager.GetDMConexao.fdConexao.Commit;
  except
    on E: Exception do
    begin
      Result := False;
      TConnectionManager.GetDMConexao.fdConexao.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TdmCadPedidoVenda.SalvarItens(Pedido: TPedido);
var
  I: Integer;

  procedure PreencherParametros;
  begin
    qryCadastro.ParamByName('idproduto').AsInteger := Pedido.Itens[I].Produto.ID; 
    qryCadastro.ParamByName('quantidade').AsFloat := Pedido.Itens[I].Quantidade;
    qryCadastro.ParamByName('valorunitario').AsCurrency := Pedido.Itens[I].ValorUnitario;
    qryCadastro.ParamByName('valortotal').AsCurrency := Pedido.Itens[I].ValorTotal;
  end;
  
begin
  for I := 0 to Length(Pedido.Itens) -1 do
  begin
    if Pedido.Itens[I].ID = 0 then
    begin
      qryCadastro.SQL.Text := 'INSERT INTO pedidoitens  ' +
                            '(idpedido, ' +
                            ' idproduto, ' +
                            ' quantidade, ' +
                            ' valorunitario, ' +
                            ' valortotal) ' +
                            'VALUES ' +
                            '( :idpedido, ' +
                            '  :idproduto, ' +
                            '  :quantidade, ' +
                            '  :valorunitario, ' +
                            '  :valortotal); ';
      qryCadastro.ParamByName('idpedido').AsInteger := Pedido.ID;
      PreencherParametros;

    end
    else if not Pedido.Itens[I].Cancelado then
    begin
      qryCadastro.SQL.Text := 'UPDATE pedidoitens SET' +
                              ' idproduto = :idproduto, ' +
                              ' quantidade = :quantidade, ' +
                              ' valorunitario = :valorunitario, ' +
                              ' valortotal = :valortotal ' +
                              ' WHERE id = :id ';
      qryCadastro.ParamByName('id').AsInteger := Pedido.Itens[I].ID;
      PreencherParametros;
    end
    else
    begin
      qryCadastro.SQL.Text := 'DELETE FROM pedidoitens ' +
                              'WHERE id = :id ';
      qryCadastro.ParamByName('id').AsInteger := Pedido.Itens[I].ID;
    end;
    qryCadastro.ExecSQL;
  end;
end;

procedure TdmCadPedidoVenda.SalvarPedido(Pedido: TPedido);
begin
  if Pedido.ID = -1 then
  begin
    Pedido.ID := RetornaProximoNumeroPedido;
    qryCadastro.SQL.Text := 'INSERT INTO pedido  ' +
                            '(id, ' +
                            ' idcliente, ' +
                            ' valortotal, ' +
                            ' dataemissao) ' +
                            'VALUES ' +
                            '( :id, ' +
                            '  :idcliente, ' +
                            '  :valortotal, ' +
                            '  :dataemissao); ';
  end
  else
  begin
    qryCadastro.SQL.Text := 'UPDATE pedido SET' +
                            ' idcliente = :idcliente, ' +
                            ' valortotal = :valortotal, ' +
                            ' dataemissao = :dataemissao ' +
                            'WHERE id = :id ';
  end;
  qryCadastro.ParamByName('id').AsInteger := Pedido.id;
  qryCadastro.ParamByName('idcliente').AsInteger := Pedido.Cliente.ID;
  qryCadastro.ParamByName('valortotal').AsCurrency := Pedido.ValorTotal;
  qryCadastro.ParamByName('dataemissao').AsDate := Pedido.DataEmissao;

  qryCadastro.ExecSQL;
end;

end.
