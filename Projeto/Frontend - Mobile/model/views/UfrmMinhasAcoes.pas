unit UfrmMinhasAcoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.Layouts, FMX.Controls.Presentation,
  FMX.Objects;

type
  TfrmMinhaAcoes = class(TForm)
    imgApoiarMelhorias: TImage;
    imgExemplo: TImage;
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    lytApoirMelhoria: TLayout;
    lblMinhasAcoes: TLabel;
    lytPrincipal: TLayout;
    lstAcoesVoluntarias: TListView;
    Button1: TButton;
    lytMensagem: TLayout;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMinhaAcoes: TfrmMinhaAcoes;

implementation

{$R *.fmx}

procedure TfrmMinhaAcoes.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  xItem := lstAcoesVoluntarias.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
  TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := imgExemplo.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := 'Limpeza';
  TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := 'Rua Dr. Henrique Hacker,500';
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Buraco na rua blablabla blablabla blablabla blablabla';
  TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := '135';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := 'Status: Concluído';
  TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := 'João Silva';
end;

end.
