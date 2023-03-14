unit UfrmSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TfrmSplash = class(TForm)
    recFundo: TRectangle;
    lblFrase: TLabel;
    lytLogo: TLayout;
    imgLogo: TImage;
    lytImage: TLayout;
    lblEuAjudo: TLabel;
    lytNome: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

end.
