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
    imgApoioOn: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Apoiar(Sender: TObject);
    procedure lstMelhoriasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRegistros;
    procedure PrepararListView(aMelhoria: TMelhoria);
    function ObterItemSelecionado: Integer;
    procedure AdicionarApoio;
  public
    { Public declarations }
  end;

var
  frmApoiarMelhorias: TfrmApoiarMelhorias;

implementation

{$R *.fmx}

procedure TfrmApoiarMelhorias.AdicionarApoio;
const
  APOIO_RECEBIDO = '1';
var
  xServiceMelhoria: TServiceMelhoria;
begin
  xServiceMelhoria := TServiceMelhoria.Create(
    TMelhoria.Create(ObterItemSelecionado));

  xServiceMelhoria.AlterarPontuacao(APOIO_RECEBIDO);
end;

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

procedure TfrmApoiarMelhorias.lstMelhoriasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
  xItem: TListViewItem;
begin

  if (not(itemObject = nil)) and (ItemObject.Name = 'imgApoiar') and (ItemObject.TagFloat = 0) then
    begin
      AdicionarApoio;
      xItem  := lstMelhorias.Items[lstMelhorias.ItemIndex];
      TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoioOn.Bitmap;
      TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text :=
            FloatToStr(StrToFloat(TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text) + 1 );
      ShowMessage('Melhoria Apoiada');
      ItemObject.TagFloat := 1;
    end;
//  else if (not(itemObject = nil)) and (ItemObject.Name = 'imgApoiar') and (ItemObject.TagFloat = 1) then
//    ItemObject.TagFloat := 0;
end;

function TfrmApoiarMelhorias.ObterItemSelecionado: Integer;
begin
  if lstMelhorias.ItemIndex <> -1 then
  begin
    Result := lstMelhorias.Items[lstMelhorias.ItemIndex].Tag;
  end;
end;

procedure TfrmApoiarMelhorias.CarregarRegistros;
var
  xServiceMelhorias: IService;
  xMelhoria: TMelhoria;
begin
  lstMelhorias.Items.Clear;

  xServiceMelhorias := TServiceMelhoria.Create;
  xServiceMelhorias.Listar;

  for xMelhoria in TServiceMelhoria(xServiceMelhorias).Melhorias do
  begin
    Self.PrepararListView(xMelhoria)
  end;

end;

procedure TfrmApoiarMelhorias.FormCreate(Sender: TObject);
begin
  Self.CarregarRegistros;
end;

procedure TfrmApoiarMelhorias.PrepararListView(aMelhoria: TMelhoria);
var
  xItem: TListViewItem;
begin
  xItem := lstMelhorias.Items.Add;
  xItem.Tag := aMelhoria.Id;

  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '';
  TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := aMelhoria.Categoria.Nome;
  TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := aMelhoria.Endereco;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := aMelhoria.Descricao;
  TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := FloatToStr(aMelhoria.Apoio);
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := aMelhoria.Status;
  TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := aMelhoria.Cidadao.Nome;
end;

end.
