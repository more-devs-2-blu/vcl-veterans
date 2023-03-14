unit Backend.UDAO.Categoria;

interface

uses
  Backend.UDAO.Base;
type
  TDAOCategoria = class(TDAOBase)
    public
      constructor Create;
  end;

implementation

{ TDAOCategoria }

constructor TDAOCategoria.Create;
begin
  FTabela := 'categoria';
end;

end.
