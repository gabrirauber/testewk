unit uClasses;

interface

uses
  System.SysUtils, System.Generics.Collections, REST.Json;

type
  TDados = class

  end;

  TDadosCliente = class(TDados)
  private
    FID: Integer;
    FNome: String;
    FCidade: String;
    FUF: String;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
  end;

  TDadosPedido = class(TDados)
  private
    FID: Integer;
    FNome: String;
    FDataEmissao: String;
    FValortotal: Currency;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property DataEmissao: String read FDataEmissao write FDataEmissao;
    property Valortotal: Currency read FValortotal write FValortotal;
  end;


  TDadosProduto = class(TDados)
  private
    FID: Integer;
    FDescricao: String;
    FPrecoVenda: Currency;
  public
    property ID: Integer read FID write FID;
    property Descricao: String read FDescricao write FDescricao;
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;
  end;


  TDadosItemPedido = class
  private
    FProduto: TDadosProduto;
    FQuantidade: Double;
    FValorUnitario: Currency;
    FValorTotal: Currency;
    FID: Integer;
    FTempID: Integer;
    FCancelado: Boolean;
  public
    constructor Create;
    property ID: Integer read FID write FID;
    property TempID: Integer read FTempID write FTempID;
    property Produto: TDadosProduto read FProduto write FProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property Cancelado: Boolean read FCancelado write FCancelado;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
  end;

  TListaItens = array of TDadosItemPedido;

  TPedido = class
  private
    FID: Integer;
    FCliente: TDadosCliente;
    FDataEmissao: Double;
    FValorTotal: Currency;
    FItens: TListaItens;
    function RetornaTempID: Integer;
    procedure AjustarValorTotal;
  public
    destructor Destroy; override;
    property ID: Integer read FID write FID;
    property Cliente: TDadosCliente read FCliente write FCliente;
    property DataEmissao: Double read FDataEmissao write FDataEmissao;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Itens: TListaItens read FItens write FItens;
    procedure InserirItem(Item: TDadosItemPedido);
    procedure AtualizarItem(ItemAntigo: TDadosItemPedido; ItemNovo: TDadosItemPedido);
    procedure CancelarItem(Item: TDadosItemPedido);
  end;


implementation

{ TPedido }

procedure TPedido.AjustarValorTotal;
var
  I: Integer;
  Somatorio: Currency;
begin
  Somatorio := 0;
  for I := 0 to Length(Itens) -1 do
    if not Itens[I].Cancelado then
      Somatorio := Somatorio + Itens[I].ValorTotal;
  ValorTotal := Somatorio;
end;

procedure TPedido.AtualizarItem(ItemAntigo, ItemNovo: TDadosItemPedido);
begin
  if ItemAntigo.Produto <> ItemNovo.Produto then
  begin
    ItemAntigo.Produto.ID := ItemNovo.Produto.ID;
    ItemAntigo.Produto.Descricao := ItemNovo.Produto.Descricao;
    ItemAntigo.Produto.PrecoVenda := ItemNovo.Produto.PrecoVenda;
  end;
  if ItemAntigo.Quantidade <> ItemNovo.FQuantidade then
    ItemAntigo.Quantidade := ItemNovo.Quantidade;
  if ItemAntigo.ValorUnitario <> ItemNovo.ValorUnitario then
    ItemAntigo.ValorUnitario := ItemNovo.ValorUnitario;
  if ItemAntigo.ValorTotal <> ItemNovo.ValorTotal then
    ItemAntigo.ValorTotal := ItemNovo.ValorTotal;
  AjustarValorTotal;
end;

procedure TPedido.CancelarItem(Item: TDadosItemPedido);
var
  I: Integer;
  IndiceExcluir: Integer;
begin
  if Item.ID > 0 then
    Item.Cancelado := True
  else
  begin
    IndiceExcluir := -1;
    for I := 0 to Length(Itens) -1 do
    begin
      if Itens[I] = Item then
      begin
        IndiceExcluir := I;
        Break;
      end;
    end;
    for I := IndiceExcluir to Length(Itens) -2 do
      Itens[IndiceExcluir] := Itens[IndiceExcluir +1];

    Item.Free;
    SetLength(FItens, Length(FItens) -1);
  end;
  AjustarValorTotal;
end;

destructor TPedido.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Itens) -1 do
    Itens[I].Free;

  inherited;
end;

procedure TPedido.InserirItem(Item: TDadosItemPedido);
begin
  if (Item.TempID = 0) then
    Item.TempID := RetornaTempID;
  SetLength(FItens, Length(FItens) + 1);
  FItens[Length(FItens) -1] := Item;
  AjustarValorTotal;

end;

function TPedido.RetornaTempID: Integer;
begin
  if Length(Itens) > 0 then
    Result := Itens[Length(Itens) - 1].TempID + 1
  else
    Result := 1;
end;

{ TDadosItemPedido }


{ TDadosItemPedido }

constructor TDadosItemPedido.Create;
begin
  Cancelado := False;
end;

end.
