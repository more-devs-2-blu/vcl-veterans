unit Backend.UDAO.Voluntario;

interface

uses
  Backend.UDAO.Base, System.JSON;
type
  TDAOVoluntario = class(TDAOBase)
  private
    function ObterCidadao(const aId: Integer): TJSONObject;
    function ObterAcao(const aId: Integer): TJSONObject;
  public
    constructor Create;
    function ObterRegistros(aJSONArray: TJSONArray): TJSONArray; override;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
  end;

implementation

{ TDAOVoluntario }
uses
  System.SysUtils, Backend.UDAO.Intf, Backend.UDAO.Acao, Backend.UDAO.Cidadao;

constructor TDAOVoluntario.Create;
begin
  FTabela := 'voluntario';
end;

function TDAOVoluntario.ObterCidadao(const aId: Integer): TJSONObject;
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

function TDAOVoluntario.ObterAcao(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOAcao.Create;
  try
    Result := xDAO.ProcurarPorId(aID);
  finally
    xDAO := nil;
  end;

end;

function TDAOVoluntario.ObterRegistros(aJSONArray: TJSONArray): TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdCidadao: Integer;
  xIdAcao: Integer;
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
    xIdAcao := StrToInt(xJSONObject.GetValue('idacao').Value);
    xJSONObject.AddPair('acao', Self.ObterAcao(xIdAcao));
    xJSONObject.RemovePair('idacao');
    xJSONArrayAux.AddElement(xJSONObject);
  end;
  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;

end;

function TDAOVoluntario.ProcurarPorId(
  const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdCidadao: Integer;
  xIdAcao: Integer;
begin
  xJSONObject := inherited;
  if xJSONObject.Count = 0 then
    Exit(xJSONObject);
  xIdCidadao := StrToInt(xJSONObject.GetValue('idcidadao').Value);
  xJSONObject.AddPair('cidadao', Self.ObterCidadao(xIdCidadao));
  xJSONObject.RemovePair('idcidadao');
  xIdAcao := StrToInt(xJSONObject.GetValue('idacao').Value);
  xJSONObject.AddPair('acao', Self.ObterAcao(xIdAcao));
  xJSONObject.RemovePair('idacao');
  Result := xJSONObject;

end;


end.
