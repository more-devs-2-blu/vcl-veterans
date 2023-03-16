unit UServiceAcao;

interface

uses REST.Client, REST.Types, Generics.Collections,
  Backend.UEntity.Acao, Backend.UEntity.Cidadao, Backend.UEntity.Categoria,
  UServiceIntf, UUtils.Constants;

type
  TServiceAcao = class(TInterfacedObject, IService)
    private
      FAcao: TAcao;
      FAcoes: TObjectList<TAcao>;

      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;
    function GetAcao: TObjectList<TAcao>;
    procedure SetAcoes(const Value: TObjectList<TAcao>);
    function GetAcoes: TObjectList<TAcao>;
    public
      Procedure Registrar;
      Procedure Listar;
      Procedure Excluir;
      Procedure Alterar;
      Procedure AlterarPontuacao(aValor: String);
      procedure AlterarPorId(const aColuna, aValor: String);
      Procedure ObterRegistro;
      procedure PreencherAcao(const aJsonAcoes: String);
      Function ObterRegistroPorId(aId:Integer):TAcao;
      constructor Create; overload;
      constructor Create(aAcao : TAcao);overload;
      destructor  Destroy; override;

      property Acoes: TObjectList<TAcao> read GetAcoes write SetAcoes;
  End;

implementation

uses
  System.JSON, DataSet.Serialize, FireDAC.comp.Client, System.SysUtils, System.IOUtils;

{ TServiceMelhoria }

procedure TServiceAcao.Alterar;
begin

end;

procedure TServiceAcao.AlterarPorId(const aColuna, aValor: String);
var
  xRequestJSON: TJSONObject;
begin
  try
    xRequestJSON := TJSONObject.Create;
    try
      FRESTClient.BaseURL := Format(URL_BASE_ACAO + '/%s/%s/%s',[FAcao.Id.ToString, aColuna, aValor]);
      FRESTRequest.Method := rmPatch;
      FRESTRequest.Addbody(xRequestJSON);

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
    FreeAndNil(xRequestJSON);
  end;
end;

procedure TServiceAcao.AlterarPontuacao(aValor: String);
var
  xRequestJSON: TJSONObject;
begin
  try
    xRequestJSON := TJSONObject.Create;
    try
      FRESTClient.BaseURL := Format(URL_BASE_ACAO + '/%s/%s',[FAcao.Id.ToString, aValor]);
      FRESTRequest.Method := rmPut;
      FRESTRequest.Addbody(xRequestJSON);

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
    FreeAndNil(xRequestJSON);
  end;
end;

constructor TServiceAcao.Create(aAcao : TAcao);
begin
  FAcao := aAcao;

  Self.Create;
end;

constructor TServiceAcao.Create;
begin
  FRESTClient   := TRESTClient.Create(nil);
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Accept   := 'application/json';
  FRESTRequest.Client   := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;

  FAcoes := TObjectList<TAcao>.Create;
end;

destructor TServiceAcao.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);

  FreeAndNil(FAcao);
  FreeAndNil(FAcoes);

  inherited;
end;

procedure TServiceAcao.Excluir;
begin
  //Não implementado nessa versão.
end;

function TServiceAcao.GetAcao: TObjectList<TAcao>;
begin
  //Não implementado nessa versão.
end;

function TServiceAcao.GetAcoes: TObjectList<TAcao>;
begin
  Result := FAcoes;
end;

procedure TServiceAcao.Listar;
begin
    try
      FRESTClient.BaseURL := URL_BASE_ACAO + '/apoio/desc';
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        API_SUCESSO:
        begin
          Self.PreencherAcao(FRESTResponse.Content)
        end;
        API_NAO_AUTORIZADO :
          raise Exception.Create('Usuário não autorizado.');
        else
          raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
      end;
    except on E: Exception do
      raise Exception.Create('Error Message');
    end;



end;

procedure TServiceAcao.ObterRegistro;
begin
  //Não implementado nessa versão.
end;

function TServiceAcao.ObterRegistroPorId(aId: Integer): TAcao;
var
  xMemTable: TFDMemTable;
  xMemTableCriador: TFDMemTable;
  xMemTableCategoria: TFDMemTable;
  xCriador: TCidadao;
  xCategoria: TCategoria;
  xJSONFile: String;
  xAcao: TAcao;
begin
  xMemTable := TFDMemTable.Create(nil);
  xMemTableCriador := TFDMemTable.Create(nil);
  xMemTableCategoria := TFDMemTable.Create(nil);
  try
    try
      FRESTClient.BaseURL := URL_BASE_ACAO + '/'+ intToStr(aId);
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        API_SUCESSO:
        begin
          xMemTable.LoadFromJSON(FRESTResponse.Content);
          xJSONFile := FRESTResponse.Content;
          TFile.WriteAllText('file.json', xJSONFile);

          xMemTableCriador.LoadFromJSON(xMemTable.FieldByName('criador').AsString);
          xCriador := TCidadao.Create(xMemTableCriador.FieldByName('nome').AsString);

          xMemTableCategoria.LoadFromJSON(xMemTable.FieldByName('categoria').AsString);
          xCategoria := TCategoria.Create(xMemTableCategoria.FieldByName('nome').AsString);

          xAcao := TAcao.Create(xMemTable.FieldByName('id').asInteger,
                                      xMemTable.FieldByName('apoio').asInteger,
                                      xMemTable.FieldByName('status').AsString,
                                      xMemTable.FieldByName('descricao').AsString,
                                      xMemTable.FieldByName('endereco').AsString,
                                      xCategoria,
                                      xCriador
                                      );
          Result := xAcao;
        end;
        API_NAO_AUTORIZADO :
          raise Exception.Create('Usuário não autorizado.');
        else
          raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
      end;
    except on E: Exception do
      raise Exception.Create('Error Message');
    end;
    finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableCriador);
    FreeAndNil(xMemTableCategoria);
  end;


end;

procedure TServiceAcao.PreencherAcao(const aJsonAcoes: String);
var
  xMemTable: TFDMemTable;
  xMemTableCidadao: TFDMemTable;
  xMemTableCategoria: TFDMemTable;
  xCidadao: TCidadao;
  xCategoria: TCategoria;
  xJSONFile: String;

begin
  FAcoes.Clear;

  xMemTable := TFDMemTable.Create(nil);
  xMemTableCidadao := TFDMemTable.Create(nil);
  xMemTableCategoria := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);
    xJSONFile := FRESTResponse.Content;
    TFile.WriteAllText('file.json', xJSONFile);

    while not xMemTable.Eof do
    begin
      xMemTableCidadao.LoadFromJSON(xMemTable.FieldByName('criador').AsString);
      xCidadao := TCidadao.Create(xMemTableCidadao.FieldByName('nome').AsString);

      xMemTableCategoria.LoadFromJSON(xMemTable.FieldByName('categoria').AsString);
      xCategoria := TCategoria.Create(xMemTableCategoria.FieldByName('nome').AsString);

      FAcoes.Add(TAcao.Create(xMemTable.FieldByName('id').asInteger,
                                      xMemTable.FieldByName('apoio').asInteger,
                                      xMemTable.FieldByName('status').AsString,
                                      xMemTable.FieldByName('descricao').AsString,
                                      xMemTable.FieldByName('endereco').AsString,
                                      xCategoria,
                                      xCidadao
                                      ));


      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableCidadao);
    FreeAndNil(xMemTableCategoria);
  end;

end;

procedure TServiceAcao.Registrar;
var
  xJSONFile: String;
begin
    try
    FRESTClient.BaseURL := URL_BASE_ACAO ;
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FAcao.JSON);

    xJSONFile := FAcao.JSON.ToString;
    TFile.WriteAllText('file.json', xJSONFile);
    FRESTRequest.Execute;
    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO :
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TServiceAcao.SetAcoes(const Value: TObjectList<TAcao>);
begin
  FAcoes := Value;
end;

end.
