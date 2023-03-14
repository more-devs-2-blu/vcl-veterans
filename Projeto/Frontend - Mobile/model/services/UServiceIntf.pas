unit UServiceIntf;

interface

type
  IService = interface
    Procedure Registrar;
    Procedure Listar;
    Procedure Excluir;
    Procedure Alterar(const aColuna, aValor: String);
    Procedure ObterRegistro;
  end;

implementation

end.
