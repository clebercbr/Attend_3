//-----------------------------------------------------------------------------------------------
unit USplash;
//-----------------------------------------------------------------------------------------------
interface
//-----------------------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Gauges, StdCtrls, jpeg;
//-----------------------------------------------------------------------------------------------
type
  TfrmSplash = class(TForm)
    Gauge1: TGauge;
    ILogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//-----------------------------------------------------------------------------------------------
var frmSplash: TfrmSplash;
//-----------------------------------------------------------------------------------------------
implementation
//-----------------------------------------------------------------------------------------------
uses UInicial, UFuncoes;
//-----------------------------------------------------------------------------------------------
{$R *.DFM}
//-----------------------------------------------------------------------------------------------
end.
//-----------------------------------------------------------------------------------------------
//   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM
//-----------------------------------------------------------------------------------------------

