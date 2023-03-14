program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfraListSolicitacao in 'views\UfraListSolicitacao.pas' {fraSolicitacao: TFrame},
  UfrnHome in 'views\UfrnHome.pas' {frmHome},
  UfraAcaoVoluntaria in 'views\UfraAcaoVoluntaria.pas' {fraAcaoVoluntaria: TFrame},
  UfraGestaoSolicitacao in 'views\UfraGestaoSolicitacao.pas' {fraGestaoSolicitacao: TFrame},
  UfraGestaoVoluntaria in 'views\UfraGestaoVoluntaria.pas' {frmGestaoSolidaria: TFrame},
  UUtils.Enums in 'utils\UUtils.Enums.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
