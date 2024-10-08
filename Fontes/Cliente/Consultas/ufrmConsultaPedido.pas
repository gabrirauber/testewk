unit ufrmConsultaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConsulta, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtCtrls, uInterfaces, uMethods, udmConexao, uClasses, Rest.Json;

type
   TMethodsConsultaPedido = class(TdmConsultaPedidoClient, IBaseConsulta)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  TfrmConsultaPedido = class(TfrmBaseConsulta)
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
  frmConsultaPedido: TfrmConsultaPedido;

implementation

{$R *.dfm}

{ TMethodsConsultaPedido }

function TMethodsConsultaPedido.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  Result := -1
end;

function TMethodsConsultaPedido._AddRef: Integer;
begin
  Result := -1
end;

function TMethodsConsultaPedido._Release: Integer;
begin
  Result := -1
end;

procedure TfrmConsultaPedido.CorrigirTamanhoColunas;
begin
  inherited;
  //Nome
  grdConsulta.ColWidths[1] := 200;
  //Data de emiss�o
  grdConsulta.ColWidths[2] := 100;
  //Valor total
  grdConsulta.ColWidths[3] := 100;

end;

procedure TfrmConsultaPedido.FormCreate(Sender: TObject);
begin
  FMethods := TMethodsConsultaPedido.Create(dmConexao.rConexao);
  inherited;
end;

procedure TfrmConsultaPedido.MontarItem(Dados: String; Index: Integer);
var
  DadosPedido: TDadosPedido;
begin
  inherited;
  DadosPedido := TJson.JsonToObject<TDadosPedido>(Dados);
  try
    grdConsulta.Cells[0,Index] := DadosPedido.ID.ToString;
    grdConsulta.Cells[1,Index] := DadosPedido.Nome;
    grdConsulta.Cells[2,Index] := DadosPedido.DataEmissao;
    grdConsulta.Cells[3,Index] := AjustarValorString(DadosPedido.Valortotal);
  finally
    DadosPedido.Free;
  end;
end;

procedure TfrmConsultaPedido.Selecionar;
begin
  inherited;
  DadoRetorno := TDadosPedido.Create;
  (DadoRetorno as TDadosPedido).ID := StrToInt(grdConsulta.Cells[0, grdConsulta.Row]);
  (DadoRetorno as TDadosPedido).Nome := grdConsulta.Cells[1, grdConsulta.Row];
  (DadoRetorno as TDadosPedido).DataEmissao := grdConsulta.Cells[2, grdConsulta.Row];
  (DadoRetorno as TDadosPedido).Valortotal := AjustarValorCurrency(grdConsulta.Cells[3, grdConsulta.Row]);
  ModalResult := mrOk;


end;

end.
