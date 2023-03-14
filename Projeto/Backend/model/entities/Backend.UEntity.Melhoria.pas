unit Backend.UEntity.Melhoria;

interface

uses
  System.JSON,
  GBSwagger.Model.Attributes,
  Backend.UEntity.Cidadao, Backend.UEntity.Categoria;
type
  TMelhoria = class
    private
      FId       : Integer;
      FCategoria: TCategoria;
      FApoio    : Integer;
      FResposta : String;
      FStatus   : String;
      FDescricao: String;
      FEndereco : String;
      FCidadao  : TCidadao;
      FJSON     : TJSONObject;

      function GetId       : Integer;
      function GetApoio    : Integer;
      function GetCategoria: TCategoria;
      function GetCidadao  : TCidadao;
      function GetResposta : String;
      function GetStatus   : String;
      function GetDescricao: String;
      function GetEndereco : String;


      function GetJSON: TJSONObject;

      procedure SetId       (const Value: Integer);
      procedure SetApoio    (const Value: Integer);
      procedure SetCategoria(const Value: TCategoria);
      procedure SetCidadao  (const Value: TCidadao);
      procedure SetResposta (const Value: String);
      procedure SetStatus   (const Value: String);
      procedure SetDescricao(const Value: String);
      procedure SetEndereco (const Value: String);
    public
      constructor Create; overload;
      constructor Create(aId: Integer); overload;
      constructor Create(const aStatus, aDescricao, aEndereco: String; aCidadao: TCidadao; const aCategoria: TCategoria); overload;
      //Create Usado para listar melhorias
      constructor Create(const aId, aApoio: Integer; const aResposta, aStatus, aDescricao, aEndereco: String; aCidadao: TCidadao; const aCategoria: TCategoria); overload;

      destructor  Destroy; override;

      [SwagProp('Melhoria Id', True)]
      property Id: Integer read GetId write SetId;

      [SwagProp('Melhoria Apoio', True)]
      property Apoio: Integer read GetApoio write SetApoio;

      [SwagProp('Melhoria Categoria', True)]
      property Categoria: TCategoria read GetCategoria write SetCategoria;

      [SwagProp('Melhoria Resposta', True)]
      property Resposta: String read GetResposta write SetResposta;

      [SwagProp('Melhoria Status', True)]
      property Status: String read GetStatus write SetStatus;

      [SwagProp('Melhoria Descricao', True)]
      property Descricao: String read GetDescricao write SetDescricao;

      [SwagProp('Melhoria Endereco', True)]
      property Endereco: String read GetEndereco write SetEndereco;

      [SwagProp('Melhoria Cidadao', True)]
      property Cidadao: TCidadao read GetCidadao write SetCidadao;


      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{Constructor}
constructor TMelhoria.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TMelhoria.Create(
      const aStatus, aDescricao, aEndereco: String; aCidadao: TCidadao; const aCategoria: TCategoria);
begin
  FCategoria:= aCategoria;
  FCidadao  := aCidadao;
  FApoio    := 0;
  FStatus   := aStatus;
  FDescricao:= aDescricao;
  FEndereco := aEndereco;


  Self.Create;
end;

constructor TMelhoria.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

constructor TMelhoria.Create(const aId, aApoio: Integer; const aResposta,
  aStatus, aDescricao, aEndereco: String; aCidadao: TCidadao;
  const aCategoria: TCategoria);
begin
  FId       := aId;
  FApoio    := aApoio;
  FStatus   := aStatus;
  FDescricao:= aDescricao;
  FEndereco := aEndereco;
  FCidadao  := aCidadao;
  FCategoria:= aCategoria;

  Self.Create;
end;

{Destroy}
destructor TMelhoria.Destroy;
begin
  FreeAndNil(FJSON);

  inherited;
end;

{Gets}
function TMelhoria.GetId: Integer;
begin
  Result := FId;
end;

function TMelhoria.GetCategoria: TCategoria;
begin
  Result := FCategoria;
end;

function TMelhoria.GetApoio: Integer;
begin
  Result := FApoio;
end;

function TMelhoria.GetResposta: String;
begin
  Result := FResposta;
end;

function TMelhoria.GetStatus: String;
begin
  Result := FStatus;
end;

function TMelhoria.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TMelhoria.GetEndereco: String;
begin
  Result := FEndereco;
end;

function TMelhoria.GetCidadao: TCidadao;
begin
  Result :=FCidadao;
end;

function TMelhoria.GetJSON: TJSONObject;
begin

  FJSON.AddPair('apoio',       FApoio.ToString);
  FJSON.AddPair('idcategoria', FCategoria.Id.ToString);
  FJSON.AddPair('status',      FStatus);
  FJSON.AddPair('descricao',   FDescricao);
  FJSON.AddPair('endereco',    FEndereco);
  FJSON.AddPair('idcidadao',   FCidadao.Id.ToString);



  Result := FJSON;
end;


{Sets}
procedure TMelhoria.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMelhoria.SetCategoria(const Value: TCategoria);
begin
  FCategoria := Value;
end;

procedure TMelhoria.SetApoio(const Value: Integer);
begin
  FApoio := Value;
end;

procedure TMelhoria.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TMelhoria.SetResposta(const Value: String);
begin
  FResposta := Value;
end;

procedure TMelhoria.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TMelhoria.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TMelhoria.SetCidadao(const Value: TCidadao);
begin
  FCidadao := Value;
end;

end.
