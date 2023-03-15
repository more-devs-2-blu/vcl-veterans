program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfraAcaoVoluntaria in 'model\views\UfraAcaoVoluntaria.pas' {fraAcaoVoluntaria: TFrame},
  UfraGestaoSolicitacao in 'model\views\UfraGestaoSolicitacao.pas' {fraGestaoSolicitacao: TFrame},
  UfraGestaoVoluntaria in 'model\views\UfraGestaoVoluntaria.pas' {fraGestaoSolidaria: TFrame},
  UfraListSolicitacao in 'model\views\UfraListSolicitacao.pas' {fraSolicitacao: TFrame},
  UfrnHome in 'model\views\UfrnHome.pas' {frmHome},
  UServiceMelhoria in '..\Frontend - Mobile\model\services\UServiceMelhoria.pas',
  UUtils.Enums in 'model\utils\UUtils.Enums.pas',
  UUtils.Constants in 'model\utils\UUtils.Constants.pas',
  UUtils.Functions in 'model\utils\UUtils.Functions.pas',
  UServiceIntf in '..\Frontend - Mobile\model\services\UServiceIntf.pas',
  Backend.UEntity.Acao in '..\Backend\model\entities\Backend.UEntity.Acao.pas',
  Backend.UEntity.Categoria in '..\Backend\model\entities\Backend.UEntity.Categoria.pas',
  Backend.UEntity.Cidadao in '..\Backend\model\entities\Backend.UEntity.Cidadao.pas',
  Backend.UEntity.Melhoria in '..\Backend\model\entities\Backend.UEntity.Melhoria.pas',
  Backend.UEntity.Voluntario in '..\Backend\model\entities\Backend.UEntity.Voluntario.pas',
  UServiceAcao in '..\Frontend - Mobile\model\services\UServiceAcao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
