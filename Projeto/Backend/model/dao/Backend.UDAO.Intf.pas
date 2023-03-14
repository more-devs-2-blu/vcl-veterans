unit Backend.UDAO.Intf;

interface
uses
  System.JSON;
type
  IDAO = Interface
    function ObterRegistros: TJSONArray;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject;
    function AdicionarRegistro(aRegistro: TJSONObject): Boolean;
    function DeletarRegistro(const aIdentificador: Integer): Boolean;
    function OrdenarRegistros(const aColuna, aOrdem: string): TJSONArray;
    function AlterarRegistro(const aIdentificador: Integer; const aRegistro: TJSONObject; const aColuna, aValor: String): Boolean;
  End;
implementation
end.
implementation

end.
