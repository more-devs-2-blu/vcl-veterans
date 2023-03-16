unit UfrmSolicitarAcaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.ListBox, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation,
  UServiceIntf, UServiceAcao, Backend.UEntity.Acao, Backend.UEntity.Categoria,
  Backend.UEntity.Cidadao, UUtils.AnimacaoClick, UServiceUsuario;

type
  TfrmSolicitarAcaoVoluntaria = class(TForm)
    recFundo: TRectangle;
    ToolBar1: TToolBar;
    recFundoBar: TRectangle;
    lytSolicitarAcaoVoluntaria: TLayout;
    lblSolicitarAcaoVoluntaria: TLabel;
    lytMensagem: TLayout;
    lblMensagem: TLabel;
    lytEndereco: TLayout;
    edtEndereco: TEdit;
    lblEndereco: TLabel;
    lytDescricaoProblema: TLayout;
    edtDescricao: TEdit;
    lblDescrevaAcao: TLabel;
    lytImagem: TLayout;
    lblPorImagem: TLabel;
    Line2: TLine;
    lytBotao: TLayout;
    recBotao: TRectangle;
    lblBotao: TLabel;
    lytCategoria: TLayout;
    cmbCategoria: TComboBox;
    lblTipoAcao: TLabel;
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
  frmSolicitarAcaoVoluntaria: TfrmSolicitarAcaoVoluntaria;

implementation

uses
  UfrmAcaoVoluntaria;

{$R *.fmx}

procedure TfrmSolicitarAcaoVoluntaria.imgVoltarClick(Sender: TObject);
begin
  if not Assigned(frmAcaoVoluntaria) then
    frmAcaoVoluntaria := TfrmAcaoVoluntaria.Create(Application);

  frmAcaoVoluntaria.Show;
  Application.MainForm := frmAcaoVoluntaria;
  Self.Close;
end;

procedure TfrmSolicitarAcaoVoluntaria.recBotaoClick(Sender: TObject);
begin
  Self.Registrar
end;

procedure TfrmSolicitarAcaoVoluntaria.Registrar;
var
  xServiceAcao: IService;
begin
  if Trim(edtEndereco.Text) = EmptyStr then
    raise Exception.Create('Informe o Endereço.');

  if Trim(edtDescricao.Text) = EmptyStr then
    raise Exception.Create('Descreva a ação voluntária.');

  xServiceAcao := TServiceAcao.Create(
    TAcao.Create(TCategoria.Create(cmbCategoria.ItemIndex+1),0,
                 'Em aguardo',edtDescricao.Text,edtEndereco.Text,
                  dm.xUsuarioLogado));

  try
    xServiceAcao.Registrar;
    ShowMessage('Ação voluntária registrado com sucesso.');
  except on E: Exception do
    raise Exception.Create('Erro:' + E.Message);
  end;
end;

end.
