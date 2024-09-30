unit ufrmPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Mask, Vcl.Grids, ufrmConsultaCliente, uClasses, udmPedidoVenda,
  Vcl.Samples.Spin, ufrmInserirProduto, ufrmConsultaPedido, Rest.Json;

type
  TfrmPedidoVenda = class(TfrmBaseCadastro)
    pnlControleCliente: TPanel;
    btnConsularCliente: TButton;
    edtNomeCliente: TEdit;
    edtDataEmissao: TMaskEdit;
    edtNumeroPedido: TEdit;
    btnLocalizarPedido: TButton;
    btnExcluirPedido: TButton;
    GroupBox1: TGroupBox;
    grdItens: TStringGrid;
    pnlControleProd: TPanel;
    btnIncluirProd: TButton;
    btnEditarProd: TButton;
    btnExcluirProd: TButton;
    pnlTotal: TPanel;
    edtValorTotal: TEdit;
    edtCliente: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnConsularClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirProdClick(Sender: TObject);
    procedure btnEditarProdClick(Sender: TObject);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirProdClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure btnLocalizarPedidoClick(Sender: TObject);
  private
    FPedido: TPedido;
    { Private declarations }
    procedure AjustarEstadoBotoes(Estado: Boolean);
    procedure IniciarPedido(DadosCliente: TDadosCliente);
    procedure InserirCabecalhoGrid;
    procedure InserirItemGrid(Item: TDadosItemPedido);
    procedure AtualizarItemGrid(Linha: Integer; Item: TDadosItemPedido);
    procedure ExcluirItemGrid(Linha: Integer);
    procedure CorrigirValorTotal;
    procedure EditarItem;
    procedure ExcluirItem;
    procedure PreencherDadosCabecalho;
  protected
    procedure LimparEdicao;override;
    procedure SalvarCadastro;override;
  public
    { Public declarations }
    property Pedido: TPedido read FPedido write FPedido;
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmPedidoVenda.AjustarEstadoBotoes(Estado: Boolean);
begin
  btnLocalizarPedido.Visible := Estado;
  btnExcluirPedido.Visible := Estado;
  edtCliente.Enabled := Estado;
  btnConsularCliente.Enabled := Estado;
end;

procedure TfrmPedidoVenda.AtualizarItemGrid(Linha: Integer;
  Item: TDadosItemPedido);
begin
  grdItens.Cells[0, Linha] := Item.Produto.ID.ToString;
  grdItens.Cells[1, Linha] := Item.Produto.Descricao;
  grdItens.Cells[2, Linha] := FloatToStr(Item.Quantidade);
  grdItens.Cells[3, Linha] := AjustarValorString(Item.ValorUnitario);
  grdItens.Cells[4, Linha] := AjustarValorString(Item.ValorTotal);
end;

procedure TfrmPedidoVenda.btnConsularClienteClick(Sender: TObject);
var
  Form: TfrmConsultaCliente;
begin
  inherited;
  Form := TfrmConsultaCliente.Create(Self);
  try
    if Form.ShowModal = mrOk then
    begin
      IniciarPedido((Form.DadoRetorno as TDadosCliente));
      edtNomeCliente.Text := Pedido.Cliente.Nome;
      edtCliente.Text := Pedido.Cliente.ID.ToString;
    end;
  finally
    Form.Free;
  end;

end;

procedure TfrmPedidoVenda.btnEditarProdClick(Sender: TObject);
begin
  EditarItem;
end;

procedure TfrmPedidoVenda.btnExcluirPedidoClick(Sender: TObject);
var
  PedidoRetornado: TDadosPedido;
  Form: TfrmConsultaPedido;
begin
  inherited;
  Form := TfrmConsultaPedido.Create(Self);
  if Form.ShowModal = mrOk then
  begin
    PedidoRetornado := (Form.DadoRetorno as TDadosPedido);
    try
      if Application.MessageBox(PWideChar('Deseja realmente excluir o pedido: ' + PedidoRetornado.ID.ToString), 'Atenção', MB_YESNO) = mrYes then
        if dmCadastro.ExcluirCadastro(PedidoRetornado.ID) then
          ShowMessage('Pedido Excluido com sucesso!');
    finally
      PedidoRetornado.Free;
    end;
  end;
end;

procedure TfrmPedidoVenda.btnExcluirProdClick(Sender: TObject);
begin
  inherited;
  ExcluirItem;
end;

procedure TfrmPedidoVenda.btnIncluirProdClick(Sender: TObject);
var
  Form: TfrmInserirProduto;
begin
  inherited;
  if not Assigned(FPedido) then
  begin
    ShowMessage('Selecione o cliente para começar o pedido!');
    Exit;
  end;
  Form := TfrmInserirProduto.Create(Self);
  if Form.ShowModal = mrOk then
  begin
    Pedido.InserirItem(Form.ItemRetorno, grdItens.RowCount);
    InserirItemGrid(Form.ItemRetorno);
    CorrigirValorTotal;
  end;
end;

procedure TfrmPedidoVenda.btnLocalizarPedidoClick(Sender: TObject);
var
  PedidoRetornado: TDadosPedido;
  Form: TfrmConsultaPedido;
  I: Integer;
begin
  inherited;
  Form := TfrmConsultaPedido.Create(Self);
  if Form.ShowModal = mrOk then
  begin
    PedidoRetornado := (Form.DadoRetorno as TDadosPedido);
    try
      dmCadastro.RetornaDadosCadastro(PedidoRetornado.ID);
      Pedido := TJson.JsonToObject<TPedido>(dmCadastro.JsonRetornadoConsulta);
      PreencherDadosCabecalho;
      for I := 0 to Length(Pedido.Itens) -1 do
        InserirItemGrid(Pedido.Itens[I]);
    finally
      PedidoRetornado.Free;
    end;
  end;
end;

procedure TfrmPedidoVenda.CorrigirValorTotal;
begin
  edtValorTotal.Text := AjustarValorString(Pedido.ValorTotal);
end;

procedure TfrmPedidoVenda.EditarItem;
var
  I: Integer;
  Item: TDadosItemPedido;
  Form: TfrmInserirProduto;
begin
  inherited;
  if not Assigned(FPedido) then
  begin
    ShowMessage('Selecione o cliente para começar o pedido!');
    Exit;
  end;
  if Length(Pedido.Itens) = 0 then
  begin
    ShowMessage('Nenhum item inserido no pedido!');
    Exit;
  end;
  if grdItens.Row = 0 then
  begin
    ShowMessage('Selecione um item!');
    Exit;
  end;

  Item := nil;
  for I := 0 to Length(Pedido.Itens) -1 do
  begin
    if Pedido.Itens[I].IndexGrid = grdItens.Row then
    begin
      Item := Pedido.Itens[I];
      Break;
    end;
  end;

  if Assigned(Item) then
  begin
    Form := TfrmInserirProduto.Create(Self);
    Form.DadosItem := Item;
    if Form.ShowModal = mrOk then
    begin
      Pedido.AtualizarItem(Item, Form.ItemRetorno);
      AtualizarItemGrid(grdItens.Row, Form.ItemRetorno);
      CorrigirValorTotal;
    end;
  end
  else
    ShowMessage('Erro ao localizar item');

end;

procedure TfrmPedidoVenda.edtClienteExit(Sender: TObject);
begin
  inherited;
  if edtCliente.Text <> '' then
  begin
    if edtNomeCliente.Text = '' then
    begin
      IniciarPedido((dmCadastro as TdmPedidoVenda).CarregarDadosCliente(edtCliente.Value));
      if Assigned(Pedido) then
        edtNomeCliente.Text := Pedido.Cliente.Nome;
    end;
  end
  else
    LimparEdicao;
end;

procedure TfrmPedidoVenda.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_BACK then
    edtNomeCliente.Text := '';
end;

procedure TfrmPedidoVenda.ExcluirItem;
var
  I: Integer;
  Item: TDadosItemPedido;
begin
  if not Assigned(FPedido) then
  begin
    ShowMessage('Selecione o cliente para começar o pedido!');
    Exit;
  end;
  if Length(Pedido.Itens) = 0 then
  begin
    ShowMessage('Nenhum item inserido no pedido!');
    Exit;
  end;
  if grdItens.Row = 0 then
  begin
    ShowMessage('Selecione um item!');
    Exit;
  end;
  if Application.MessageBox('Deseja realmente excluir o produto selecionado?', 'Atenção', MB_YESNO) = mrYes then
  begin
    Item := nil;
    for I := 0 to Length(Pedido.Itens) -1 do
    begin
      if Pedido.Itens[I].IndexGrid = grdItens.Row then
      begin
        Item := Pedido.Itens[I];
        Break;
      end;
    end;
    if Assigned(Item) then
    begin
      Pedido.CancelarItem(Item);
      ExcluirItemGrid(grdItens.Row);
      CorrigirValorTotal;
    end
    else
      ShowMessage('Erro ao localizar item');
  end;
end;

procedure TfrmPedidoVenda.ExcluirItemGrid(Linha: Integer);
var
  I: Integer;
begin
  for I := Linha to grdItens.RowCount - 2 do
    grdItens.Rows[I] := grdItens.Rows[I + 1];
  grdItens.RowCount := grdItens.RowCount - 1;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadastro := TdmPedidoVenda.Create(Self);
  InserirCabecalhoGrid;
end;

procedure TfrmPedidoVenda.grdItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    EditarItem;
  if key = VK_DELETE then
    ExcluirItem;
end;

procedure TfrmPedidoVenda.IniciarPedido(DadosCliente: TDadosCliente);
begin
  if Assigned(DadosCliente) then
  begin
    AjustarEstadoBotoes(False);
    Pedido := TPedido.Create;
    Pedido.Cliente := DadosCliente;
    Pedido.ID := -1;
    Pedido.DataEmissao := Date;
    edtNumeroPedido.Text := 'Novo';
    edtDataEmissao.Text := DateToStr(Date);
  end;
end;


procedure TfrmPedidoVenda.InserirCabecalhoGrid;
begin
  grdItens.Cells[0,0] := 'Cód Produto';
  grdItens.ColWidths[0] := 100;
  grdItens.Cells[1,0] := 'Descrição';
  grdItens.ColWidths[1] := 200;
  grdItens.Cells[2,0] := 'Quantidade';
  grdItens.ColWidths[2] := 100;
  grdItens.Cells[3,0] := 'Valor Unitário';
  grdItens.ColWidths[3] := 100;
  grdItens.Cells[4,0] := 'Valor Total';
  grdItens.ColWidths[4] := 100;
end;

procedure TfrmPedidoVenda.InserirItemGrid(Item: TDadosItemPedido);
var
  Indice: Integer;
begin
  grdItens.RowCount := grdItens.RowCount + 1;
  Indice := grdItens.RowCount - 1;
  AtualizarItemGrid(Indice, Item);
  Item.IndexGrid := Indice;
end;

procedure TfrmPedidoVenda.LimparEdicao;
begin
  inherited;
  AjustarEstadoBotoes(True);
  edtNomeCliente.Text := '';
  edtDataEmissao.Text := '';
  edtCliente.Text := '';
  edtValorTotal.Text := '';
  edtNumeroPedido.Text := '';

  grdItens.RowCount := 0;
  FreeAndNil(FPedido);

end;

procedure TfrmPedidoVenda.PreencherDadosCabecalho;
begin
  AjustarEstadoBotoes(False);
  edtDataEmissao.Text := DateToStr(Pedido.DataEmissao);
  edtNumeroPedido.Text := Pedido.ID.ToString;
  edtCliente.Text := Pedido.Cliente.ID.ToString;
  edtNomeCliente.Text := Pedido.Cliente.Nome;
  CorrigirValorTotal;
end;

procedure TfrmPedidoVenda.SalvarCadastro;
begin
  (dmCadastro as TdmPedidoVenda).Pedido := Pedido;
  inherited;
end;

end.
