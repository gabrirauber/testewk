unit ufrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmBase = class(TForm)
  private
    { Private declarations }
  protected
    function AjustarValorCurrency(Valor: String): Currency;
    function AjustarValorString(Valor: Currency): String;
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

uses
  System.SysUtils;

{$R *.dfm}

{ TfrmBase }

function TfrmBase.AjustarValorCurrency(Valor: String): Currency;
begin
  Valor := StringReplace(Valor, 'R$', '', [rfReplaceAll]);
  Valor := StringReplace(Valor, '.', '', [rfReplaceAll]);
  Result := StrToCurrDef(Trim(Valor),0);
end;

function TfrmBase.AjustarValorString(Valor: Currency): String;
begin
  Result := FormatCurr('"R$" #,##0.00', Valor)
end;

end.
