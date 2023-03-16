unit UfraGestaoSolicitacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums, Backend.UEntity.Melhoria, UServiceMelhoria,

  FMX.Objects, FMX.ListView, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TfraGestaoSolicitacao = class(TFrame)
    lytPrincipal: TLayout;
    lytHead: TLayout;
    Label1: TLabel;
    rectVoltar: TRectangle;
    Label2: TLabel;
    rectFundo: TRectangle;
    lytDetalhes: TLayout;
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
    Image2: TImage;
    rectDetalhes: TRectangle;
    cmbStatus: TComboBox;
    rectAtualizar: TRectangle;
    Label13: TLabel;
    rectFeedBack: TRectangle;
    edtFeedBack: TEdit;
    imgMaoMarcaDAgua: TImage;
    procedure rectAtualizarClick(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure FrameResized(Sender: TObject);
    procedure btnTesteStatusClick(Sender: TObject);
    procedure rectVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarTela;
    procedure EnviarResposta;
    procedure AlterarStatus;
  public
    { Public declarations }
  end;

var
 fraGestaoSolicitacao : TfraGestaoSolicitacao;

implementation

uses
  UfrnHome;

{$R *.fmx}

{ TfraGestaoSolicitacao }


procedure TfraGestaoSolicitacao.AlterarStatus;
const COLUNA = 'status';
var
  xStatus: String;
  xServiceMelhoria: TServiceMelhoria;
begin
  //TRATATIVA AQUI
  xStatus := cmbStatus.Items[cmbStatus.ItemIndex];

  xServiceMelhoria := TServiceMelhoria.Create(TMelhoria.Create(frmHome.Melhoria.Id));
  try
    xServiceMelhoria.AlterarPorId(COLUNA, xStatus);
    lblStatus.Text := xStatus;
    showMessage('Status Alterado com Sucesso.');
  finally
    FreeAndNil(xServiceMelhoria);
  end;
end;

procedure TfraGestaoSolicitacao.btnTesteClick(Sender: TObject);
begin
  EnviarResposta;
end;

procedure TfraGestaoSolicitacao.btnTesteStatusClick(Sender: TObject);
begin
  AlterarStatus;
end;

procedure TfraGestaoSolicitacao.EnviarResposta;
const COLUNA = 'resposta';
var
  xResposta: string;
  xServiceMelhoria: TServiceMelhoria;
begin

  xResposta := Trim(edtFeedBack.Text);

  xServiceMelhoria := TServiceMelhoria.Create(TMelhoria.Create(frmHome.Melhoria.Id));
  try
    xServiceMelhoria.AlterarPorId(COLUNA, xResposta);
    showMessage('FeedBack Enviado.');
  finally
    FreeAndNil(xServiceMelhoria);
  end;

end;

procedure TfraGestaoSolicitacao.FrameResized(Sender: TObject);
begin
  lblApoiadores.Text := frmHome.Melhoria.Apoio.ToString;
  lblDescricao.Text  := frmHome.Melhoria.descricao;
  lblCategoria.Text  := frmHome.Melhoria.Categoria.Nome;
  lblStatus.Text     := frmHome.Melhoria.Status;
end;

procedure TfraGestaoSolicitacao.rectAtualizarClick(Sender: TObject);
begin
  if not (edtFeedback.text.IsEmpty) then
  EnviarResposta;

  if cmbStatus.ItemIndex > -1 then
  AlterarStatus;
end;

procedure TfraGestaoSolicitacao.rectVoltarClick(Sender: TObject);
begin
 if not Assigned(frmHome) then
      frmHome := TfrmHome.Create(application);

      FreeAndNil(fraGestaoSolicitacao);
end;

procedure TfraGestaoSolicitacao.VoltarTela;
begin
    if not Assigned(frmHome) then
    frmHome := TfrmHome.Create(application);

    FreeAndNil(fraGestaoSolicitacao);
end;

end.
