unit Backend.UDAO.Melhoria;

interface

uses
  Backend.UDAO.Base, System.JSON;
type
  TDAOMelhoria = class(TDAOBase)
  private
    function ObterCidadao(const aId: Integer): TJSONObject;
    function ObterCategoria(const aId: Integer): TJSONObject;
  public
    constructor Create;
    function ObterRegistros: TJSONArray; override;
    function OrdenarRegistros(const aColuna, aOrdem: string): TJSONArray; override;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
  end;

implementation

uses
  System.SysUtils, Backend.UDAO.Intf, Backend.UDAO.Cidadao, Backend.UDAO.Categoria;
{ TDAOSolicitacao }

constructor TDAOMelhoria.Create;
begin
  FTabela := 'melhoria';
end;

function TDAOMelhoria.ObterCategoria(const aId: Integer): TJSONObject;
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

function TDAOMelhoria.ObterCidadao(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOCidadao.Create;
  try
    Result := xDAO.ProcurarPorId(aID);
  finally
    xDAO := nil;
  end;
end;

function TDAOMelhoria.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdCidadao: Integer;
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
    xIdCidadao := StrToInt(xJSONObject.GetValue('idcidadao').Value);
    xJSONObject.AddPair('cidadao', Self.ObterCidadao(xidCidadao));
    xJSONObject.RemovePair('idcidadao');
    xIdCategoria := StrToInt(xJSONObject.GetValue('idcategoria').Value);
    xJSONObject.AddPair('categoria', Self.ObterCategoria(xIdCategoria));
    xJSONObject.RemovePair('idcategoria');
    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;

end;

function TDAOMelhoria.OrdenarRegistros(const aColuna,
  aOrdem: string): TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdCidadao: Integer;
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
    xIdCidadao := StrToInt(xJSONObject.GetValue('idcidadao').Value);
    xJSONObject.AddPair('cidadao', Self.ObterCidadao(xidCidadao));
    xJSONObject.RemovePair('idcidadao');
    xIdCategoria := StrToInt(xJSONObject.GetValue('idcategoria').Value);
    xJSONObject.AddPair('categoria', Self.ObterCategoria(xIdCategoria));
    xJSONObject.RemovePair('idcategoria');
    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;

end;

function TDAOMelhoria.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdCidadao: Integer;
  xIdCategoria: Integer;
begin
  xJSONObject := inherited;
  if xJSONObject.Count = 0 then
    Exit(xJSONObject);
  xIdCidadao := StrToInt(xJSONObject.GetValue('idcidadao').Value);
  xJSONObject.AddPair('cidadao', Self.ObterCidadao(xIdCidadao));
  xJSONObject.RemovePair('idcidadao');
  xIdCategoria := StrToInt(xJSONObject.GetValue('idcategoria').Value);
  xJSONObject.AddPair('categoria', Self.ObterCategoria(xIdCategoria));
  xJSONObject.RemovePair('idcategoria');
  Result := xJSONObject;

end;

end.
