unit Backend.UController.Acao;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  Backend.UController.Base,
  Backend.UEntity.Acao;

type
  [SwagPath('acao', 'Ação')]
  TControlleAcao = class(TControllerBase)
    private
    public
      [SwagGET('Listar Ação', True)]
      [SwagResponse(200, TAcao, 'Informações da Ação', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar uma Ação')]
      [SwagParamPath('id', 'id da Ação')]
      [SwagResponse(200, TAcao, 'Informações da Ação')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Cadastrar Nova Ação')]
      [SwagParamBody('Informações da Ação', TAcao)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Excluir o Registro de uma Ação')]
      [SwagParamPath('id', 'Id da Ação')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      //PESQUISAR IMPLEMENTAÇÃO
      [SwagGET('{id}', 'Alterar o Registro de uma Ação')]
      [SwagParamPath('id', 'id da Ação')]
      [SwagParamPath('coluna', 'Coluna da tabela Ação')]
      [SwagParamPath('valor', 'Novo Valor da colunda da tabela Ação')]
      [SwagResponse(200, TAcao, 'Informações da Ação')]
      [SwagResponse(404)]
      class procedure Patch(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Alterar número de Apoios de uma Ação')]
      [SwagParamPath('id', 'id da Ação')]
      [SwagParamPath('coluna', 'Coluna da tabela Ação')]
      [SwagParamPath('valor', 'Novo Valor da colunda da tabela Ação')]
      [SwagResponse(200, TAcao, 'Informações da Ação')]
      [SwagResponse(404)]

      class procedure PatchPontuacao(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

uses
  Backend.UDAO.Intf,
  Backend.UDAO.Acao,
  System.JSON,
  System.SysUtils;
{ TControllerContribuicao }

class procedure TControlleAcao.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  inherited;

end;

class procedure TControlleAcao.Get(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  inherited;

end;

class procedure TControlleAcao.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  inherited;

end;

class procedure TControlleAcao.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  inherited;

end;

class procedure TControlleAcao.Patch(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  inherited;

end;

class procedure TControlleAcao.PatchPontuacao(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOAcao.Create;
  FColuna := 'Apoio';
  inherited;

end;

end.
