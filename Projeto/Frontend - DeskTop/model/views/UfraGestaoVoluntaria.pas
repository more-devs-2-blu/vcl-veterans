unit UfraGestaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UUtils.Enums,

  FMX.Objects, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TfrmGestaoSolidaria = class(TFrame)
    lytPrincipal: TLayout;
    lytHead: TLayout;
    Label1: TLabel;
    cmbOrdenar: TComboBox;
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
    Label4: TLabel;
    rectFundo: TRectangle;
    Label6: TLabel;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    rectAtualizar: TRectangle;
    Label13: TLabel;
    edtRespostaTeste: TEdit;
    btnRespostaTeste: TButton;
    cbteste: TComboBox;
    btnstatusteste: TButton;
    procedure FrameResized(Sender: TObject);
    procedure btnRespostaTesteClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnviarResposta;
    procedure AlterarStatus;
  public
    { Public declarations }
  end;

var
 fraGestaoVoluntaria : TfrmGestaoSolidaria;

implementation

uses
  Backend.UEntity.Acao, UServiceAcao, UfrnHome;
{$R *.fmx}

procedure TfrmGestaoSolidaria.AlterarStatus;
const COLUNA = 'status';
var
  xStatus: String;
  xServiceAcao: TServiceAcao;
begin
  //TRATATIVA AQUI
  xStatus := cbTeste.Items[cbTeste.ItemIndex];

  xServiceAcao := TServiceAcao.Create(TAcao.Create(frmHome.Melhoria.Id));
  try
    xServiceAcao.Alterar1(COLUNA, xStatus);
    lblStatus.Text := xStatus;
    showMessage('deu certo aeee');
  finally
    FreeAndNil(xServiceAcao);
  end;
end;

procedure TfrmGestaoSolidaria.btnRespostaTesteClick(Sender: TObject);
begin
  EnviarResposta;
end;

procedure TfrmGestaoSolidaria.EnviarResposta;
const COLUNA = 'resposta';
var
  xResposta: string;
  xServiceAcao: TServiceAcao;
begin
  //FAZER TRATAMENTO DO MEMO
  //xResposta := edtTeste.Text;

  xServiceAcao := TServiceAcao.Create(TAcao.Create(frmHome.Melhoria.Id));
  try
    xServiceAcao.Alterar1(COLUNA, xResposta);
    showMessage('aeee deu certo');
  finally
    FreeAndNil(xServiceAcao);
  end;
end;


procedure TfrmGestaoSolidaria.FrameResized(Sender: TObject);
begin
  lblApoiadores.Text := frmHome.Acao.Apoio.ToString;
  lblDescricao.Text  := frmHome.Acao.descricao;
  lblCategoria.Text  := frmHome.Acao.Categoria.Nome;
  lblStatus.Text     := frmHome.Acao.Status;
end;

end.
