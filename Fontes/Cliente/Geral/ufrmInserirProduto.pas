unit ufrmInserirProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  uClasses, Vcl.Samples.Spin,System.ImageList, Vcl.ImgList, Vcl.Mask, ufrmConsultaProduto, uMethods,
  udmConexao, Rest.Json;

type
  TfrmInserirProduto = class(TfrmBase)
    pnlControle: TPanel;
    btnCancelar: TButton;
    btnAdicionar: TButton;
    pnlDados: TPanel;
    edtProduto: TSpinEdit;
    btnConsultarProduto: TButton;
    edtDescricao: TEdit;
    ilLista: TImageList;
    edtValorUnitario: TEdit;
    edtValorTotal: TEdit;
    edtQuantidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnConsultarProdutoClick(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
  private
    FDadosItem: TDadosItemPedido;

    FMethods: TdmInserirProdutoClient;
    FDadosProduto: TDadosProduto;
    FItemRetorno: TDadosItemPedido;
    procedure setDadosItem(const Value: TDadosItemPedido);
    function ValidarDados(var Mensagem: String): Boolean;
    function getMethods: TdmInserirProdutoClient;
    procedure CalcularValorTotal;
    function ApenasNumeros(key: Char): Char;
    procedure setDadosProduto(const Value: TDadosProduto);
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy;override;
    property DadosItem: TDadosItemPedido read FDadosItem write setDadosItem;
    property ItemRetorno: TDadosItemPedido read FItemRetorno write FItemRetorno;
    property Methods: TdmInserirProdutoClient read getMethods write FMethods;
    property DadosProduto: TDadosProduto read FDadosProduto write setDadosProduto;

  end;

var
  frmInserirProduto: TfrmInserirProduto;

implementation

{$R *.dfm}

{ TfrmInserirProduto }


function TfrmInserirProduto.ApenasNumeros(key: Char): Char;
begin
  if not CharInSet(Key, ['0'..'9', #8, ',']) then
    Result := #0
  else
    Result := key;
end;

procedure TfrmInserirProduto.btnAdicionarClick(Sender: TObject);
var
  Mensagem: String;
begin
  inherited;
  if not ValidarDados(Mensagem) then
  begin
    ShowMessage(Mensagem);
    Exit;
  end;

  ItemRetorno := TDadosItemPedido.Create;
  ItemRetorno.Produto := FDadosProduto;
  ItemRetorno.Quantidade := StrToFloat(edtQuantidade.Text);
  ItemRetorno.ValorUnitario := AjustarValorCurrency(edtValorUnitario.Text);
  ItemRetorno.ValorTotal := AjustarValorCurrency(edtValorTotal.Text);
  ModalResult := mrOk;
end;

procedure TfrmInserirProduto.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmInserirProduto.btnConsultarProdutoClick(Sender: TObject);
var
  Form: TfrmConsultaProduto;
begin
  inherited;
  Form := TfrmConsultaProduto.Create(Self);
  try
    if Form.ShowModal = mrOk then
      DadosProduto := (Form.DadoRetorno as TDadosProduto);
  finally
    Form.Free;
  end;
end;

procedure TfrmInserirProduto.CalcularValorTotal;
begin
  edtValorTotal.Text := AjustarValorString(AjustarValorCurrency(edtQuantidade.Text) * AjustarValorCurrency(edtValorUnitario.Text));
end;

destructor TfrmInserirProduto.Destroy;
begin
  if Assigned(FMethods) then
    FMethods.Free;
  inherited;
end;

procedure TfrmInserirProduto.edtProdutoExit(Sender: TObject);
var
  Retorno: String;
begin
  inherited;
  if edtProduto.Text <> '' then
  begin
    Retorno := Methods.RetornaDadosProduto(StrToInt(edtProduto.Text));
    if Retorno <> '' then
      DadosProduto := TJson.JsonToObject<TDadosProduto>(Retorno);
  end
end;

procedure TfrmInserirProduto.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_BACK then
    edtDescricao.Text := '';
end;

procedure TfrmInserirProduto.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  CalcularValorTotal;
end;

procedure TfrmInserirProduto.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := ApenasNumeros(Key);
end;

procedure TfrmInserirProduto.edtValorUnitarioExit(Sender: TObject);
begin
  inherited;
  CalcularValorTotal;
end;

procedure TfrmInserirProduto.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := ApenasNumeros(Key);
end;

function TfrmInserirProduto.getMethods: TdmInserirProdutoClient;
begin
  if not Assigned(FMethods) then
    FMethods := TdmInserirProdutoClient.Create(dmConexao.rConexao);
  Result := FMethods;
end;

procedure TfrmInserirProduto.setDadosItem(const Value: TDadosItemPedido);
begin
  FDadosItem := Value;
  edtQuantidade.Text := FDadosItem.Quantidade.ToString;
  edtValorUnitario.Text := FDadosItem.ValorUnitario.ToString();
  edtValorTotal.Text := FDadosItem.ValorTotal.ToString();
  btnConsultarProduto.Enabled := False;
  edtProduto.Enabled := False;
  DadosProduto := FDadosItem.Produto;
end;

procedure TfrmInserirProduto.setDadosProduto(const Value: TDadosProduto);
begin
  FDadosProduto := Value;
  edtProduto.Text := FDadosProduto.ID.ToString;
  edtDescricao.Text := FDadosProduto.Descricao;
  if edtValorUnitario.Text = '' then
    edtValorUnitario.Text := FDadosProduto.PrecoVenda.ToString;
  if edtQuantidade.Text <> '' then
    CalcularValorTotal;
end;

function TfrmInserirProduto.ValidarDados(var Mensagem: String): Boolean;
begin
  Result := True;
  Mensagem := '';
  if not Assigned(FDadosProduto) then
  begin
    Result := False;
    Mensagem := Mensagem + ' Preencha o produto! '#13#10;
  end;
  if edtQuantidade.Text = '' then
  begin
    Result := False;
    Mensagem := Mensagem + ' Preencha a Quantidade! '#13#10;
  end;
  if edtValorUnitario.Text = '' then
  begin
    Result := False;
    Mensagem := Mensagem + ' Preencha o valor unitário! '#13#10;
  end;

end;

end.
