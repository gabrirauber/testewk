﻿unit ufrmPrincipal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,
  Vcl.Menus, Vcl.ExtCtrls, System.Win.ScktComp, strUtils, uArquivoIni,
  uManagerSession;

type
  TfrmPrincipal = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    ApplicationEvents1: TApplicationEvents;
    TrayIcon1: TTrayIcon;
    ppmOpcoes: TPopupMenu;
    Sair1: TMenuItem;
    Button1: TButton;
    btnConfigurarConexao: TButton;
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfigurarConexaoClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    function getServer: TIdHTTPWebBrokerBridge;
    property Server: TIdHTTPWebBrokerBridge read getServer write FServer;
    procedure StartServer;
    function GetPorta: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession, ufrmConfigIni;

procedure TfrmPrincipal.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not Server.Active;
  ButtonStop.Enabled := Server.Active;
end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  TrayIcon1.Visible := True;
  Hide;
end;

procedure TfrmPrincipal.btnConfigurarConexaoClick(Sender: TObject);
var
  Form: TfrmConfigIni;
begin
  Form := TfrmConfigIni.Create(Self);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TfrmPrincipal.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if Assigned(TDSSessionManager.Instance) then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TfrmPrincipal.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  Server.Active := False;
  Server.Bindings.Clear;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  TrayIcon1.Visible := True;
  Hide;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ButtonStart.Click;
end;

function TfrmPrincipal.GetPorta: integer;
var
  ATmp: string;
begin
  ATmp := TArquivoIni.LerArquivoINI(SESSAOCONEXAOSERV, 'PORTA');
  if ATmp = '' then
  begin
    TArquivoIni.GravarArquivoINI(SESSAOCONEXAOSERV, 'PORTA', '8080');
    ATmp := '8080';
  end;
  Result := StrToInt(ATmp);
end;


function TfrmPrincipal.getServer: TIdHTTPWebBrokerBridge;
begin
  if not Assigned(FServer) then
    FServer := TIdHTTPWebBrokerBridge.Create(Self);
  Result := FServer;
end;


procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  TConnectionManager.RemoveDMConexao;
  Application.Terminate;
end;

procedure TfrmPrincipal.StartServer;
begin
  if not Server.Active then
  begin
    Server.Bindings.Clear;
    Server.DefaultPort := GetPorta;
    Server.Active := True;
  end;
end;

procedure TfrmPrincipal.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();

end;

end.
