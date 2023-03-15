unit UServiceCidadao;
interface
uses
  REST.Client, REST.Types, Generics.Collections,
  Backend.UEntity.Cidadao, Backend.UEntity.Categoria,
  UServiceIntf;
type
  TServiceCidadao = class(TInterfacedObject, IService)
    private
      FCidadao: TCidadao;
      FCidadaos: TObjectList<TCidadao>;

      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;

      function GetCidadao: TCidadao;
      function GetCidadaos: TObjectList<TCidadao>;
      procedure SetCidadaos(const Value: TObjectList<TCidadao>);
    procedure SetCidadao(const Value: TCidadao);

    public
      procedure Alterar;
      procedure Registrar;
      procedure Listar;
      procedure Excluir;
      procedure ObterRegistro;
      procedure PreencherCidadaos(const aJsonCidadaos: String);
      constructor Create; overload;
      constructor Create(aCidadao: TCidadao); overload;
      destructor  Destroy; override;

      property Cidadaos: TObjectList<TCidadao> read GetCidadaos write SetCidadaos;
      property Cidadao: TCidadao read getCidadao write SetCidadao;
  end;
implementation
uses
  System.JSON,
  DataSet.Serialize,
  FireDAC.comp.Client,
  System.SysUtils,
  System.IOUtils,
  UUtils.Constants,
  UUtils.Functions;
{ TServiceTeam }
constructor TServiceCidadao.Create;
begin
  FRESTClient   := TRESTClient.Create(nil);
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest.Accept   := 'application/json';
  FRESTRequest.Client   := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;
  FCidadaos := TObjectList<TCidadao>.Create;
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

function TServiceCidadao.GetCidadao: TCidadao;
begin
  Result := FCidadao;
end;

function TServiceCidadao.GetCidadaos: TObjectList<TCidadao>;
begin
  Result := FCidadaos;
end;

procedure TServiceCidadao.Listar;
begin
    try
      FRESTClient.BaseURL := 'http://localhost:9090/v1/cidadao/pontos/desc';
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;
      case FRESTResponse.StatusCode of
        200:
        begin
          Self.PreencherCidadaos(FRESTResponse.Content)
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
procedure TServiceCidadao.ObterRegistro;
begin
end;
{Preencher Cidadaos}
procedure TServiceCidadao.PreencherCidadaos(const aJsonCidadaos: String);
var
  xMemTable: TFDMemTable;
  xMemTableCidadao: TFDMemTable;
  xMemTableCategoria: TFDMemTable;
  xCidadao: TCidadao;
  xCategoria: TCategoria;
  xJSONFile: String;
begin
  FCidadaos.Clear;
  xMemTable := TFDMemTable.Create(nil);
  xMemTableCidadao := TFDMemTable.Create(nil);
  xMemTableCategoria := TFDMemTable.Create(nil);
  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);
    xJSONFile := FRESTResponse.Content;
    TFile.WriteAllText('file.json', xJSONFile);
    while not xMemTable.Eof do
    begin
      FCidadaos.Add(TCidadao.Create(xMemTable.FieldByName('id').asInteger,
                                      xMemTable.FieldByName('pontos').asInteger,
                                      xMemTable.FieldByName('nome').AsString));
      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceCidadao.Registrar;
begin
  try
    FRESTClient.BaseURL := 'http://localhost:9090/v1/cidadao';
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FCidadao.JSON);
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

procedure TServiceCidadao.SetCidadao(const Value: TCidadao);
begin
  FCidadao := Value;
end;

procedure TServiceCidadao.SetCidadaos(const Value: TObjectList<TCidadao>);
begin
  FCidadaos := Value;
end;


{Metodos Vazios}
procedure TServiceCidadao.Excluir;
begin

end;

procedure TServiceCidadao.Alterar;
begin

end;

end.

