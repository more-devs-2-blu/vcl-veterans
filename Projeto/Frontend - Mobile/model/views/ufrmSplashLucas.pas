unit ufrmSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Timer1: TTimer;
    Rectangle1: TRectangle;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Application.CreateForm(TForm2, Form2);
  Application.MainForm := Form2;
  Form2.Show;
  Timer1.Enabled := False;
  Self.Close;
end;

end.
