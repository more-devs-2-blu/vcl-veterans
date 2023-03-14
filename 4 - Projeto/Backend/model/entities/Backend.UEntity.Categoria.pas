unit Backend.UEntity.Categoria;

interface

uses
  System.JSON,
  GBSwagger.Model.Attributes;

type

 TCategoria = class
  private
     FId       : Integer;
     FNome     : String;
     FJSON     : TJSONObject;

     function GetId      : Integer;
     function GetNome    : String;
     function GetJSON    : TJSONObject;

     procedure SetNome    (const Value: String);

     public
     constructor Create; overload;
     constructor Create(aId: Integer); overload;
     constructor Create(const aNome: String); overload;

     destructor  Destroy; override;

     [SwagProp('Categoria Id', True)]
     property Id: Integer read GetId;

     [SwagProp('Categoria Nome', True)]
     property Nome: String read GetNome write SetNome;

     property JSON: TJSONObject read GetJSON;

 end;

 implementation

uses
  System.SysUtils;

 {Constructor}
constructor TCategoria.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TCategoria.Create( const aNome : String);
begin
  FNome     := aNome;

  Self.Create;
end;


constructor TCategoria.Create(aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

{Destroy}
destructor TCategoria.Destroy;
begin
  FreeAndNil(FJSON);

  inherited;
end;

{Gets}
function TCategoria.GetId: Integer;
begin
  Result := FId;
end;

function TCategoria.GetNome: string;
begin
  Result := FNome;
end;

function TCategoria.GetJSON: TJSONObject;
begin

  FJSON.AddPair('nome',        FNome);

  Result := FJSON;
end;

{Sets}

procedure TCategoria.SetNome(const Value: string);
begin
  FNome := Value;
end;
end.

end.
