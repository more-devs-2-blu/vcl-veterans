unit UfraAcaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums,  Backend.UEntity.Voluntario,UServiceMelhoria,UServiceIntf,
  UServiceAcao,Backend.UEntity.Acao,

  FMX.Objects, FMX.ListView, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts;

type
  TfraAcaoVoluntaria = class(TFrame)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    Label1: TLabel;
    cmbOrdenar: TComboBox;
    lytMelhorias: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstAcoes: TListView;
    rectVoltar: TRectangle;
    Label2: TLabel;
    rectFundo: TRectangle;
    Label4: TLabel;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    rectAtualizar: TRectangle;
    Label13: TLabel;
    procedure FrameResized(Sender: TObject);
    procedure rectAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRegistros;
    procedure PrepararListView(aAcao: TAcao);
    procedure SelecionarRegistro;
  public
    { Public declarations }
  end;

var
 fraAcaoVoluntaria : TfraAcaoVoluntaria;

implementation

{$R *.fmx}
uses
    UfrnHome, UfraGestaoVoluntaria, UfraGestaoSolicitacao;

procedure TfraAcaoVoluntaria.CarregarRegistros;
var
  xServiceAcao: IService;
  xAcao: TAcao;
begin
  lstAcoes.Items.Clear;

  xServiceAcao := TServiceAcao.Create;
  xServiceAcao.Listar;

  for xAcao in TServiceAcao(xServiceAcao).Acoes do
  begin
    Self.PrepararListView(xAcao);
  end;

end;

procedure TfraAcaoVoluntaria.FrameResized(Sender: TObject);
begin
  Self.CarregarRegistros;
end;

procedure TfraAcaoVoluntaria.PrepararListView(aAcao: TAcao);
var
  xItem: TListViewItem;
begin
  xItem := lstAcoes.Items.Add;
  xItem.Tag := aAcao.Id;

  TListItemText(xItem.Objects.FindDrawable('txtApoiador')).Text := aAcao.Apoio.ToString;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := aAcao.Descricao;
  TListItemText(xItem.Objects.FindDrawable('txtCategoria')).Text := aAcao.Categoria.Nome;
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := aAcao.Status;

end;

procedure TfraAcaoVoluntaria.rectAtualizarClick(Sender: TObject);
begin
  SelecionarRegistro;
end;

procedure TfraAcaoVoluntaria.SelecionarRegistro;
var
  xServiceAcao: TServiceAcao;
  xItem: TListViewItem;
begin
  if lstAcoes.ItemIndex = -1 then
  exit;

  try
    xItem := lstAcoes.Items[lstAcoes.ItemIndex];

    xServiceAcao := TServiceAcao.Create;
    frmHome.Acao := xServiceAcao.ObterRegistro1(lstAcoes.Items[lstAcoes.ItemIndex].Tag);
    if not Assigned(fraGestaoVoluntaria) then
      fraGestaoVoluntaria := TfrmGestaoSolidaria.Create(application);
    try
      fraGestaoVoluntaria.Align := TAlignLayout.Center;
      Self.Parent.AddObject(fraGestaoSolicitacao);

      FreeAndNil(xServiceAcao);
    finally

    end;
  finally

end;

 {   }



end;

end.
