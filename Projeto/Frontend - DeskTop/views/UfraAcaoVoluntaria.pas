unit UfraAcaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums,

  FMX.Objects, FMX.ListView, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts;

type
  TfraAcaoVoluntaria = class(TFrame)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    Label1: TLabel;
    cmbOrdenar: TComboBox;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstOrcamentos: TListView;
    rectVoltar: TRectangle;
    Label2: TLabel;
    rectFundo: TRectangle;
    Label4: TLabel;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    rectAtualizar: TRectangle;
    Label13: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraAcaoVoluntaria : TfraAcaoVoluntaria;

implementation

{$R *.fmx}

end.
