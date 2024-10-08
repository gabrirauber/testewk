unit udmbasecadastro;

interface

uses
  System.SysUtils, System.Classes, udmBase, FireDAC.Stan.Intf, System.Generics.Collections,
   FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TdmBaseCadastro = class(TDMBase)
    qryCadastro: TFDQuery;
    qryConsulta: TFDQuery;
  private
    { Private declarations }
  protected
    function SalvarDados(Json: String): Boolean;virtual;
    function ExcluirDados(ID: Integer): Boolean;virtual;
    function RetornaDados(ID: Integer): String;virtual;
  public
    { Public declarations }
    function SalvarCadastro(Json: String; var Erro: string): Boolean;
    function ExcluirCadastro(ID: Integer; var Erro: string): Boolean;
    function RetornaDadosCadastro(ID: Integer; var Erro: string): String;
  end;
{$METHODINFO OFF}
var
  dmBaseCadastro: TdmBaseCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBaseCadastro }




{ TdmBaseCadastro }

function TdmBaseCadastro.ExcluirCadastro(ID: Integer; var Erro: string): Boolean;
begin
  try
    Result := ExcluirDados(ID);
  except
    on E: Exception do
      Erro := E.Message;
  end;
end;

function TdmBaseCadastro.ExcluirDados(ID: Integer): Boolean;
begin
  Result := False;
end;

function TdmBaseCadastro.RetornaDados(ID: Integer): String;
begin

end;

function TdmBaseCadastro.RetornaDadosCadastro(ID: Integer; var Erro: string): String;
begin
  try
    Result := RetornaDados(ID);
  except
    on E: Exception do
      Erro := E.Message;
  end;
end;

function TdmBaseCadastro.SalvarCadastro(Json: String; var Erro: string): Boolean;
begin
  try
    Result := SalvarDados(Json);
  except
    on E: Exception do
      Erro := E.Message;
  end;
end;

function TdmBaseCadastro.SalvarDados(Json: String): Boolean;
begin
  Result := False;
end;

end.
