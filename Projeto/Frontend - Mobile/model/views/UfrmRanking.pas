unit UfrmRanking;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

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
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRanking: TfrmRanking;

implementation

{$R *.fmx}

procedure TfrmRanking.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  xItem := lstRanking.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtCidadao')).Text := 'Nathan';
  TListItemImage(xItem.Objects.FindDrawable('imgCidadao')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
  TListItemText(xItem.Objects.FindDrawable('txtDescPontos')).Text := 'Pontuação: ';
  TListItemText(xItem.Objects.FindDrawable('txtPontos')).Text := '17';
end;
end.
