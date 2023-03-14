unit UfraGestaoSolicitacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums,

  FMX.Objects, FMX.ListView, FMX.ListBox, FMX.Controls.Presentation, FMX.Layouts;

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
    Label6: TLabel;
    imgMaoMarcaDAgua: TImage;
    Image2: TImage;
    Label13: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraGestaoSolicitacao : TfraGestaoSolicitacao;

implementation

{$R *.fmx}


end.
