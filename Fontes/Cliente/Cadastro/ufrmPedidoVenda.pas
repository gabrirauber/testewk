unit ufrmPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, System.ImageList, Vcl.ImgList, cxLabel,
  Vcl.Mask, Vcl.Grids, ufrmConsultaCliente, uClasses, udmPedidoVenda,
  Vcl.Samples.Spin, ufrmInserirProduto, ufrmConsultaPedido, Rest.Json;

type
  TfrmPedidoVenda = class(TfrmBaseCadastro)
    pnlControleCliente: TPanel;
    cxLabel1: TcxLabel;
    btnConsularCliente: TButton;
    edtNomeCliente: TEdit;
    edtDataEmissao: TMaskEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtNumeroPedido: TEdit;
    btnLocalizarPedido: TButton;
    btnExcluirPedido: TButton;
    GroupBox1: TGroupBox;
    grdItens: TStringGrid;
    pnlControleProd: TPanel;
    btnIncluirProd: TButton;
    btnEditarProd: TButton;
    btnExcluirProd: TButton;
    Panel1: TPanel;
    cxLabel4: TcxLabel;
    edtValorTotal: TEdit;
    edtCliente: TSpinEdit;
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
end;

procedure TfrmPedidoVenda.AtualizarItemGrid(Linha: Integer;
  Item: TDadosItemPedido);
begin
  grdItens.Cells[0, Linha] := Item.Produto.ID.ToString;
  grdItens.Cells[1, Linha] := Item.Produto.Descricao;
  grdItens.Cells[2, Linha] := FloatToStr(Item.Quantidade);
  grdItens.Cells[3, Linha] := AjustarValorString(Item.ValorUnitario);
  grdItens.Cells[4, Linha] := AjustarValorString(Item.ValorTotal);
  grdItens.Cells[5, Linha] := Item.TempID.ToString;
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
    Pedido.InserirItem(Form.ItemRetorno);
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

  for I := 0 to Length(Pedido.Itens) -1 do
  begin
    if Pedido.Itens[I].TempID = StrToInt(grdItens.Cells[5,grdItens.Row]) then
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
  end;




end;

procedure TfrmPedidoVenda.edtClienteExit(Sender: TObject);
var
  DadosCliente: TDadosCliente;
begin
  inherited;
  if edtCliente.Text <> '' then
  begin
    if edtNomeCliente.Text = '' then
    begin
      IniciarPedido((dmCadastro as TdmPedidoVenda).CarregarDadosCliente(edtCliente.Value));
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
    for I := 0 to Length(Pedido.Itens) -1 do
    begin
      if Pedido.Itens[I].TempID = StrToInt(grdItens.Cells[5,grdItens.Row]) then
      begin
        Item := Pedido.Itens[I];
        Break;
      end;
    end;
    Pedido.CancelarItem(Item);
    ExcluirItemGrid(grdItens.Row);
    CorrigirValorTotal;
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
  AjustarEstadoBotoes(False);
  Pedido := TPedido.Create;
  Pedido.Cliente := DadosCliente;
  Pedido.ID := -1;
  Pedido.DataEmissao := Date;
  edtNumeroPedido.Text := 'Novo';
  edtDataEmissao.Text := DateToStr(Date);
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
