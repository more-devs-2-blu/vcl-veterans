program SinergiaCidada;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmAcaoVoluntaria in 'model\views\UfrmAcaoVoluntaria.pas' {frmAcaoVoluntaria},
  UfrmApoiarMelhorias in 'model\views\UfrmApoiarMelhorias.pas' {frmApoiarMelhorias},
  UfrmHome in 'model\views\UfrmHome.pas' {frmHome},
  UfrmListaAcoesVoluntarias in 'model\views\UfrmListaAcoesVoluntarias.pas' {frmListaAcoesVoluntarias},
  uFrmMelhoriasUrbanas in 'model\views\uFrmMelhoriasUrbanas.pas' {frmMelhoriasUrbanas},
  UfrmMinhasAcoes in 'model\views\UfrmMinhasAcoes.pas' {frmMinhaAcoes},
  UfrmMinhasMelhorias in 'model\views\UfrmMinhasMelhorias.pas' {frmMinhasMelhorias},
  UfrmSolicitarAcaoVoluntaria in 'model\views\UfrmSolicitarAcaoVoluntaria.pas' {frmSolicitarAcaoVoluntaria},
  UfrmSolicitarMelhoria in 'model\views\UfrmSolicitarMelhoria.pas' {frmSolicitarMelhoria},
  UfrmSplash in 'model\views\UfrmSplash.pas' {frmSplash},
  UServiceMelhoria in 'model\services\UServiceMelhoria.pas',
  UServiceIntf in 'model\services\UServiceIntf.pas',
  Backend.UEntity.Acao in '..\Backend\model\entities\Backend.UEntity.Acao.pas',
  Backend.UEntity.Categoria in '..\Backend\model\entities\Backend.UEntity.Categoria.pas',
  Backend.UEntity.Cidadao in '..\Backend\model\entities\Backend.UEntity.Cidadao.pas',
  Backend.UEntity.Melhoria in '..\Backend\model\entities\Backend.UEntity.Melhoria.pas',
  Backend.UEntity.Voluntario in '..\Backend\model\entities\Backend.UEntity.Voluntario.pas',
  UfrmRanking in 'model\views\UfrmRanking.pas' {frmRanking},
  UServiceCidadao in 'model\services\UServiceCidadao.pas',
  UUtils.Constants in 'model\utils\UUtils.Constants.pas',
  UUtils.Functions in 'model\utils\UUtils.Functions.pas',
  UServiceAcao in 'model\services\UServiceAcao.pas',
  UUtils.AnimacaoClick in 'model\utils\UUtils.AnimacaoClick.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
