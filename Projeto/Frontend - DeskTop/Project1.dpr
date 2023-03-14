program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UService.Base in 'model\service\UService.Base.pas',
  UService.Cidadao in 'model\service\UService.Cidadao.pas',
  UService.Intf in 'model\service\UService.Intf.pas',
  UUtils.Enums in 'model\utils\UUtils.Enums.pas',
  UfraAcaoVoluntaria in 'model\views\UfraAcaoVoluntaria.pas' {fraAcaoVoluntaria: TFrame},
  UfraGestaoSolicitacao in 'model\views\UfraGestaoSolicitacao.pas' {fraGestaoSolicitacao: TFrame},
  UfraGestaoVoluntaria in 'model\views\UfraGestaoVoluntaria.pas' {frmGestaoSolidaria: TFrame},
  UfraListSolicitacao in 'model\views\UfraListSolicitacao.pas' {fraSolicitacao: TFrame},
  UfrnHome in 'model\views\UfrnHome.pas' {frmHome};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
