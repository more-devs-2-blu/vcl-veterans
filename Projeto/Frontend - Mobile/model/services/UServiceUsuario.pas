unit UServiceUsuario;

interface

uses
  Backend.UEntity.Cidadao, System.SysUtils, System.Classes;

type
  Tdm = class(TDataModule)
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xUsuarioLogado: TCidadao;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  xUsuarioLogado := TCidadao.Create;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(xUsuarioLogado);
end;

end.
