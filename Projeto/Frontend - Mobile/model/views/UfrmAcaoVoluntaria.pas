unit UfrmAcaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  UUtils.AnimacaoClick;

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
    ShadowEffect1: TShadowEffect;
    procedure recCriarAcaoVoluntariaClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure recInscrevaseAcoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure recMinhasAcoesClick(Sender: TObject);
    procedure recNoticiaClick(Sender: TObject);
  private
    FEventoBotao: TEventoBotao;
  public
    { Public declarations }
  end;

var
  frmAcaoVoluntaria: TfrmAcaoVoluntaria;

implementation

uses
  UfrmSolicitarAcaoVoluntaria, UfrmHome, UfrmListaAcoesVoluntarias;

{$R *.fmx}

procedure TfrmAcaoVoluntaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FEventoBotao);
end;

procedure TfrmAcaoVoluntaria.FormCreate(Sender: TObject);
begin
  FEventoBotao := TEventoBotao.Create;
end;

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
  FEventoBotao.EventoBotao(recCriarAcaoVoluntaria);
  if not Assigned(frmSolicitarAcaoVoluntaria) then
    frmSolicitarAcaoVoluntaria := TfrmSolicitarAcaoVoluntaria.Create(Application);

  frmSolicitarAcaoVoluntaria.Show;
  Application.MainForm := frmSolicitarAcaoVoluntaria;
  Self.Close;
end;

procedure TfrmAcaoVoluntaria.recInscrevaseAcoesClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recInscrevaseAcoes);
  if not Assigned(frmListaAcoesVoluntarias) then
    frmListaAcoesVoluntarias := TfrmListaAcoesVoluntarias.Create(Application);

  frmListaAcoesVoluntarias.Show;
  Application.MainForm := frmListaAcoesVoluntarias;
  Self.Close;
end;

procedure TfrmAcaoVoluntaria.recMinhasAcoesClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recMinhasAcoes);
end;

procedure TfrmAcaoVoluntaria.recNoticiaClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recNoticia);
end;

end.
