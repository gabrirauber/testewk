unit ufrmBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBase, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, udmBaseCadastro, uClasses,
  System.ImageList, Vcl.ImgList;

type
  TfrmBaseCadastro = class(TfrmBase)
    pnlPrincipal: TPanel;
    pnlControle: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    ilLista: TImageList;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FdmCadastro: TdmBaseCadastro;
    function getdmCadastro: TdmBaseCadastro;
  protected
    procedure LimparEdicao;virtual;
    procedure SalvarCadastro;virtual;
  public
    { Public declarations }
    property dmCadastro: TdmBaseCadastro read getdmCadastro write FdmCadastro;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}



procedure TfrmBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja alterar a edi��o?', 'Aten��o', MB_YESNO) = mrYes then
    LimparEdicao;
end;

procedure TfrmBaseCadastro.LimparEdicao;
begin

end;

procedure TfrmBaseCadastro.SalvarCadastro;
begin
  if dmCadastro.SalvarCadastro then
  begin
    ShowMessage('Salvo com sucesso!');
    LimparEdicao;
  end
  else
    ShowMessage('Erro ao salvar cadastro!');
end;

procedure TfrmBaseCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarCadastro;
end;

function TfrmBaseCadastro.getdmCadastro: TdmBaseCadastro;
begin
  Result := FdmCadastro;
end;

end.
