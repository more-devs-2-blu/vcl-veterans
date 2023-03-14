unit UfrmHome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects;

type
  TfrmHome = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytPerfil: TLayout;
    imgPerfil: TImage;
    lytNome: TLayout;
    lblNome: TLabel;
    lblOla: TLabel;
    FlowLayout1: TFlowLayout;
    recMelhoriaUrbana: TRectangle;
    imgMelhoriasUrbanas: TImage;
    rect_descricao: TRectangle;
    lblMelhoriasUrbanas: TLabel;
    recAcoesVoluntaria: TRectangle;
    imgAcoesVoluntarias: TImage;
    recAcoesVoluntarias: TRectangle;
    lblAcaoSolidaria: TLabel;
    lytRanking: TLayout;
    recRanking: TRectangle;
    lytImg: TLayout;
    imgRanking: TImage;
    lytTOP3: TLayout;
    lblPrimeiro: TLabel;
    lblSegundo: TLabel;
    lblTerceiro: TLabel;
    lytVejaRanking: TLayout;
    lblVerRanking: TLabel;
    ShadowEffect2: TShadowEffect;
    lytNoticia: TLayout;
    recNoticias: TRectangle;
    lytNoticias: TLayout;
    imgNoticias: TImage;
    lytVerNoticias: TLayout;
    lblVerNoticias: TLabel;
    ShadowEffect1: TShadowEffect;
    procedure recMelhoriaUrbanaClick(Sender: TObject);
    procedure recAcoesVoluntariaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

uses
  uFrmMelhoriasUrbanas, UfrmAcaoVoluntaria;

{$R *.fmx}

procedure TfrmHome.recAcoesVoluntariaClick(Sender: TObject);
begin
  if not Assigned(frmAcaoVoluntaria) then
    frmAcaoVoluntaria := TfrmAcaoVoluntaria.Create(Application);

  frmAcaoVoluntaria.Show;
  Application.MainForm := frmAcaoVoluntaria;
  Self.Close;
end;

procedure TfrmHome.recMelhoriaUrbanaClick(Sender: TObject);
begin
  if not Assigned(frmMelhoriasUrbanas) then
    frmMelhoriasUrbanas := TfrmMelhoriasUrbanas.Create(Application);

  frmMelhoriasUrbanas.Show;
  Application.MainForm := frmMelhoriasUrbanas;
  Self.Close;
end;

end.
