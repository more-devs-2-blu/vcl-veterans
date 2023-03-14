unit Backend.UController.Voluntario;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  Backend.UController.Base,
  Backend.UEntity.Voluntario;

type
  [SwagPath('voluntario', 'Voluntário')]
  TControllerVoluntario = class(TControllerBase)
    private
    public
      [SwagGET('Listar Voluntários', True)]
      [SwagResponse(200, TVoluntario, 'Informações da Solicitação', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar um Voluntário')]
      [SwagParamPath('id', 'id do Voluntário')]
      [SwagResponse(200, TVoluntario, 'Informações do Voluntário')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{coluna}', 'Listar Cidadãos em ordem')]
      [SwagParamPath('coluna', 'Coluna em que se deseja aplicar a ordenação')]
      [SwagParamPath('ordem', 'Determina se o retorno deve ser feito de modo crescente ou decrescente')]
      [SwagResponse(200, TVoluntario, 'Lista de Voluntários ordenada')]
      [SwagResponse(404)]
      class procedure GetOrder(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Cadastrar Novo Voluntário')]
      [SwagParamBody('Informações do Voluntário', TVoluntario)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Excluir o Registro de um Voluntário')]
      [SwagParamPath('id', 'Id do Voluntário')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      //PESQUISAR IMPLEMENTAÇÃO
      [SwagPATCH('{id}', 'Alterar o Registro de um Voluntário')]
      [SwagParamPath('id', 'id da Melhoria')]
      [SwagParamPath('coluna', 'Coluna da tabela Voluntário')]
      [SwagParamPath('valor', 'Novo Valor da colunda da tabela Voluntário')]
      [SwagResponse(200, TVoluntario, 'Informações do Voluntário')]
      [SwagResponse(404)]
      class procedure Patch(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

 uses
  Backend.UDAO.Intf,
  Backend.UDAO.Voluntario,
  System.JSON,
  System.SysUtils;
{ TControllerContribuicao }

class procedure TControllerVoluntario.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

class procedure TControllerVoluntario.Get(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

class procedure TControllerVoluntario.GetOrder(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

class procedure TControllerVoluntario.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

class procedure TControllerVoluntario.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

class procedure TControllerVoluntario.Patch(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOVoluntario.Create;
  inherited;

end;

end.
