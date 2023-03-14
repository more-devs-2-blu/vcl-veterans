unit Unit1;

interface

uses REST.Client, REST.Types, Generics.Collections,
  Backend.UEntity.Acao, Backend.UEntity.Cidadao, Backend.UEntity.Categoria,
  UServiceIntf;

type
  TServiceMelhoria = class(TInterfacedObject, IService)
    private
      FAcao: TAcao;
      FAcoes: TObjectList<TAcao>;

      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;
    function GetMelhoria: TObjectList<TAcao>;
    procedure SetAcoes(const Value: TObjectList<TAcao>);
    function GetAcoes: TObjectList<TAcao>;
    public
      Procedure Registrar;
      Procedure Listar;
      Procedure Excluir;
      Procedure Alterar;
      Procedure ObterRegistro;
      procedure PreencherMelhorias(const aJsonMelhorias: String);

      constructor Create; overload;
      constructor Create(aMelhoria : TAcao);overload;
      destructor  Destroy; override;

      property Acoes: TObjectList<TAcao> read GetAcoes write SetAcoes;
  End;

implementation

uses
  System.JSON, DataSet.Serialize, FireDAC.comp.Client, System.SysUtils, System.IOUtils;

{ TServiceMelhoria }

procedure TServiceMelhoria.Alterar;
begin

end;

constructor TServiceMelhoria.Create(aMelhoria : TAcao);
begin
  FAcao := aMelhoria;

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

  FAcoes := TObjectList<TAcao>.Create;
end;

destructor TServiceMelhoria.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);

  FreeAndNil(FAcao);
  FreeAndNil(FAcoes);

  inherited;
end;

procedure TServiceMelhoria.Excluir;
begin

end;

function TServiceMelhoria.GetMelhoria: TObjectList<TAcao>;
begin

end;

function TServiceMelhoria.GetAcoes: TObjectList<TAcao>;
begin
  Result := FAcoes;
end;

procedure TServiceMelhoria.Listar;
begin
    try
      FRESTClient.BaseURL := 'http://localhost:9090/v1/melhoria/apoio/desc';
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        200:
        begin
          Self.PreencherMelhorias(FRESTResponse.Content)
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

procedure TServiceMelhoria.ObterRegistro;
begin

end;

procedure TServiceMelhoria.PreencherMelhorias(const aJsonMelhorias: String);
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
      xMemTableCidadao.LoadFromJSON(xMemTable.FieldByName('cidadao').AsString);
      xCidadao := TCidadao.Create(xMemTableCidadao.FieldByName('nome').AsString);

      xMemTableCategoria.LoadFromJSON(xMemTable.FieldByName('categoria').AsString);
      xCategoria := TCategoria.Create(xMemTableCategoria.FieldByName('nome').AsString);

      FAcoes.Add(TAcao.Create(xMemTable.FieldByName('id').asInteger,
                                      xMemTable.FieldByName('apoio').asInteger,
                                      xMemTable.FieldByName('resposta').AsString,
                                      xMemTable.FieldByName('status').AsString,
                                      xMemTable.FieldByName('descricao').AsString,
                                      xMemTable.FieldByName('endereco').AsString,
                                      xCidadao,
                                      xCategoria
                                      ));


      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableCidadao);
    FreeAndNil(xMemTableCategoria);
  end;

end;

procedure TServiceMelhoria.Registrar;
begin
    try
    FRESTClient.BaseURL := 'http://localhost:9090/v1/melhoria';
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FAcao.JSON);
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

procedure TServiceMelhoria.SetAcoes(const Value: TObjectList<TAcao>);
begin
  FAcoes := Value;
end;

end.
