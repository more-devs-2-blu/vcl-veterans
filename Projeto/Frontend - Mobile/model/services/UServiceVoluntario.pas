unit UServiceVoluntario;

interface

uses REST.Client, REST.Types, Generics.Collections,
  Backend.UEntity.Voluntario, Backend.UEntity.Cidadao, Backend.UEntity.Acao,
  UServiceIntf;

type
  TServiceVoluntario = class(TInterfacedObject, IService)
    private
      FVoluntario: TVoluntario;
      FVoluntarios: TObjectList<TVoluntario>;

      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;
      function GetVoluntario: TObjectList<TVoluntario>;
      procedure SetVoluntarios(const Value: TObjectList<TVoluntario>);
      function GetVoluntarios: TObjectList<TVoluntario>;
    public
      Procedure Registrar;
      Procedure Listar;
      Procedure Excluir;
      Procedure Alterar;overload;
      Procedure Alterar(const aColuna, aValor: String);overload;
      //Procedure AlterarPontuacao(aValor: String);
      Procedure ObterRegistro;
      procedure PreencherVoluntarios(const aJsonMelhorias: String);
      procedure AdicionarInscricao;

      constructor Create; overload;
      constructor Create(aVoluntario : TVoluntario);overload;
      destructor  Destroy; override;

      property Voluntarios: TObjectList<TVoluntario> read GetVoluntarios write SetVoluntarios;
  End;
implementation

{ TServiceVoluntario }
uses
  System.JSON, DataSet.Serialize, FireDAC.comp.Client, System.SysUtils, System.IOUtils, UUtils.Constants;

procedure TServiceVoluntario.AdicionarInscricao;
begin

end;

procedure TServiceVoluntario.Alterar(const aColuna, aValor: String);
var
  xRequestJSON: TJSONObject;
begin
  try
    xRequestJSON := TJSONObject.Create;
    try
      FRESTClient.BaseURL := Format(URL_BASE_VOLUNTARIO + '/%s/%s/%s',[FVoluntario.Id.ToString, aColuna, aValor]);
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

constructor TServiceVoluntario.Create;
begin
  FRESTClient   := TRESTClient.Create(nil);
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Accept   := 'application/json';
  FRESTRequest.Client   := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;

  FVoluntarios := TObjectList<TVoluntario>.Create;
end;

procedure TServiceVoluntario.Alterar;
begin
 //Não implementado
end;

constructor TServiceVoluntario.Create(aVoluntario: TVoluntario);
begin
  FVoluntario := aVoluntario;
  Self.Create;
end;

destructor TServiceVoluntario.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);

  FreeAndNil(FVoluntario);
  FreeAndNil(FVoluntario);

  inherited;
  inherited;
end;

procedure TServiceVoluntario.Excluir;
begin

end;

function TServiceVoluntario.GetVoluntario: TObjectList<TVoluntario>;
begin

end;

function TServiceVoluntario.GetVoluntarios: TObjectList<TVoluntario>;
begin
  Result := FVoluntarios;
end;

procedure TServiceVoluntario.Listar;
begin
    try
      FRESTClient.BaseURL := 'http://localhost:9090/v1/melhoria/apoio/desc';
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        200:
        begin
          Self.PreencherVoluntarios(FRESTResponse.Content)
        end;
        401:
          raise Exception.Create('Usuário não autorizado.');
        else
          raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
      end;
    except on E: Exception do
      raise Exception.Create('Error Message');
    end;
end;

procedure TServiceVoluntario.ObterRegistro;
begin

end;

procedure TServiceVoluntario.PreencherVoluntarios(const aJsonMelhorias: String);
var
  xMemTable: TFDMemTable;
  xMemTableCidadao: TFDMemTable;
  xMemTableAcao: TFDMemTable;
  xCidadao: TCidadao;
  xAcao: TAcao;
  xJSONFile: String;

begin
  FVoluntarios.Clear;

  xMemTable := TFDMemTable.Create(nil);
  xMemTableCidadao := TFDMemTable.Create(nil);
  xMemTableAcao := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);
    xJSONFile := FRESTResponse.Content;
    TFile.WriteAllText('file.json', xJSONFile);


    while not xMemTable.Eof do
    begin
      xMemTableCidadao.LoadFromJSON(xMemTable.FieldByName('cidadao').AsString);
      xCidadao := TCidadao.Create(xMemTableCidadao.FieldByName('nome').AsString);

      xMemTableAcao.LoadFromJSON(xMemTable.FieldByName('acao').AsString);
      xAcao := TAcao.Create(xMemTableAcao.FieldByName('id').AsInteger);

      FVoluntarios.Add(TVoluntario.Create(xMemTable.FieldByName('id').asInteger,
                                      xCidadao,
                                      xAcao
                                      ));


      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableCidadao);
    FreeAndNil(xMemTableAcao);
  end;
end;

procedure TServiceVoluntario.Registrar;
begin
try
    FRESTClient.BaseURL := URL_BASE_VOLUNTARIO;
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FVoluntario.JSON);
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

procedure TServiceVoluntario.SetVoluntarios(
  const Value: TObjectList<TVoluntario>);
begin
  FVoluntarios := Value;
end;

end.
