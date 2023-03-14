unit uFrmMelhoriasUrbanas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

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
    procedure recSolicitarMelhoriaUrbanaClick(Sender: TObject);
    procedure recApoiarMelhoriasClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMelhoriasUrbanas: TfrmMelhoriasUrbanas;

implementation

uses
  UfrmSolicitarMelhoria, UfrmApoiarMelhorias, UfrmHome;

{$R *.fmx}

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
  if not Assigned(frmApoiarMelhorias) then
    frmApoiarMelhorias := TfrmApoiarMelhorias.Create(Application);

  frmApoiarMelhorias.Show;
  Application.MainForm := frmApoiarMelhorias;
  Self.Close;
end;

procedure TfrmMelhoriasUrbanas.recSolicitarMelhoriaUrbanaClick(Sender: TObject);
begin
  if not Assigned(frmSolicitarMelhoria) then
    frmSolicitarMelhoria := TfrmSolicitarMelhoria.Create(Application);

  frmSolicitarMelhoria.Show;
  Application.MainForm := frmSolicitarMelhoria;
  Self.Close;
end;

end.
