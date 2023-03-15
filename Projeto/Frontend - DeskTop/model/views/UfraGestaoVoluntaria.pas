unit UfraGestaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UUtils.Enums,

  FMX.Objects, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TfraGestaoSolidaria = class(TFrame)
    lytPrincipal: TLayout;
    lytHead: TLayout;
    Label1: TLabel;
    rectVoltar: TRectangle;
    Label2: TLabel;
    lytDetalhes: TLayout;
    rectDetalhes: TRectangle;
    rectFeedBack: TRectangle;
    cmbStatus: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblApoiadores: TLabel;
    lblDescricao: TLabel;
    lblCategoria: TLabel;
    lblStatus: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    rectFundo: TRectangle;
    Image2: TImage;
    rectAtualizar: TRectangle;
    Label13: TLabel;
    edtFeedBack: TEdit;
    imgMaoMarcaDAgua: TImage;
    procedure FrameResized(Sender: TObject);
    procedure btnRespostaTesteClick(Sender: TObject);
    procedure rectAtualizarClick(Sender: TObject);
    procedure rectVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnviarResposta;
    procedure AlterarStatus;
    procedure VoltarTela;
  public
    { Public declarations }
  end;

var
 fraGestaoVoluntaria : TfraGestaoSolidaria;

implementation

uses
  Backend.UEntity.Acao, UServiceAcao, UfrnHome;
{$R *.fmx}

procedure TfraGestaoSolidaria.AlterarStatus;
const COLUNA = 'status';
var
  xStatus: String;
  xServiceAcao: TServiceAcao;
begin
  xStatus := cmbStatus.Items[cmbStatus.ItemIndex];

  xServiceAcao := TServiceAcao.Create(TAcao.Create(frmHome.Melhoria.Id));
  try
    xServiceAcao.Alterar1(COLUNA, xStatus);
    lblStatus.Text := xStatus;
    showMessage('Status Alterado com Sucesso.');
  finally
    FreeAndNil(xServiceAcao);
  end;
end;

procedure TfraGestaoSolidaria.btnRespostaTesteClick(Sender: TObject);
begin
  EnviarResposta;
end;

procedure TfraGestaoSolidaria.EnviarResposta;
const COLUNA = 'resposta';
var
  xResposta: string;
  xServiceAcao: TServiceAcao;
begin
  xResposta := Trim(edtFeedBack.Text);

  xServiceAcao := TServiceAcao.Create(TAcao.Create(frmHome.Acao.Id));
  try
    xServiceAcao.Alterar1(COLUNA, xResposta);
    showMessage('FeedBack Enviado..');
  finally
    FreeAndNil(xServiceAcao);
  end;
end;

procedure TfraGestaoSolidaria.FrameResized(Sender: TObject);
begin
  lblApoiadores.Text := frmHome.Acao.Apoio.ToString;
  lblDescricao.Text  := frmHome.Acao.descricao;
  lblCategoria.Text  := frmHome.Acao.Categoria.Nome;
  lblStatus.Text     := frmHome.Acao.Status;
end;

procedure TfraGestaoSolidaria.rectAtualizarClick(Sender: TObject);
begin
  if not (edtFeedback.text.IsEmpty) then
  EnviarResposta;

  if cmbStatus.ItemIndex > -1 then
  AlterarStatus;
end;

procedure TfraGestaoSolidaria.rectVoltarClick(Sender: TObject);
begin
  self.VoltarTela;
end;

procedure TfraGestaoSolidaria.VoltarTela;
begin
    if not Assigned(frmHome) then
    frmHome := TfrmHome.Create(application);

    FreeAndNil(fraGestaoVoluntaria);
end;

end.
