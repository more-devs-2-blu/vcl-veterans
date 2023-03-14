unit UfrmApoiarMelhorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  UServiceIntf, UServiceMelhoria, Backend.UEntity.Melhoria;

type
  TfrmApoiarMelhorias = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    lytApoirMelhoria: TLayout;
    lblApoiarMelhoria: TLabel;
    lytPrincipal: TLayout;
    lstMelhorias: TListView;
    Button1: TButton;
    imgTeste: TImage;
    imgApoiarMelhorias: TImage;
    lytMensagem: TLayout;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Apoiar(Sender: TObject);
    procedure lstMelhoriasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure PreencherMelhorias;

  public
    { Public declarations }
  end;

var
  frmApoiarMelhorias: TfrmApoiarMelhorias;

implementation

{$R *.fmx}

procedure TfrmApoiarMelhorias.Apoiar(Sender: TObject);
begin
  //ShowMessage('Teste');
end;

procedure TfrmApoiarMelhorias.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  xItem := lstMelhorias.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
  TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := 'Limpeza';
  TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := 'Rua Dr. Henrique Hacker,500';
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Buraco na rua blablabla blablabla blablabla blablabla';
  TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := '135';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := 'Status: Solicitado';
  TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := 'João Silva';
  //TListItemGlyphButton(xItem.Objects.FindDrawable('Button')).Click := Self.Apoiar;
end;

procedure TfrmApoiarMelhorias.Button2Click(Sender: TObject);
begin
  Self.PreencherMelhorias;
end;

procedure TfrmApoiarMelhorias.lstMelhoriasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if (not(itemObject = nil)) and (ItemObject.Name = 'imgApoiar') and (ItemObject.TagFloat = 0) then
    begin
      ShowMessage('Teste');
      ItemObject.TagFloat := 1;
    end
  else if (not(itemObject = nil)) and (ItemObject.Name = 'imgApoiar') and (ItemObject.TagFloat = 1) then
    ItemObject.TagFloat := 0;
end;

procedure TfrmApoiarMelhorias.PreencherMelhorias;
var
  xServiceMelhorias: IService;
  xMelhoria: TMelhoria;
  xItem: TListViewItem;
begin
  xServiceMelhorias := TServiceMelhoria.Create;
  xServiceMelhorias.Listar;

  for xMelhoria in TServiceMelhoria(xMelhoria).Melhorias do
  begin
    xItem := lstMelhorias.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
    TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := imgTeste.Bitmap;
    TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := xMelhoria.Categoria.Nome;
    TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
    TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := xMelhoria.Endereco;
    TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := xMelhoria.Descricao;
    TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := FloatToStr(xMelhoria.Apoio);
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := xMelhoria.Status;
    TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := 'João Silva';
  end;

end;

end.
