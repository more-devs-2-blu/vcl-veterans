unit UfrmRanking;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Backend.UEntity.Cidadao;
type
  TfrmRanking = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    lytRanking: TLayout;
    lblRanking: TLabel;
    lytPessoas: TLayout;
    lstRanking: TListView;
    imgTeste: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblRankingClick(Sender: TObject);
  private
    { Private declarations }
    FPosicao : Integer;

    procedure CarregarRegistros;
    procedure PrepararListView(aCidadao : TCidadao);
  public
    { Public declarations }
  end;

var
  frmRanking: TfrmRanking;
implementation
uses
  UserviceIntf,
  UserviceCidadao;
{$R *.fmx}
procedure TfrmRanking.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  {xItem := lstRanking.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtCidadao')).Text := 'Nathan';
  TListItemImage(xItem.Objects.FindDrawable('imgCidadao')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
  TListItemText(xItem.Objects.FindDrawable('txtDescPontos')).Text := 'Pontuação: ';
  TListItemText(xItem.Objects.FindDrawable('txtPontos')).Text := '17';}
end;
{Carregar Registros}
procedure TfrmRanking.CarregarRegistros;
var
  xServiceCidadao: IService;
  xCidadao: TCidadao;
begin
  FPosicao := 1;
  lstRanking.Items.Clear;
  xServiceCidadao := TServiceCidadao.Create;
  xServiceCidadao.Listar;
  for xCidadao in TServiceCidadao(xServiceCidadao).Cidadaos do
  begin
    Self.PrepararListView(xCidadao);
    Inc(FPosicao);
  end;
end;

procedure TfrmRanking.FormCreate(Sender: TObject);
begin
  Self.CarregarRegistros;
end;


{Preparar ListView}
procedure TfrmRanking.PrepararListView(aCidadao : TCidadao);
var
  xItem: TListViewItem;
  xPos : Integer;
begin
  xItem := lstRanking.Items.Add;
  xItem.Tag := aCidadao.Id;
  TListItemText(xItem.Objects.FindDrawable('txtCidadao')).Text := aCidadao.Nome;
  TListItemImage(xItem.Objects.FindDrawable('imgCidadao')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#' + FPosicao.ToString;
  TListItemText(xItem.Objects.FindDrawable('txtDescPontos')).Text := 'Pontuação: ';
  TListItemText(xItem.Objects.FindDrawable('txtPontos')).Text := aCidadao.Pontos.ToString;

end;

end.
