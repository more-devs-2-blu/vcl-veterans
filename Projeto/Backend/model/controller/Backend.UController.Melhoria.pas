unit Backend.UController.Melhoria;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  Backend.UController.Base,
  Backend.UEntity.Melhoria;

type
  [SwagPath('melhoria', 'Melhoria')]
  TControllerMelhoria = class(TControllerBase)
    private
    public
      [SwagGET('Listar Melhoria', True)]
      [SwagResponse(200, TMelhoria, 'Informações da Melhoria', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar uma Melhoria')]
      [SwagParamPath('id', 'id da Melhoria')]
      [SwagResponse(200, TMelhoria, 'Informações da Melhoria')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{coluna}', 'Listar Cidadãos em ordem')]
      [SwagParamPath('coluna', 'Coluna em que se deseja aplicar a ordenação')]
      [SwagParamPath('ordem', 'Determina se o retorno deve ser feito de modo crescente ou decrescente')]
      [SwagResponse(200, TMelhoria, 'Lista de Melhorias ordenada')]
      [SwagResponse(404)]
      class procedure GetOrder(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Cadastrar Nova Melhoria')]
      [SwagParamBody('Informações da Melhoria', TMelhoria)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Excluir o Registro de uma Melhoria')]
      [SwagParamPath('id', 'Id da Solicitação')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      //PESQUISAR IMPLEMENTAÇÃO
      [SwagPATCH('{id}', 'Alterar o Registro de uma Melhoria')]
      [SwagParamPath('id', 'id da Melhoria')]
      [SwagParamPath('coluna', 'Coluna da tabela Melhoria')]
      [SwagParamPath('valor', 'Novo Valor da coluna da tabela Melhoria')]
      [SwagResponse(200, TMelhoria, 'Informações da Melhoria')]
      [SwagResponse(404)]
      class procedure Patch(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;


      [SwagPUT('{id}', 'Alterar número de Apoios de uma Melhoria')]
      [SwagParamPath('id', 'id da Ação')]
      [SwagParamPath('coluna', 'Coluna da tabela Ação')]
      [SwagParamPath('valor', 'Valor a ser adicionado ao campo Apoio na tabela Melhoria')]
      [SwagResponse(200, TMelhoria, 'Informações da Ação')]
      [SwagResponse(404)]
      class procedure PatchPontuacao(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

  end;

implementation

uses
  Backend.UDAO.Intf,
  Backend.UDAO.Melhoria,
  System.JSON,
  System.SysUtils;
{ TControllerContribuicao }

class procedure TControllerMelhoria.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;

end;

class procedure TControllerMelhoria.Get(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;
end;

class procedure TControllerMelhoria.GetOrder(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;

end;

class procedure TControllerMelhoria.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;

end;

class procedure TControllerMelhoria.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;

end;

class procedure TControllerMelhoria.Patch(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  inherited;

end;

class procedure TControllerMelhoria.PatchPontuacao(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOMelhoria.Create;
  FColuna := 'Apoio';
  inherited;
end;

end.
