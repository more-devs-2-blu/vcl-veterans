unit Backend.UEntity.Acao;

interface

uses
  System.JSON,
  GBSwagger.Model.Attributes,
  Backend.UEntity.Categoria, Backend.UEntity.Cidadao;
type
  TAcao = class
    private
      FId          : Integer;
      FCategoria   : TCategoria;
      FApoio       : Integer;
      FResposta    : String;
      FStatus      : String;
      FDescricao   : String;
      FEndereco    : String;
      FCriador     : TCidadao;

      FJSON     : TJSONObject;

      function GetId           : Integer;
      function GetApoio        : Integer;
      function GetCategoria    : TCategoria;
      function GetResposta     : String;
      function GetStatus       : String;
      function GetDescricao    : String;
      function GetEndereco     : String;
      function GetCriador      : TCidadao;

      function GetJSON: TJSONObject;

      procedure SetApoio       (const Value: Integer);
      procedure SetCategoria   (const Value: TCategoria);
      procedure SetResposta    (const Value: String);
      procedure SetStatus      (const Value: String);
      procedure SetDescricao   (const Value: String);
      procedure SetEndereco    (const Value: String);

    procedure SetCriador(const Value: TCidadao);

    public
      constructor Create; overload;
      constructor Create(aId: Integer); overload;
      constructor Create(const aCategoria: TCategoria;
                         const aApoio: Integer;
                         const aStatus, aDescricao, aEndereco: String;
                         const aCriador: TCidadao); overload;
      constructor Create(const aId: Integer; const aCategoria: TCategoria; const aApoio: Integer;
          const aStatus, aDescricao, aEndereco: String; const aCriador: TCidadao); overload;
      //Listar Acoes
       constructor Create(const aId: Integer;  const aApoio: Integer; const aStatus,
           aDescricao, aEndereco: String; const aCategoria: TCategoria; const aCriador: TCidadao); overload;

      destructor  Destroy; override;

      [SwagProp('Ação Id', True)]
      property Id: Integer read GetId;

      [SwagProp('Ação Categoria', True)]
      property Categoria: TCategoria read GetCategoria write SetCategoria;

      [SwagProp('Ação Apoio', True)]
      property Apoio: Integer read GetApoio write SetApoio;

      [SwagProp('Acao Resposta', True)]
      property Resposta: String read GetResposta write SetResposta;

      [SwagProp('Ação Status', True)]
      property Status: String read GetStatus write SetStatus;

      [SwagProp('Ação Descricao', True)]
      property Descricao: String read GetDescricao write SetDescricao;

      [SwagProp('Ação Endereco', True)]
      property Endereco: String read GetEndereco write SetEndereco;

      [SwagProp('Ação Criador', True)]
      property Criador: TCidadao read GetCriador write SetCriador;

      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{Constructor}
constructor TAcao.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TAcao.Create(const aCategoria: TCategoria; const aApoio: Integer;
          const aStatus, aDescricao, aEndereco: String; Const ACriador: TCidadao);
begin
  FCategoria:= aCategoria;
  FApoio    := aApoio;
  FStatus   := aStatus;
  FDescricao:= aDescricao;
  FEndereco := aEndereco;
  FCriador  := aCriador;

  Self.Create;
end;

{Destroy}
constructor TAcao.Create(aId: Integer);
begin
  FId:= aId;
  Self.Create;
end;

constructor TAcao.Create(const aId: Integer; const aCategoria: TCategoria;
  const aApoio: Integer; const aStatus, aDescricao, aEndereco: String;
  const aCriador: TCidadao);
begin
  Fid       := aId;
  FCategoria:= aCategoria;
  FApoio    := aApoio;
  FStatus   := aStatus;
  FDescricao:= aDescricao;
  FEndereco := aEndereco;
  FCriador  := aCriador;

  Self.Create;
end;

constructor TAcao.Create(const aId, aApoio: Integer; const aStatus, aDescricao,
  aEndereco: String; const aCategoria: TCategoria; const aCriador: TCidadao);
begin
  FId := aId;
  FApoio := aApoio;
  FStatus := aStatus;
  FDescricao := aDescricao;
  FEndereco := aEndereco;
  FCategoria := aCategoria;
  FCriador := aCriador;
end;

destructor TAcao.Destroy;
begin
  FreeAndNil(FJSON);

  inherited;
end;

{Gets}
function TAcao.GetId: Integer;
begin
  Result := FId;
end;

function TAcao.GetCategoria: TCategoria;
begin
  Result := FCategoria;
end;

function TAcao.GetCriador: TCidadao;
begin
  Result := FCriador;
end;

function TAcao.GetApoio: Integer;
begin
  Result := FApoio;
end;

function TAcao.GetResposta: String;
begin
  Result := FResposta;
end;

function TAcao.GetStatus: String;
begin
  Result := FStatus;
end;

function TAcao.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TAcao.GetEndereco: String;
begin
  Result := FEndereco;
end;

function TAcao.GetJSON: TJSONObject;
begin

  FJSON.AddPair('apoio',       FApoio.ToString);
  FJSON.AddPair('idcategoria',   FCategoria.id.ToString);
  FJSON.AddPair('status',      FStatus);
  FJSON.AddPair('descricao',   FDescricao);
  FJSON.AddPair('endereco',    FEndereco);
  FJSON.AddPair('idcriador',     FCriador.Id.ToString);

  Result := FJSON;
end;


{Sets}

procedure TAcao.SetCategoria(const Value: TCategoria);
begin
  FCategoria := Value;
end;

procedure TAcao.SetCriador(const Value: TCidadao);
begin
  FCriador := Value;
end;

procedure TAcao.SetApoio(const Value: Integer);
begin
  FApoio := Value;
end;

procedure TAcao.SetResposta(const Value: String);
begin
  FResposta := Value;
end;

procedure TAcao.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TAcao.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TAcao.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

end.
