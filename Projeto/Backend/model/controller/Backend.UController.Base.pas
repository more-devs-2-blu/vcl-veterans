unit Backend.UController.Base;

interface

uses
  Horse,
  Backend.UDAO.Intf;
type
  TControllerBase = class
    protected
      class var FDAO: IDAO;
      class var FColuna: String;
    public
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure Patch(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure PatchPontuacao(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
  end;

implementation

uses
  System.JSON, System.SysUtils;
{ TControllerBase }

class procedure TControllerBase.Delete(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  xId: Integer;
begin
  if (Req.Params.Count <> 1) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;
  xId := StrToIntDef(Req.Params.Items['id'], 0);
  if FDAO.DeletarRegistro(xId) then
    Res.Status(THTTPStatus.NoContent)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

class procedure TControllerBase.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  xId: Integer;
begin
  if (Req.Params.Count <> 1) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;
  xId := StrToIntDef(Req.Params.Items['id'], 0);
  Res.Send<TJSONObject>(FDAO.ProcurarPorId(xId));
end;

class procedure TControllerBase.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  Res.Send<TJSONArray>(FDAO.ObterRegistros);
end;

class procedure TControllerBase.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  if FDAO.AdicionarRegistro(Req.Body<TJSONObject>) then
    Res.Status(THTTPStatus.Created)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

class procedure TControllerBase.Patch(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  xId: Integer;
  xColuna, xValor: String;
begin
  if (Req.Params.Count <> 3) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;

  xId := StrToIntDef(Req.Params.Items['id'], 0);
  xColuna := Req.Params.Items['coluna'];
  xValor := Req.Params.Items['valor'];
  if (FDAO.AlterarRegistro(xId, Req.Body<TJSONObject>, xColuna, xValor)) then
  begin
    Res.Status(THTTPStatus.Ok);
    //Res.Send<TJSONObject>(FDAO.AlterarRegistro(xId,xColuna,xValor));
  end
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

class procedure TControllerBase.PatchPontuacao(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  xId: Integer;
  xValor: Integer;
  xRegistro: TJSONObject;
begin
  xId:= StrToIntDef(Req.Params.Items['id'], 0);
  xValor := StrToIntDef(Req.Params.Items['valor'], 0);
  xRegistro := FDAO.ProcurarPorId(xId);
  xValor := xValor + xRegistro.GetValue<Integer>(FColuna);
  if (FDAO.AlterarRegistro(xId, xRegistro, FColuna, IntToStr(xValor))) then
    Res.Status(THTTPStatus.Ok)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

end.
