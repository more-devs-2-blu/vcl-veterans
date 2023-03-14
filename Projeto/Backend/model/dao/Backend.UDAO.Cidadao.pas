unit Backend.UDAO.Cidadao;

interface

uses
  Backend.UDAO.Base;
type
  TDAOCidadao = class(TDAOBase)
    public
      constructor Create;
  end;


implementation

{ TDAOCidadao }

constructor TDAOCidadao.Create;
begin
  FTabela := 'cidadao';
end;

end.
