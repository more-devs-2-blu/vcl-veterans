unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation,
  UServiceUsuario;

type
  TfrmLogin = class(TForm)
    recFundo: TRectangle;
    lytNome: TLayout;
    edtNome: TEdit;
    lytlytSenha: TLayout;
    edtSenha: TEdit;
    lytBotao: TLayout;
    recBotao: TRectangle;
    lblBotao: TLabel;
    Label1: TLabel;
    lblCriarConta: TLabel;
    ToolBar1: TToolBar;
    RectLogin: TRectangle;
    lytLogin: TLayout;
    lblTituloLogin: TLabel;
    CheckBox1: TCheckBox;
    lblMostrarSenha: TLabel;
    lytLogo: TLayout;
    lytImage: TLayout;
    imgLogo: TImage;
    Layout1: TLayout;
    lblEuAjudo: TLabel;
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure recBotaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChecarNome;
    procedure AbrirHome;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses
  UfrmHome, UServiceCidadao, Backend.UEntity.Cidadao;
{$R *.fmx}


procedure TfrmLogin.AbrirHome;
begin
   if not Assigned(frmHome) then
    frmHome := TfrmHome.Create(Application);
  frmHome.Show;
  Application.MainForm := frmHome;
  Self.Close;
end;

procedure TfrmLogin.ChecarNome;
var
  I: Integer;
  xServiceCidadao: TServiceCidadao;
  xNome : String;
begin
  xServiceCidadao := TServiceCidadao.Create;
  xNome := Trim(edtNome.Text);
  try
    xServiceCidadao.Listar;
    for I := 0 to pred(xServiceCidadao.Cidadaos.Count) do
    begin
      if xServiceCidadao.Cidadaos[I].Nome = xNome then
      begin
        dm.xUsuarioLogado.Id := xServiceCidadao.Cidadaos[I].Id;
        dm.xUsuarioLogado.Nome := xServiceCidadao.Cidadaos[I].Nome;
        dm.xUsuarioLogado.Pontos := xServiceCidadao.Cidadaos[I].Pontos;
        break;
      end;
    end;

    if dm.xUsuarioLogado.id = 0 then
    begin
      xServiceCidadao.Cidadao := nil;
      xServiceCidadao.Cidadao := TCidadao.Create;
      xServiceCidadao.Cidadao.Nome := xNome;
      xServiceCidadao.Cidadao.Pontos := 0;
      xServiceCidadao.Registrar;

      xServiceCidadao.Listar;

      dm.xUsuarioLogado.Id := xServiceCidadao.Cidadaos.Last.Id;
      dm.xUsuarioLogado.Nome := xServiceCidadao.Cidadaos.Last.Nome;
      dm.xUsuarioLogado.Pontos := xServiceCidadao.Cidadaos.Last.Pontos;
    end;
  finally
    FreeAndNil(xServiceCidadao);
  end;
  showMessage(dm.xUsuarioLogado.Nome);
end;

procedure TfrmLogin.CheckBox1Change(Sender: TObject);
begin
  if not CheckBox1.IsChecked then
    lblMostrarSenha.Text := 'Mostrar Senha'
  else
    lblMostrarSenha.Text := 'Ocultar Senha'

end;


procedure TfrmLogin.CheckBox1Click(Sender: TObject);
begin
  edtSenha.Password  := CheckBox1.IsChecked;
end;

procedure TfrmLogin.recBotaoClick(Sender: TObject);
begin
  ChecarNome;
  AbrirHome;

end;

end.
