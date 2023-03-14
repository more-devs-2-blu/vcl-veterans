unit Backend.UDAO.Acao;

interface

uses
  Backend.UDAO.Base, System.JSON;
type
  TDAOAcao = class(TDAOBase)
  private
    function ObterCategoria(const aId: Integer): TJSONObject;
  public
    constructor Create;
    function ObterRegistros: TJSONArray; override;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
  end;


implementation

{ TDAOContribuicao }
uses
  System.SysUtils, Backend.UDAO.Intf, Backend.UDAO.Categoria;

constructor TDAOAcao.Create;
begin
  FTabela := 'acao';
end;

function TDAOAcao.ObterCategoria(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOCategoria.Create;
  try
    Result := xDAO.ProcurarPorId(aID);
  finally
    xDAO := nil;
  end;
end;


function TDAOAcao.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdCategoria: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);
  xJSONArrayAux := TJSONArray.Create;
  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[I].ToJSON), 0) as TJSONObject;
    xIdCategoria := StrToInt(xJSONObject.GetValue('idcategoria').Value);
    xJSONObject.AddPair('categoria', Self.ObterCategoria(xIdCategoria));
    xJSONObject.RemovePair('idcategoria');
    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;

end;

function TDAOAcao.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdCategoria: Integer;
begin
  xJSONObject := inherited;
  if xJSONObject.Count = 0 then
    Exit(xJSONObject);
  xIdCategoria := StrToInt(xJSONObject.GetValue('idcategoria').Value);
  xJSONObject.AddPair('categoria', Self.ObterCategoria(xIdCategoria));
  xJSONObject.RemovePair('idcategoria');
  Result := xJSONObject;

end;

end.
