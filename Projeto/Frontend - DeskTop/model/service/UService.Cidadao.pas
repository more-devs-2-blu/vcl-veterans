unit UService.Cidadao;

interface

uses
  UService.Base,
  Generics.Collections,
  Backend.UEntity.Cidadao;

type
  TServiceCidadao = class(TServiceBase)
    private
      FCidadao: TCidadao;
      FCidadaos: TObjectList<TCidadao>;
      function GetCidadaos: TObjectList<TCidadao>;
    public
      constructor Create; overload;
      constructor Create(aCidadao: TCidadao); overload;
      destructor  Destroy; override;
      procedure Alterar(aColuna, aValor: String); override;
      procedure Registrar; override;
      procedure Listar; override;
      procedure Excluir; override;
      function ObterRegistro(const aId: Integer): TObject; override;
      property Cidadaos: TObjectList<TCidadao> read GetCidadaos;
  end;
implementation

uses
  System.SysUtils, REST.Types,
  UUtils.Constants, DataSet.Serialize,
  FireDAC.comp.Client,
  UService.Intf,
  UUtils.Functions, JSON;

{ TServiceTeam }

constructor TServiceCidadao.Create;
begin
  Inherited Create;

  FCidadaos := TObjectList<TCidadao>.Create;
end;

procedure TServiceCidadao.Alterar(aColuna, aValor: String);
var
  xFakeJSON: TJSONObject;
begin
  try
    xFakeJSON := TJSONObject.Create;
    try
  FRESTClient.BaseURL := Format(URL_BASE_CIDADAO + '/%s/%s/%s',[FCidadao.Id.ToString, aColuna, aValor]);
  FRESTRequest.Method := rmPatch;


  FRESTRequest.Addbody(xFakeJSON);
  {FRESTRequest.Params.AddItem('id', IntToStr(FCidadao.Id), TRESTRequestParameterKind.pkGETorPOST);
  FRESTRequest.Params.AddItem('coluna', aColuna, TRESTRequestParameterKind.pkGETorPOST);
  FRESTRequest.Params.AddItem('id', aValor, TRESTRequestParameterKind.pkGETorPOST);}
  FRESTRequest.Execute;
    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Registro não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
  finally
    FreeAndNil(xFakeJSON);
  end;
end;

constructor TServiceCidadao.Create(aCidadao: TCidadao);
begin
  FCidadao := aCidadao;

  Self.Create;
end;

destructor TServiceCidadao.Destroy;
begin
  FreeAndNil(FCidadao);
  FreeAndNil(FCidadaos);
  inherited;
end;

procedure TServiceCidadao.Excluir;
begin
  if (not Assigned(FCidadao)) or (FCidadao.Id = 0) then
    raise Exception.Create('Nenhuma Partida foi escolhida para exclusão.');
  try
    FRESTClient.BaseURL := Format(URL_BASE_CIDADAO + '/%d', [FCidadao.Id]);
    FRESTRequest.Method := rmDelete;
    FRESTRequest.Execute;
    case FRESTResponse.StatusCode of
      API_SUCESSO_SEM_RETORNO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Registro não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;

end;

function TServiceCidadao.GetCidadaos: TObjectList<TCidadao>;
begin
  Result := FCidadaos;
end;

procedure TServiceCidadao.Listar;
var
  xMemTable: TFDMemTable;
begin
  FCidadaos.Clear;
  xMemTable := TFDMemTable.Create(nil);
  try
    try
      FRESTClient.BaseURL := URL_BASE_CIDADAO;
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;
      case FRESTResponse.StatusCode of
        API_SUCESSO:
          begin
            xMemTable.LoadFromJSON(FRESTResponse.Content);
            while not xMemTable.Eof do
            begin
              FCidadaos.Add(TCidadao.Create(xMemTable.FieldByName('id').AsInteger,
                xMemTable.FieldByName('pontos').AsInteger,
                xMemTable.FieldByName('nome').AsString));
              xMemTable.Next;
            end;
          end;
        API_NAO_AUTORIZADO:
          raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create
          ('Error ao carregar a lista de Times. Código do Erro:' +
          FRESTResponse.StatusCode.ToString);
      end;
    except
      on e: Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

function TServiceCidadao.ObterRegistro(const aId: Integer): TObject;
var
  xMemTable: TFDMemTable;
begin
  Result := nil;
  xMemTable := TFDMemTable.Create(nil);
  try
    FRESTClient.BaseURL := URL_BASE_CIDADAO + '/' + aId.ToString;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;
    if FRESTResponse.StatusCode = API_SUCESSO then
    begin
      xMemTable.LoadFromJSON(FRESTResponse.Content);
      if xMemTable.FindFirst then
        Result := TCidadao.Create(xMemTable.FieldByName('id').AsInteger);
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceCidadao.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_CIDADAO;
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FCidadao.JSON);
    FRESTRequest.Execute;
    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não Autorizado.');
    else
      raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

end.
