unit UfrmAcaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmAcaoVoluntaria = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytAcoesVoluntarias: TLayout;
    lblAcoesVoluntarias: TLabel;
    FlowLayout1: TFlowLayout;
    recCriarAcaoVoluntaria: TRectangle;
    imgCriarAcaoVoluntaria: TImage;
    recDescricaoAcaoVoluntaria: TRectangle;
    lblCriarAcaoVoluntaria: TLabel;
    lytPonto: TLayout;
    lblPontos3: TLabel;
    lytNoticia: TLayout;
    recNoticia: TRectangle;
    lytImg: TLayout;
    imgNoticia: TImage;
    lytMateria: TLayout;
    lblMateria: TLabel;
    lytVejaCompleto: TLayout;
    lblVejaCompleto: TLabel;
    ShadowEffect2: TShadowEffect;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    recInscrevaseAcoes: TRectangle;
    imgInscreverseAcoes: TImage;
    recDescInscrevase: TRectangle;
    lblDescInscrevase: TLabel;
    lyt2Pontos: TLayout;
    lbl2Pontos: TLabel;
    recMinhasAcoes: TRectangle;
    imgMinhasAcoes: TImage;
    recDescMinhasAcoes: TRectangle;
    lblDescMinhasAcoes: TLabel;
    procedure recCriarAcaoVoluntariaClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcaoVoluntaria: TfrmAcaoVoluntaria;

implementation

uses
  UfrmSolicitarAcaoVoluntaria, UfrmHome;

{$R *.fmx}

procedure TfrmAcaoVoluntaria.imgVoltarClick(Sender: TObject);
begin
  if not Assigned(frmHome) then
    frmHome := TfrmHome.Create(Application);

  frmHome.Show;
  Application.MainForm := frmHome;
  Self.Close;
end;

procedure TfrmAcaoVoluntaria.recCriarAcaoVoluntariaClick(Sender: TObject);
begin
  if not Assigned(frmSolicitarAcaoVoluntaria) then
    frmSolicitarAcaoVoluntaria := TfrmSolicitarAcaoVoluntaria.Create(Application);

  frmSolicitarAcaoVoluntaria.Show;
  Application.MainForm := frmSolicitarAcaoVoluntaria;
  Self.Close;
end;

end.
