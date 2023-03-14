unit UService.Intf;

interface

type
  IService = interface
    procedure Registrar;
    procedure Alterar(aColuna, aValor: String);
    procedure Listar;
    procedure Excluir;

    function ObterRegistro(const aId: Integer): TObject;
  end;

implementation

end.
