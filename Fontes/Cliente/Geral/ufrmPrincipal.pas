unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TTfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    cadastro1: TMenuItem;
    Pedidos1: TMenuItem;
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TfrmPrincipal: TTfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmPedidoVenda;

procedure TTfrmPrincipal.Pedidos1Click(Sender: TObject);
var
  Form: TfrmPedidoVenda;
begin
  Form := TfrmPedidoVenda.create(Self);
  Form.show;
end;

end.
