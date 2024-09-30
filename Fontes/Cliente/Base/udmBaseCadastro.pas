unit udmBaseCadastro;

interface

uses
  System.SysUtils, System.Classes, udmBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FireDACJSONReflect, uClasses, uInterfaces;

type
  TdmBaseCadastro = class(TdmBase)
  private
    FJsonSalvar: String;
    FJsonRetornadoConsulta: String;
    { Private declarations }
  public
    { Public declarations }
    FMethods: IBaseCadastro;
    property JsonSalvar: String read FJsonSalvar write FJsonSalvar;
    property JsonRetornadoConsulta: String read FJsonRetornadoConsulta write FJsonRetornadoConsulta;
    function SalvarCadastro: Boolean;virtual;
    function ExcluirCadastro(ID: Integer): Boolean;virtual;
    procedure RetornaDadosCadastro(ID: Integer);virtual;
  end;

var
  dmBaseCadastro: TdmBaseCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBaseCadastro }



{ TdmBaseCadastro }

function TdmBaseCadastro.ExcluirCadastro(ID: Integer): Boolean;
begin
  Result := FMethods.ExcluirCadastro(ID);
end;

procedure TdmBaseCadastro.RetornaDadosCadastro(ID: Integer);
begin
  JsonRetornadoConsulta := FMethods.RetornaDadosCadastro(ID);
end;

function TdmBaseCadastro.SalvarCadastro: Boolean;
begin
  Result := FMethods.SalvarCadastro(JsonSalvar);
end;

end.
