unit Backend.UEntity.Cidadao;
interface
uses
  System.JSON,
  GBSwagger.Model.Attributes;
type
  TCidadao = class
    private
      FId      : Integer;
      FNome    : String;
      FPontos  : Integer;
      FJSON    : TJSONObject;
      function GetId      : Integer;
      function GetNome    : String;
      function GetPontos  : Integer;
      function GetJSON    : TJSONObject;
      procedure SetId      (const Value: Integer);
      procedure SetNome    (const Value: String);
      procedure SetPontos  (const Value: Integer);
    public

      constructor Create; overload;
      constructor Create(aId: Integer); overload;
      constructor Create(aNome: String); overload;
      constructor Create(const aId, aPontos: Integer; aNome: String); overload;
      destructor  Destroy; override;

      [SwagProp('Cidadão Id', True)]
      property Id: Integer read GetId write SetId;
      [SwagProp('Cidadão Nome', True)]
      property Nome: String read GetNome write SetNome;
      [SwagProp('Cidadão Pontos', True)]
      property Pontos: Integer read GetPontos write SetPontos;

      property JSON: TJSONObject read GetJSON;
  end;
implementation
uses
  System.SysUtils;
{Constructor}
constructor TCidadao.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TCidadao.Create(const aId, aPontos: Integer; aNome: String);
begin
  FId     := aId;
  FPontos := aPontos;
  FNome   := aNome;

  self.Create
end;

constructor TCidadao.Create(aNome: String);
begin
  FNome   := aNome;

  self.Create
end;

constructor TCidadao.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;
{Destroy}
destructor TCidadao.Destroy;
begin
  FreeAndNil(FJSON);
  inherited;
end;
{Gets}
function TCidadao.GetId: Integer;
begin
  Result := FId;
end;
function TCidadao.GetNome: string;
begin
  Result := FNome;
end;
function TCidadao.GetPontos: Integer;
begin
  Result := FPontos;
end;
function TCidadao.GetJSON: TJSONObject;
begin
  FJSON.AddPair('nome',        FNome);
  FJSON.AddPair('pontos',      FPontos.ToString);
  Result := FJSON;
end;
{Sets}
procedure TCidadao.SetId(const Value: Integer);
begin
  FId := Value;
end;
procedure TCidadao.SetNome(const Value: string);
begin
  FNome := Value;
end;
procedure TCidadao.SetPontos(const Value: Integer);
begin
  FPontos := Value;
end;
end.
