unit UfraListSolicitacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  UUtils.Enums,

  FMX.ListView, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TfraSolicitacao = class(TFrame)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectFundo: TRectangle;
    lytMelhorias: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstOrcamentos: TListView;
    Label1: TLabel;
    rectVoltar: TRectangle;
    Label2: TLabel;
    cmbOrdenar: TComboBox;
    Label4: TLabel;
    Image1: TImage;
    imgMaoMarcaDAgua: TImage;
    rectAtualizar: TRectangle;
    Label13: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraSolicitacao : TfraSolicitacao;

implementation

{$R *.fmx}

end.
