unit ufrmBaseConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBase, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, uInterfaces, System.JSON, uClasses, System.Generics.Collections;

type
  TfrmBaseConsulta = class(TfrmBase)
    Panel1: TPanel;
    pnlControle: TPanel;
    btnCancelar: TButton;
    btnSelecionar: TButton;
    grdConsulta: TStringGrid;
    Panel2: TPanel;
    edtFiltro: TEdit;
    btnConsularCliente: TButton;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnConsularClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDadoRetorno: TDados;
    procedure MontarCabecalho(Cabecalho: TJSONArray);
  protected
    FMethods: IBaseConsulta;
    procedure MontarItem(Dados: String; Index: Integer);virtual;
    procedure Selecionar;virtual;
    procedure CorrigirTamanhoColunas;virtual;

  public
    { Public declarations }
    property DadoRetorno: TDados read FDadoRetorno write FDadoRetorno;
    procedure RealizarConsulta(Filtro: String);

  end;

var
  frmBaseConsulta: TfrmBaseConsulta;

implementation

{$R *.dfm}

{ TfrmConsulta }


procedure TfrmBaseConsulta.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBaseConsulta.btnConsularClienteClick(Sender: TObject);
begin
  inherited;
  RealizarConsulta(edtFiltro.Text);
end;

procedure TfrmBaseConsulta.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  Selecionar;
  ModalResult := mrOk;
end;

procedure TfrmBaseConsulta.CorrigirTamanhoColunas;
begin

end;

procedure TfrmBaseConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmBaseConsulta.grdConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    Selecionar;
end;

procedure TfrmBaseConsulta.MontarCabecalho(Cabecalho: TJSONArray);
var
  I: Integer;
begin
  grdConsulta.ColCount := Cabecalho.Count;
  for I := 0 to Cabecalho.Count -1 do
    grdConsulta.Cells[I,0] := Cabecalho.Items[I].getValue<String>;
  CorrigirTamanhoColunas;
end;

procedure TfrmBaseConsulta.MontarItem(Dados: String; Index: Integer);
begin

end;

procedure TfrmBaseConsulta.RealizarConsulta(Filtro: String);
var
  DadosConsulta: TJSONObject;
  I: Integer;
begin
  DadosConsulta := TJSONObject.ParseJSONValue(FMethods.RetornaDadosConsulta(Filtro)) as TJSONObject;
  MontarCabecalho(DadosConsulta.GetValue<TJSONArray>('cabecalho'));
  grdConsulta.RowCount := DadosConsulta.GetValue<TJSONArray>('dados').Count + 1;
  for I := 0 to DadosConsulta.GetValue<TJSONArray>('dados').Count -1 do
    MontarItem(DadosConsulta.GetValue<TJSONArray>('dados').Items[I].ToString, I + 1);
end;

procedure TfrmBaseConsulta.Selecionar;
begin

end;

end.
