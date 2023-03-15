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
    cmbOrdenar: TComboBox;
    rectVoltar: TRectangle;
    Label2: TLabel;
    rectFundo: TRectangle;
    lytDetalhes: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rectDetalhes: TRectangle;
    lblApoiadores: TLabel;
    lblDescricao: TLabel;
    lblCategoria: TLabel;
    lblStatus: TLabel;
    rectFeedBack: TRectangle;
    Label11: TLabel;
    Label12: TLabel;
    cmbStatus: TComboBox;
    rectAtualizar: TRectangle;
    Label4: TLabel;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    Label13: TLabel;
    Rectangle1: TRectangle;
    Label9: TLabel;
    Label10: TLabel;
    edtTeste: TEdit;
    btnTeste: TButton;
    cbTeste: TComboBox;
    btnTesteStatus: TButton;
    procedure rectAtualizarClick(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure FrameResized(Sender: TObject);
    procedure btnTesteStatusClick(Sender: TObject);
  private
    { Private declarations }

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



{ TfraGestaoSolicitacao }


procedure TfraGestaoSolicitacao.AlterarStatus;
const COLUNA = 'status';
var
  xStatus: String;
  xServiceMelhoria: TServiceMelhoria;
begin
  //TRATATIVA AQUI
  xStatus := cbTeste.Items[cbTeste.ItemIndex];

  xServiceMelhoria := TServiceMelhoria.Create(TMelhoria.Create(frmHome.Melhoria.Id));
  try
    xServiceMelhoria.Alterar1(COLUNA, xStatus);
    lblStatus.Text := xStatus;
    showMessage('deu certo aeee');
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
  //FAZER TRATAMENTO DO MEMO
  xResposta := edtTeste.Text;

  xServiceMelhoria := TServiceMelhoria.Create(TMelhoria.Create(frmHome.Melhoria.Id));
  try
    xServiceMelhoria.Alterar1(COLUNA, xResposta);
    showMessage('aeee deu certo');
  finally
    FreeAndNil(xServiceMelhoria);
  end;

end;

procedure TfraGestaoSolicitacao.FrameResized(Sender: TObject);
begin
  lblApoiadores.Text := frmHome.Melhoria.Apoio.ToString;
  lblDescricao.Text  := frmHome.Melhoria.descricao;
  lblDescricao.Text  := frmHome.Melhoria.descricao;
  lblCategoria.Text  := frmHome.Melhoria.Categoria.Nome;
  lblStatus.Text     := frmHome.Melhoria.Status;
end;


procedure TfraGestaoSolicitacao.rectAtualizarClick(Sender: TObject);
begin
  EnviarResposta;
end;


end.
