unit UServiceMelhoria;

interface

uses UServiceIntf, REST.Client, REST.Types, Generics.Collections,
  Backend.UEntity.Melhoria, Backend.UEntity.Cidadao, Backend.UEntity.Categoria;

type
  TServiceMelhoria = class(TInterfacedObject, IService)
    private
      FMelhoria: TMelhoria;
      FMelhorias: TObjectList<TMelhoria>;

      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;
    function GetMelhoria: TObjectList<TMelhoria>;
    procedure SetMelhorias(const Value: TObjectList<TMelhoria>);
    function GetMelhorias: TObjectList<TMelhoria>;
    public
      Procedure Registrar;
      Procedure Listar;
      Procedure Excluir;
      Procedure Alterar;
      Procedure ObterRegistro;

      constructor Create; overload;
      constructor Create(aMelhoria : TMelhoria);overload;
      destructor  Destroy; override;

      property Melhorias: TObjectList<TMelhoria> read GetMelhorias write SetMelhorias;
  End;

implementation

uses
  System.JSON, DataSet.Serialize, FireDAC.comp.Client, System.SysUtils, System.IOUtils;

{ TServiceMelhoria }

procedure TServiceMelhoria.Alterar;
begin

end;

constructor TServiceMelhoria.Create(aMelhoria : TMelhoria);
begin
  FMelhoria := aMelhoria;

  Self.Create;
end;

constructor TServiceMelhoria.Create;
begin
  FRESTClient   := TRESTClient.Create(nil);
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Accept   := 'application/json';
  FRESTRequest.Client   := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;
end;

destructor TServiceMelhoria.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  inherited;
end;

procedure TServiceMelhoria.Excluir;
begin

end;

function TServiceMelhoria.GetMelhoria: TObjectList<TMelhoria>;
begin

end;

function TServiceMelhoria.GetMelhorias: TObjectList<TMelhoria>;
begin
  Result := FMelhorias;
end;

procedure TServiceMelhoria.Listar;
var
  xMemTable: TFDMemTable;
  xJSONFile: String;
  xMelhoria : TMelhoria;
begin
  xMemTable := TFDMemTable.Create(nil);
  xMelhoria := TMelhoria.Create();
  try
    try
      FRESTClient.BaseURL := 'http://localhost:9090/v1/melhoria';
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        200:
        begin
          xJSONFile := FRESTResponse.Content;
          xMemTable.LoadFromJSON(FRESTResponse.Content);
          TFile.WriteAllText('file.json', xJSONFile);
          while not xMemTable.Eof do
          begin

            FMelhorias.Add(FMelhoria);
            xMemTable.Next;
          end;
        end;
        401:
          raise Exception.Create('Usuário não autorizado.');
        else
          raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
      end;
    except on E: Exception do
    end;


  finally
    FreeAndNil(xMemTable);
  end;

end;

procedure TServiceMelhoria.ObterRegistro;
begin

end;

procedure TServiceMelhoria.Registrar;
begin
    try
    FRESTClient.BaseURL := 'http://localhost:9090/v1/melhoria';
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FMelhoria.JSON);
    FRESTRequest.Execute;
    case FRESTResponse.StatusCode of
      201:
        Exit;
      401:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TServiceMelhoria.SetMelhorias(const Value: TObjectList<TMelhoria>);
begin
  FMelhorias := Value;
end;

end.
