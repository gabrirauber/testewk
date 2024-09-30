unit ufrmConfigIni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FileCtrl;

type
  TfrmConfigIni = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtPorta: TEdit;
    edtBancoDados: TEdit;
    Label2: TLabel;
    edtServidor: TEdit;
    Label3: TLabel;
    edtUsuario: TEdit;
    Label4: TLabel;
    edtSenha: TEdit;
    Label5: TLabel;
    edtPortaBD: TEdit;
    Label6: TLabel;
    edtPastaDLL: TEdit;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigIni: TfrmConfigIni;

implementation

{$R *.dfm}

uses uArquivoIni;

procedure TfrmConfigIni.Button1Click(Sender: TObject);
var
  Aux: String;
begin
  if SelectDirectory(Aux,[],1000 ) then
    edtPastaDLL.Text := Aux;
end;

procedure TfrmConfigIni.Button2Click(Sender: TObject);
begin
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOSERV,'Porta', edtPorta.Text);
  TArquivoIni.GravarArquivoIni(SESSAOGERAL,'pathdll', edtPastaDLL.Text);
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOBD,'Database', edtBancoDados.Text);
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOBD,'Username', edtUsuario.Text);
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOBD,'Server', edtServidor.Text);
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOBD,'Port', edtPortaBD.Text);
  TArquivoIni.GravarArquivoIni(SESSAOCONEXAOBD,'Password', edtSenha.Text);
  ShowMessage('Configurações salvas com sucesso!');
  Self.Close;
end;

procedure TfrmConfigIni.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigIni.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFileDir(ParamStr(0)) + '\config.ini') then
  begin
    edtPorta.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOSERV, 'Porta', edtPorta.Text);
    edtBancoDados.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD, 'Database', edtBancoDados.Text);
    edtServidor.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD, 'Server', edtServidor.Text);
    edtUsuario.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD, 'Username', edtUsuario.Text);
    edtSenha.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD, 'Password', edtSenha.Text);
    edtPortaBD.Text := TArquivoIni.LerArquivoIni(SESSAOCONEXAOBD, 'Port', edtPortaBD.Text);
    edtPastaDLL.Text := TArquivoIni.LerArquivoIni(SESSAOGERAL, 'pathdll', edtPastaDLL.Text);
  end;
end;

end.
