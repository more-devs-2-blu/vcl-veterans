unit Backend.UDAO.Base;

interface

uses
  Backend.UDAO.Intf,
  System.JSON,
  DataSet.Serialize;

type
  TDAOBase = class(TInterfacedObject, IDAO)
    protected
      FTabela: String;
    public
      function ObterRegistros(aJSONArray: TJSONArray): TJSONArray; virtual;
      function ObterSQL: TJSONArray; overload;
      function ObterSQL(aColuna, aOrdem: string): TJSONArray; overload;
      function ProcurarPorId(const aIdentificador: Integer): TJSONObject; virtual;
      function AdicionarRegistro(aRegistro: TJSONObject): Boolean;
      function DeletarRegistro(const aIdentificador: Integer): Boolean;
      function AlterarRegistro(const aIdentificador: Integer; const aRegistro: TJSONObject;
           const aColuna, aValor: string): Boolean;
    end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  Backend.UUtils.Banco;

{ TDAOBase }

function TDAOBase.AdicionarRegistro(aRegistro: TJSONObject): Boolean;
begin
  try
    Result := TUtilBanco.AdicionarRegistro(FTabela, aRegistro.ToJSON);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Adicionar Registro: '
        + e.Message);
  end;
end;

function TDAOBase.AlterarRegistro(const aIdentificador: Integer; const aRegistro: TJSONObject;
  const aColuna, aValor: string): Boolean;
begin
  try
    Result := TUtilBanco.AlterarRegistro(FTabela, aRegistro.ToJSON, aColuna,
              aValor, aIdentificador);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Alterar o Registro');
  end;
end;

function TDAOBase.DeletarRegistro(const aIdentificador: Integer): Boolean;
begin
  try
    Result := TUtilBanco.RemoverRegistro(FTabela, aIdentificador);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Remover Registro: ' + e.Message);
  end;
end;

function TDAOBase.ObterRegistros(aJSONArray: TJSONArray): TJSONArray;
begin
  try
    Result := aJSONArray;
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

function TDAOBase.ObterSQL(aColuna, aOrdem: string): TJSONArray;
begin
  try
    Result := TUtilBanco.ExecutarConsulta(Format('SELECT * FROM %s ORDER BY %s %s',
      [FTabela, aColuna, aOrdem]));
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

function TDAOBase.ObterSQL: TJSONArray;
begin
  try
    Result := TUtilBanco.ExecutarConsulta(Format('SELECT * FROM %s',
      [FTabela]));
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

function TDAOBase.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONArray: TJSONArray;
begin
  try
    xJSONArray := TUtilBanco.ExecutarConsulta(
                    Format('SELECT * FROM %s WHERE ID = %d',
                      [FTabela, aIdentificador]));

    if xJSONArray.Count = 0 then
    begin
      Result := TJSONObject.Create;
      xJSONArray.Free;
      Exit;
    end;

    Result := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[0].ToJSON), 0) as TJSONObject;
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

end.
