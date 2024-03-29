unit UfraListSolicitacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums, Backend.UEntity.Melhoria,UServiceMelhoria,UServiceIntf,

  FMX.ListView, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TfraSolicitacao = class(TFrame)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectFundo: TRectangle;
    lytMelhorias: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstMelhorias: TListView;
    Label1: TLabel;
    Image1: TImage;
    imgMaoMarcaDAgua: TImage;
    Rectangle1: TRectangle;
    Label6: TLabel;
    procedure FrameResized(Sender: TObject);
    procedure rectAtualizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarRegistro;
    procedure CarregarRegistros;
    procedure PrepararListView(aMelhoria: TMelhoria);
  public
    { Public declarations }
  end;

var
 fraSolicitacao : TfraSolicitacao;

implementation

{$R *.fmx}

uses
   UfraGestaoSolicitacao, UfrnHome;

procedure TfraSolicitacao.Button1Click(Sender: TObject);
begin
  Self.SelecionarRegistro;
end;

procedure TfraSolicitacao.CarregarRegistros;
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

procedure TfraSolicitacao.FrameResized(Sender: TObject);
begin
  Self.CarregarRegistros;
end;

procedure TfraSolicitacao.PrepararListView(aMelhoria: TMelhoria);
var
  xItem: TListViewItem;
begin
  xItem := lstMelhorias.Items.Add;
  xItem.Tag := aMelhoria.Id;

  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := aMelhoria.Categoria.Nome;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := aMelhoria.Descricao;
  TListItemText(xItem.Objects.FindDrawable('txtApoiador')).Text := FloatToStr(aMelhoria.Apoio);
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := aMelhoria.Status;
 // TListItemText(xItem.Objects.FindDrawable('txtNome')).Text := aMelhoria.Cidadao.Nome;
end;

procedure TfraSolicitacao.rectAtualizarClick(Sender: TObject);
begin
  self.SelecionarRegistro;
end;

procedure TfraSolicitacao.SelecionarRegistro;
var
  xServiceMelhoria: TServiceMelhoria;
  xItem: TListViewItem;
begin
  if lstMelhorias.ItemIndex = -1 then
  exit;

    xItem := lstMelhorias.Items[lstMelhorias.ItemIndex];
    xServiceMelhoria := TServiceMelhoria.Create;

    try
    frmHome.Melhoria := xServiceMelhoria.ObterRegistroPorId(lstMelhorias.Items[lstMelhorias.ItemIndex].Tag);
    if not Assigned(fraGestaoSolicitacao) then
      fraGestaoSolicitacao := TfraGestaoSolicitacao.Create(application);

      fraGestaoSolicitacao.Align := TAlignLayout.Center;
      Self.Parent.AddObject(fraGestaoSolicitacao);

  finally
     FreeAndNil(xServiceMelhoria);
  end;

end;

end.
