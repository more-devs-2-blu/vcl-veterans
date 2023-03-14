program API_Zeladoria;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  Horse.GBSwagger,
  System.SysUtils,
  Backend.UUtils.Banco in 'model\utils\Backend.UUtils.Banco.pas',
  Backend.UController.Cidadao in 'model\controller\Backend.UController.Cidadao.pas',
  Backend.UController.Acao in 'model\controller\Backend.UController.Acao.pas',
  Backend.UController.Melhoria in 'model\controller\Backend.UController.Melhoria.pas',
  Backend.UController.Voluntario in 'model\controller\Backend.UController.Voluntario.pas',
  Backend.UDAO.Base in 'model\dao\Backend.UDAO.Base.pas',
  Backend.UDAO.Cidadao in 'model\dao\Backend.UDAO.Cidadao.pas',
  Backend.UDAO.Acao in 'model\dao\Backend.UDAO.Acao.pas',
  Backend.UDAO.Intf in 'model\dao\Backend.UDAO.Intf.pas',
  Backend.UDAO.Melhoria in 'model\dao\Backend.UDAO.Melhoria.pas',
  Backend.UDAO.Voluntario in 'model\dao\Backend.UDAO.Voluntario.pas',
  Backend.UEntity.Categoria in 'model\entities\Backend.UEntity.Categoria.pas',
  Backend.UEntity.Cidadao in 'model\entities\Backend.UEntity.Cidadao.pas',
  Backend.UEntity.Acao in 'model\entities\Backend.UEntity.Acao.pas',
  Backend.UEntity.Melhoria in 'model\entities\Backend.UEntity.Melhoria.pas',
  Backend.UEntity.Voluntario in 'model\entities\Backend.UEntity.Voluntario.pas',
  Backend.UController.Base in 'model\controller\Backend.UController.Base.pas',
  Backend.UDAO.Categoria in 'model\dao\Backend.UDAO.Categoria.pas';

procedure Registry;
begin

  //Cidadaos
  THorse.Group.Prefix('v1')
    .Get('/cidadao', TControllerCidadao.Gets)
    .Get('/cidadao/:id', TControllerCidadao.Get)
    .Get('/cidadao/:coluna/:ordem', TControllerCidadao.GetOrder)
    .Post('/cidadao', TControllerCidadao.Post)
    .Delete('/cidadao/:id', TControllerCidadao.Delete)
    .Patch('/cidadao/:id/:coluna/:valor', TControllerCidadao.Patch)
    .Put('/cidadao/:id/:valor', TControllerCidadao.PatchPontuacao);

  //Ação Voluntária
  THorse.Group.Prefix('v1')
    .Get('/acao', TControlleAcao.Gets)
    .Get('/acao/:id', TControlleAcao.Get)
    .Post('/acao', TControlleAcao.Post)
    .Delete('/acao/:id', TControlleAcao.Delete)
    .Patch('/acao/:id/:coluna/:valor', TControlleAcao.Patch)
    .Put('/acao/:id/:valor', TControllerCidadao.PatchPontuacao);

  //Melhoria
  THorse.Group.Prefix('v1')
    .Get('/melhoria', TControllerMelhoria.Gets)
    .Get('/melhoria/:id', TControllerMelhoria.Get)
    .Post('/melhoria', TControllerMelhoria.Post)
    .Delete('/melhoria/:id', TControllerMelhoria.Delete)
    .Patch('/melhoria/:id/:coluna/:valor', TControllerMelhoria.Patch)
    .Put('/melhoria/:id/:valor', TControllerCidadao.PatchPontuacao);

  //Voluntário
  THorse.Group.Prefix('v1')
    .Get('/voluntario', TControllerVoluntario.Gets)
    .Get('/voluntario/:id', TControllerVoluntario.Get)
    .Post('/voluntario', TControllerVoluntario.Post)
    .Delete('/voluntario/:id', TControllerVoluntario.Delete)
    .Patch('/voluntario/:id/:coluna/:valor', TControllerVoluntario.Patch);

end;

procedure SwaggerConfig;
begin
  THorseGBSwaggerRegister.RegisterPath(TControllerCidadao);
  THorseGBSwaggerRegister.RegisterPath(TControlleAcao);
  THorseGBSwaggerRegister.RegisterPath(TControllerMelhoria);
  THorseGBSwaggerRegister.RegisterPath(TControllerVoluntario);

  //http://localhost:9090/swagger/doc/html
  Swagger
    .Info
      .Title('Documentação API Eu Ajudo')
      .Description('Eu Ajudo - Cuidando da nossa cidade')
      .Contact
        .Name('VCL Veterans')
        .Email('email@vclveterans.com')
        .URL('http://www.vclveterans.com.br')
      .&End
    .&End
    .BasePath('v1');
end;

procedure ConfigMiddleware;
begin
  THorse
    .Use(Cors)
    .Use(HorseSwagger)
    .Use(Jhonson());
end;

begin
  ConfigMiddleware;
  SwaggerConfig;
  Registry;
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9090);
end.