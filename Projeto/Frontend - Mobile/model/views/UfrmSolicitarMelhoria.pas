unit UfrmSolicitarMelhoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  UServiceIntf, UServiceMelhoria, Backend.UEntity.Cidadao,
  Backend.UEntity.Melhoria, Backend.UEntity.Categoria;

type
  TfrmSolicitarMelhoria = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytSolicitarMelhoria: TLayout;
    lblSolicitarMelhoria: TLabel;
    lytMensagem: TLayout;
    lblMensagem: TLabel;
    lytCategoria: TLayout;
    cmbCategoria: TComboBox;
    lytEndereco: TLayout;
    edtEndereco: TEdit;
    lblEndereco: TLabel;
    lytDescricaoProblema: TLayout;
    edtDescricao: TEdit;
    lblDescrevaProblema: TLabel;
    lytImagem: TLayout;
    lblPorImagem: TLabel;
    Line2: TLine;
    lytBotao: TLayout;
    lblBotao: TLabel;
    recBotao: TRectangle;
    lblCategoria: TLabel;
    lytVoltar: TLayout;
    imgVoltar: TImage;
    procedure imgVoltarClick(Sender: TObject);
    procedure recBotaoClick(Sender: TObject);
  private
    procedure Registrar;
  public
    { Public declarations }
  end;

var
  frmSolicitarMelhoria: TfrmSolicitarMelhoria;

implementation

uses
  uFrmMelhoriasUrbanas;

{$R *.fmx}

procedure TfrmSolicitarMelhoria.imgVoltarClick(Sender: TObject);
begin
  if not Assigned(frmMelhoriasUrbanas) then
    frmMelhoriasUrbanas := TfrmMelhoriasUrbanas.Create(Application);

  frmMelhoriasUrbanas.Show;
  Application.MainForm := frmMelhoriasUrbanas;
  Self.Close;
end;

procedure TfrmSolicitarMelhoria.recBotaoClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TfrmSolicitarMelhoria.Registrar;
var
  xServiceMelhoria: IService;
  xCidado: TCidadao;
begin
  if Trim(edtEndereco.Text) = EmptyStr then
    raise Exception.Create('Informe o Endereço.');

  if Trim(edtDescricao.Text) = EmptyStr then
    raise Exception.Create('Descreva a Melhoria.');

  xServiceMelhoria := TServiceMelhoria.Create(
    TMelhoria.Create('Em aguardo',edtDescricao.Text,edtEndereco.Text,
       TCidadao.Create(1),
       TCategoria.Create(cmbCategoria.ItemIndex+1)));

  try
    xServiceMelhoria.Registrar;
    ShowMessage('Usuário registrado com sucesso.');
  except on E: Exception do
    raise Exception.Create('Erro:' + E.Message);
  end;
end;


end.
