unit ufrmConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConsulta, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls, uMethods, uInterfaces, udmConexao, Rest.Json,
  uClasses;

type
  TMethodsConsultaCliente = class(TdmConsultaClienteClient, IBaseConsulta)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  TfrmConsultaCliente = class(TfrmBaseConsulta)
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
  frmConsultaCliente: TfrmConsultaCliente;

implementation

{$R *.dfm}

procedure TfrmConsultaCliente.CorrigirTamanhoColunas;
begin
  inherited;
  //Nome
  grdConsulta.ColWidths[1] := 200;
  //Cidade
  grdConsulta.ColWidths[2] := 100;
  //UF
  grdConsulta.ColWidths[3] := 40;
end;

procedure TfrmConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FMethods := TMethodsConsultaCliente.Create(dmConexao.rConexao);
end;


{ TMethodsConsultaCliente }

function TMethodsConsultaCliente.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  Result := -1
end;

function TMethodsConsultaCliente._AddRef: Integer;
begin
  Result := -1
end;

function TMethodsConsultaCliente._Release: Integer;
begin
  Result := -1
end;

procedure TfrmConsultaCliente.MontarItem(Dados: String; Index: Integer);
var
  DadosCliente: TDadosCliente;
begin
  inherited;
  DadosCliente := TJson.JsonToObject<TDadosCliente>(Dados);
  try
    grdConsulta.Cells[0,Index] := DadosCliente.ID.ToString;
    grdConsulta.Cells[1,Index] := DadosCliente.Nome;
    grdConsulta.Cells[2,Index] := DadosCliente.Cidade;
    grdConsulta.Cells[3,Index] := DadosCliente.UF;
  finally
    DadosCliente.Free;
  end;
end;

procedure TfrmConsultaCliente.Selecionar;
begin
  DadoRetorno := TDadosCliente.Create;
  (DadoRetorno as TDadosCliente).ID := StrToInt(grdConsulta.Cells[0, grdConsulta.Row]);
  (DadoRetorno as TDadosCliente).Nome := grdConsulta.Cells[1, grdConsulta.Row];
  (DadoRetorno as TDadosCliente).Cidade := grdConsulta.Cells[2, grdConsulta.Row];
  (DadoRetorno as TDadosCliente).UF := grdConsulta.Cells[3, grdConsulta.Row];
  ModalResult := mrOk;
end;

end.
