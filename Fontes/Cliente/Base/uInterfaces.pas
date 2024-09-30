unit uInterfaces;

interface

uses
   Data.FireDACJSONReflect, Datasnap.DSClientRest, uMethods, JSon;

type

  IBaseCadastro = interface
    function SalvarCadastro(Json: string; const ARequestFilter: string = ''): Boolean;
    function ExcluirCadastro(ID: Integer; const ARequestFilter: string = ''): Boolean;
    function RetornaDadosCadastro(ID: Integer; const ARequestFilter: string = ''): string;
  end;
  IBaseConsulta = interface
    function RetornaDadosConsulta(Filtro: string; const ARequestFilter: string = ''): string;
  end;


implementation

end.
