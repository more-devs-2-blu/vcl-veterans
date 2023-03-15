unit UfrmMinhasMelhorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.Objects, FMX.Layouts,
  FMX.Controls.Presentation, Backend.UEntity.Melhoria, Backend.UEntity.Categoria;

type
  TfrmMinhasMelhorias = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    lytApoirMelhoria: TLayout;
    lblMinhasMelhorias: TLabel;
    lytPrincipal: TLayout;
    Button1: TButton;
    imgApoiarMelhorias: TImage;
    imgTeste: TImage;
    lstMinhasMelhorias: TListView;
    imgCatIlumicacao: TImage;
    imgCatLixo: TImage;
    imgCatPavimento: TImage;
    imgCatSemImagem: TImage;
    imgCatSinalizacao: TImage;
    imgCatVegetacao: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRegistros;
    procedure PrepararListView(aMelhoria: TMelhoria);
    function CarregarImagemCategoria(aCategoria: TCategoria): TImage;
  public
    { Public declarations }
  end;

var
  frmMinhasMelhorias: TfrmMinhasMelhorias;

implementation

{$R *.fmx}

uses StrUtils,UServiceIntf, UServiceMelhoria, UUtils.Constants,
  uFrmMelhoriasUrbanas;

procedure TfrmMinhasMelhorias.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  xItem := lstMinhasMelhorias.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '#1';
  TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := imgTeste.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := 'Limpeza';
  TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
  TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := 'Rua Dr. Henrique Hacker,500';
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Buraco na rua blablabla blablabla blablabla blablabla';
  TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := '135';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := 'Status: Concluído';
  TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := 'João Silva';

end;

procedure TfrmMinhasMelhorias.CarregarRegistros;
var
  xServiceMelhorias: IService;
  xMelhoria: TMelhoria;
begin
  lstMinhasMelhorias.Items.Clear;

  xServiceMelhorias := TServiceMelhoria.Create;
  xServiceMelhorias.Listar;

  for xMelhoria in TServiceMelhoria(xServiceMelhorias).Melhorias do
  begin
    Self.PrepararListView(xMelhoria)
  end;
end;

procedure TfrmMinhasMelhorias.FormCreate(Sender: TObject);
begin
  Self.CarregarRegistros;
end;

procedure TfrmMinhasMelhorias.imgVoltarClick(Sender: TObject);
begin
  if not Assigned(frmMelhoriasUrbanas) then
    frmMelhoriasUrbanas := TfrmMelhoriasUrbanas.Create(Application);

  frmMelhoriasUrbanas.Show;
  Application.MainForm := frmMelhoriasUrbanas;
  Self.Close;
end;

procedure TfrmMinhasMelhorias.PrepararListView(aMelhoria: TMelhoria);
var
  xItem: TListViewItem;
  xImagemCategoria : TImage;
begin
  if aMelhoria.Cidadao.Nome = 'Carlos Felipe' then
  begin
    xItem := lstMinhasMelhorias.Items.Add;
    xItem.Tag := aMelhoria.Id;

    xImagemCategoria := Self.CarregarImagemCategoria(aMelhoria.Categoria);


    TListItemText(xItem.Objects.FindDrawable('txtRanking')).Text := '';
    TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := aMelhoria.Categoria.Nome;

    TListItemImage(xItem.Objects.FindDrawable('imgMelhoria')).Bitmap := xImagemCategoria.Bitmap;

    TListItemImage(xItem.Objects.FindDrawable('imgApoiar')).Bitmap := imgApoiarMelhorias.Bitmap;
    TListItemText(xItem.Objects.FindDrawable('txtEndereco')).Text := aMelhoria.Endereco;
    TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := aMelhoria.Descricao;
    TListItemText(xItem.Objects.FindDrawable('txtApoiadores')).Text := FloatToStr(aMelhoria.Apoio);
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := aMelhoria.Status;
    TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := aMelhoria.Cidadao.Nome
  end;
end;

function TfrmMinhasMelhorias.CarregarImagemCategoria(aCategoria: TCategoria): TImage;
var
  xCategoria : String;
begin

  xCategoria := aCategoria.Nome;

 case  TEnumCategorias(AnsiIndexStr(lowerCase(xCategoria),ArrayCategorias)) of
  ctLixo       : Result := imgCatLixo;
  ctIluminacao : Result := imgCatIlumicacao;
  ctPavimentos : Result := imgCatPavimento;
  ctSinalizacao: Result := imgCatSinalizacao;
  ctVegetacao  : Result := imgCatVegetacao;
  ctOutros     : Result := imgCatSemImagem;
  else
   Result := imgCatSemImagem
 end;
end;

end.
