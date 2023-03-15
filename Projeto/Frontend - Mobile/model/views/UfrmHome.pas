unit UfrmHome;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects,
  backend.UEntity.Cidadao, FMX.Ani, UUtils.AnimacaoClick;
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
    posicao1: TLabel;
    posicao2: TLabel;
    posicao3: TLabel;
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
    ShadowEffect3: TShadowEffect;
    procedure recMelhoriaUrbanaClick(Sender: TObject);
    procedure recAcoesVoluntariaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure recRankingClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure recNoticiasClick(Sender: TObject);
  private
    FEventoBotao: TEventoBotao;
    procedure CarregarRanking;
  public
    { Public declarations }
  end;
var
  frmHome: TfrmHome;
implementation
uses
  uFrmMelhoriasUrbanas,
  UfrmAcaoVoluntaria,
  UServiceIntf,
  UServiceCidadao, UfrmRanking;

{$R *.fmx}
procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FEventoBotao);
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  Self.CarregarRanking;
  FEventoBotao := TEventoBotao.Create;
end;

procedure TfrmHome.recAcoesVoluntariaClick(Sender: TObject);
begin
    FEventoBotao.EventoBotao(recAcoesVoluntaria);

  if not Assigned(frmAcaoVoluntaria) then
    frmAcaoVoluntaria := TfrmAcaoVoluntaria.Create(Application);
  frmAcaoVoluntaria.Show;
  Application.MainForm := frmAcaoVoluntaria;
  Self.Close;
end;

procedure TfrmHome.recMelhoriaUrbanaClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recMelhoriaUrbana);

  if not Assigned(frmMelhoriasUrbanas) then
    frmMelhoriasUrbanas := TfrmMelhoriasUrbanas.Create(Application);

  frmMelhoriasUrbanas.Show;
  Application.MainForm := frmMelhoriasUrbanas;
  Self.Close;
end;

procedure TfrmHome.recNoticiasClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recNoticias);
end;

procedure TfrmHome.recRankingClick(Sender: TObject);
begin
  FEventoBotao.EventoBotao(recRanking);

  if not Assigned(frmRanking) then
    frmRanking := TfrmRanking.Create(Application);

  frmRanking.Show;
  Application.MainForm := frmRanking;
  Self.Close;
end;

procedure TfrmHome.CarregarRanking;
var
  xServiceCidadao: IService;
  xCidadao: TCidadao;
  xPosicao: Integer;
  xLabel : TLabel;
begin
    xPosicao := 1;
    xServiceCidadao := TServiceCidadao.Create;
    xServiceCidadao.Listar;
    for xCidadao in TServiceCidadao(xServiceCidadao).Cidadaos do
    begin
      xLabel := TLabel(FindComponent('posicao'+xPosicao.ToString));
      xLabel.Text := '#' +xPosicao.ToString + 'º - ' + xCidadao.Nome;
      Inc(xPosicao);

      if xPosicao = 4 then
        break;
    end;
end;

end.
