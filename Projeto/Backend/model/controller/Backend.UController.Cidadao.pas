unit Backend.UController.Cidadao;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  Backend.UController.Base,
  Backend.UEntity.Cidadao;

type
  [SwagPath('cidadao', 'Cidadão')]
  TControllerCidadao = class(TControllerBase)
    private
    public
      [SwagGET('Listar Cidadãos', True)]
      [SwagResponse(200, TCidadao, 'Informações do Cidadão', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar um Cidadão')]
      [SwagParamPath('id', 'id do Cidadão')]
      [SwagResponse(200, TCidadao, 'Informações do Cidadão')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{coluna}', 'Listar Cidadãos em ordem')]
      [SwagParamPath('coluna', 'Coluna em que se deseja aplicar a ordenação')]
      [SwagParamPath('ordem', 'Determina se o retorno deve ser feito de modo crescente ou decrescente')]
      [SwagResponse(200, TCidadao, 'Lista de Cidadãos ordenada')]
      [SwagResponse(404)]
      class procedure GetOrder(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Cadastrar Novo Cidadão')]
      [SwagParamBody('Informações do Cidadao', TCidadao)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Excluir o Registro de um Cidadão')]
      [SwagParamPath('id', 'Id do Cidadão')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPATCH('{id}', 'Alterar o Registro de um Cidadão')]
      [SwagParamPath('id', 'id do Cidadão')]
      [SwagParamPath('coluna', 'Coluna da tabela Cidadão')]
      [SwagParamPath('valor', 'Novo Valor da coluna da tabela Cidadão')]
      [SwagResponse(200, TCidadao, 'Informações do Cidadão')]
      [SwagResponse(404)]
      class procedure Patch(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPUT('{id}', 'Alterar número de Pontos de um Cidadão')]
      [SwagParamPath('id', 'id do Cidadão')]
      [SwagParamPath('valor', 'Valor a ser adicionado ao campo Pontos na tabela Cidadão')]
      [SwagResponse(200, TCidadao, 'Informações do Cidadão')]
      [SwagResponse(404)]
      class procedure PatchPontuacao(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;


implementation

uses
  Backend.UDAO.Intf,
  Backend.UDAO.Cidadao,
  System.JSON,
  System.SysUtils;

{ TControllerCidadao }

class procedure TControllerCidadao.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;
end;

class procedure TControllerCidadao.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;

end;

class procedure TControllerCidadao.GetOrder(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;

end;

class procedure TControllerCidadao.Gets(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;

end;

class procedure TControllerCidadao.Post(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;

end;

class procedure TControllerCidadao.Patch(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  inherited;

end;

class procedure TControllerCidadao.PatchPontuacao(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOCidadao.Create;
  FColuna := 'pontos';
  inherited;
end;

end.
