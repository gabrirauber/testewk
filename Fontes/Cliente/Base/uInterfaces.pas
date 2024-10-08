unit uInterfaces;

interface

uses
   Data.FireDACJSONReflect, Datasnap.DSClientRest, uMethods, JSon;

type

  IBaseCadastro = interface
    function SalvarCadastro(Json: string; var Erro: String; const ARequestFilter: string = ''): Boolean;
    function ExcluirCadastro(ID: Integer; var Erro: String; const ARequestFilter: string = ''): Boolean;
    function RetornaDadosCadastro(ID: Integer; var Erro: String; const ARequestFilter: string = ''): string;
  end;
  IBaseConsulta = interface
    function RetornaDadosConsulta(Filtro: string; var Erro: string; const ARequestFilter: string = ''): string;
  end;


implementation

end.
