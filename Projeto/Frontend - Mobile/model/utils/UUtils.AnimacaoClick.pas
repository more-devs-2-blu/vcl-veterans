unit UUtils.AnimacaoClick;

interface

uses
  FMX.Objects;

type
  TEventoBotao = class
  private

  public
    procedure EventoBotao(aRectangle: TRectangle);
  end;

implementation

uses
  System.UITypes, System.Classes, System.SysUtils;
{ TEventoBotao }


{ TEventoBotao }

procedure TEventoBotao.EventoBotao(aRectangle: TRectangle);
begin
  aRectangle.Fill.Color := TAlphaColorrec.GainsBoro;
  TThread.CreateAnonymousThread(
    procedure
    begin
      Sleep(160);
      TThread.Synchronize(nil,
        procedure
        begin
          aRectangle.Fill.Color := TAlphaColorRec.White;
        end);
    end).Start;
end;

end.

