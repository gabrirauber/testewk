unit ufrmConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConsulta, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtCtrls, uClasses, uInterfaces, uMethods, udmConexao, Rest.JSON;

type
  TMethodsConsultaProduto = class(TdmConsultaProdutoClient, IBaseConsulta)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;
  TfrmConsultaProduto = class(TfrmBaseConsulta)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure MontarItem(Dados: String; Index: Integer);override;
    procedure CorrigirTamanhoColunas;override;
    procedure Selecionar;override;
  public
    { Public declarations }
  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

{$R *.dfm}

{ TMethodsConsultaProduto }

function TMethodsConsultaProduto.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin

end;

function TMethodsConsultaProduto._AddRef: Integer;
begin

end;

function TMethodsConsultaProduto._Release: Integer;
begin

end;

procedure TfrmConsultaProduto.CorrigirTamanhoColunas;
begin
  inherited;
  //Nome
  grdConsulta.ColWidths[1] := 200;
  //Preço de venda
  grdConsulta.ColWidths[2] := 100;

end;

procedure TfrmConsultaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  FMethods := TMethodsConsultaProduto.Create(dmConexao.rConexao)
end;

procedure TfrmConsultaProduto.MontarItem(Dados: String; Index: Integer);
var
  DadosProduto: TDadosProduto;
begin
  inherited;
  DadosProduto := TJson.JsonToObject<TDadosProduto>(Dados);
  try
    grdConsulta.Cells[0,Index] := DadosProduto.ID.ToString;
    grdConsulta.Cells[1,Index] := DadosProduto.Descricao;
    grdConsulta.Cells[2,Index] :=  AjustarValorString(DadosProduto.PrecoVenda);
  finally
    DadosProduto.Free;
  end;
end;

procedure TfrmConsultaProduto.Selecionar;
begin
  inherited;
  DadoRetorno := TDadosProduto.Create;
  (DadoRetorno as TDadosProduto).ID := StrToInt(grdConsulta.Cells[0, grdConsulta.Row]);
  (DadoRetorno as TDadosProduto).Descricao := grdConsulta.Cells[1, grdConsulta.Row];
  (DadoRetorno as TDadosProduto).PrecoVenda := AjustarValorCurrency(grdConsulta.Cells[2, grdConsulta.Row]);
  ModalResult := mrOk;
end;

end.
