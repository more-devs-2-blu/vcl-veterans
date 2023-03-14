unit UfraGestaoVoluntaria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UUtils.Enums,

  FMX.Objects, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraGestaoVoluntaria : TfrmGestaoSolidaria;

implementation

{$R *.fmx}

end.
