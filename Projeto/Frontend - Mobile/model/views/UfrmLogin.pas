unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation;

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
    lblSolicitarAcaoVoluntaria: TLabel;
    CheckBox1: TCheckBox;
    lblMostrarSenha: TLabel;
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}


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

end.
