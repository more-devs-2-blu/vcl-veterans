unit uFrmMelhoriasUrbanas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  UUtils.AnimacaoClick;

type
  TfrmMelhoriasUrbanas = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytMelhoriasUrbanas: TLayout;
    lblMelhoriasUrbanas: TLabel;
    FlowLayout1: TFlowLayout;
    recSolicitarMelhoriaUrbana: TRectangle;
    imgMelhoriasUrbanas: TImage;
    rect_descricao: TRectangle;
    lblSolicitarMelhorias: TLabel;
    recApoiarMelhorias: TRectangle;
    imgApoiarMelhorias: TImage;
    recApoiarMelhoria: TRectangle;
    lblApoiarMelhorias: TLabel;
    lytNoticia: TLayout;
    recNoticia: TRectangle;
    lytImg: TLayout;
    lytMateria: TLayout;
    lblMateria: TLabel;
    lytVejaCompleto: TLayout;
    lblVejaCompleto: TLabel;
    ShadowEffect2: TShadowEffect;
    recMinhasMelhorias: TRectangle;
    imgMinhasMelhorias: TImage;
    recMinhasMelhoria: TRectangle;
    lblMinhasMelhorias: TLabel;
    imgNoticia: TImage;
    lblPontos: TLabel;
    Layout1: TLayout;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    ShadowEffect1: TShadowEffect;
    procedure recSolicitarMelhoriaUrbanaClick(Sender: TObject);
    procedure recApoiarMelhoriasClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure recMinhasMelhoriasClick(Sender: TObject);
    procedure recNoticiaClick(Sender: TObject);
  private
    FEventoBotao: TEventoBotao;
  public
    { Public declarations }
  end;

var
  frmMelhoriasUrbanas: TfrmMelhoriasUrbanas;

implementation

uses
  UfrmSolicitarMelhoria, UfrmApoiarMelhorias, UfrmHome, UfrmMinhasMelhorias;

{$R *.fmx}

procedure TfrmMelhoriasUrbanas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FEventoBotao);
end;

procedure TfrmMelhoriasUrbanas.FormCreate(Sender: TObject);
begin
  FEventoBotao := TEventoBotao.Create;
end;

procedure TfrmMelhoriasUrbanas.imgVoltarClick(Sender: TObject);
begin
  if not Assigned(frmHome) then
    frmHome := TfrmHome.Create(Application);

  frmHome.Show;
  Application.MainForm := frmHome;
  Self.Close;
end;

procedure TfrmMelhoriasUrbanas.recApoiarMelhoriasClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recApoiarMelhorias);

  if not Assigned(frmApoiarMelhorias) then
    frmApoiarMelhorias := TfrmApoiarMelhorias.Create(Application);

  frmApoiarMelhorias.Show;
  Application.MainForm := frmApoiarMelhorias;
  Self.Close;
end;

procedure TfrmMelhoriasUrbanas.recMinhasMelhoriasClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recMinhasMelhorias);

  if not Assigned(frmMinhasMelhorias) then
    frmMinhasMelhorias := TfrmMinhasMelhorias.Create(Application);

  frmMinhasMelhorias.Show;
  Application.MainForm := frmMinhasMelhorias;
  Self.Close;
end;

procedure TfrmMelhoriasUrbanas.recNoticiaClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recNoticia);
end;

procedure TfrmMelhoriasUrbanas.recSolicitarMelhoriaUrbanaClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recSolicitarMelhoriaUrbana);

  if not Assigned(frmSolicitarMelhoria) then
    frmSolicitarMelhoria := TfrmSolicitarMelhoria.Create(Application);

  frmSolicitarMelhoria.Show;
  Application.MainForm := frmSolicitarMelhoria;
  Self.Close;
end;

end.
