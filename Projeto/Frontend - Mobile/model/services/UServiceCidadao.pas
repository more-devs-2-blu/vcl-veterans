unit UServiceCidadao;

interface

uses
  Generics.Collections,
  Backend.UEntity.Cidadao,
  UServiceIntf;

type
  TServiceCidadao = class(TInterfacedObject, IService)
    private
      FCidadao: TCidadao;
      FCidadaos: TObjectList<TCidadao>;
      function GetCidadaos: TObjectList<TCidadao>;
    public
      constructor Create; overload;
      constructor Create(aCidadao: TCidadao); overload;
      destructor  Destroy; override;
      procedure Alterar; override;
      procedure Registrar; override;
      procedure Listar; override;
      procedure Excluir; override;
      procedure ObterRegistro; override;

  end;
implementation

uses
  System.SysUtils, REST.Types,
  UUtils.Constants, DataSet.Serialize,
  FireDAC.comp.Client,
  UUtils.Functions, JSON;

{ TServiceTeam }

constructor TServiceCidadao.Create;
begin
  Inherited Create;

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

procedure TServiceCidadao.ObterRegistro;
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


end.
