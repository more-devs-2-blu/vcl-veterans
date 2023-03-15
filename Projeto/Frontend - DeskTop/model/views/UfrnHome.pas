unit UfrnHome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
   UfraListSolicitacao, UfraGestaoSolicitacao, UfraAcaoVoluntaria,
   UUtils.Enums, Backend.UEntity.Melhoria, Backend.UEntity.Acao,

  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.ListBox,
  FMX.MultiView;

type
  TfrmHome = class(TForm)
    lytPrincipal: TLayout;
    btnMenu: TSpeedButton;
    rectFundo: TRectangle;
    MultiView1: TMultiView;
    Rectangle1: TRectangle;
    lytLogo: TLayout;
    lstMenu: TListBox;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    Image1: TImage;
    procedure lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMelhoria: TMelhoria;
    FAcao: TAcao;
    procedure AbrirAcaoVoluntaria;
    procedure AbrirAcaoSolicitacao;
    procedure RemoverTelaAnterior;
    function GetMelhoria: TMelhoria;
    procedure SetMelhoria(const Value: TMelhoria);
    function GetAcao: TAcao;
    procedure SetAcao(const Value: TAcao);
  public
    { Public declarations }
    property Melhoria: TMelhoria read GetMelhoria write SetMelhoria;
    property Acao: TAcao read GetAcao write SetAcao;
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.fmx}

{ TForm1 }

procedure TfrmHome.AbrirAcaoVoluntaria;
begin
  if not Assigned(fraAcaoVoluntaria) then
    fraAcaoVoluntaria := TfraAcaoVoluntaria.Create(nil);

  fraAcaoVoluntaria.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraAcaoVoluntaria);
end;


procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FMelhoria);
  FreeAndNil(FAcao);
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  FMelhoria := TMelhoria.Create;
  FAcao     := TAcao.Create;
end;

function TfrmHome.GetAcao: TAcao;
begin
  Result := FAcao;
end;

function TfrmHome.GetMelhoria: TMelhoria;
begin
  Result := FMelhoria;
end;

procedure TfrmHome.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    Self.RemoverTelaAnterior;

  case TEnumMenuGestao(Item.index) of
    mnuAvaliarMelhorias:
      Self.AbrirAcaoSolicitacao;

    mnuAvaliarAcaoVoluntaria:
      Self.AbrirAcaoVoluntaria;

    mnuSair:
      Self.Close;
  end;

  MultiView1.HideMaster;

end;

procedure TfrmHome.AbrirAcaoSolicitacao;
begin
  if not Assigned(fraSolicitacao) then
    fraSolicitacao := TfraSolicitacao.Create(nil);

  fraSolicitacao.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraSolicitacao);
end;

procedure TfrmHome.RemoverTelaAnterior;
var
  i: Integer;
begin
  for I := Pred(lytPrincipal.ControlsCount) downto 0 do
    lytPrincipal.RemoveObject(I);
end;

procedure TfrmHome.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TfrmHome.SetMelhoria(const Value: TMelhoria);
begin
  FMelhoria := Value;
end;

end.
