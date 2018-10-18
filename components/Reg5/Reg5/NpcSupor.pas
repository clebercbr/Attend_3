unit NpcSupor;
//-----------------------------------------------------------------------------------------------
interface
//-----------------------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;
//-----------------------------------------------------------------------------------------------
type
  TNpcSuporte = class(TComponent)
  public
    function GerarContraProva(pProva: String): String;
  end;
//-----------------------------------------------------------------------------------------------
implementation
//-----------------------------------------------------------------------------------------------
function TNpcSuporte.GerarContraProva(pProva: String): String;
var Str, Prova, ContraProva : string;
    I   : integer;
    vcol : array[0..8] of byte;
begin
  for I:= 0 to 8 do vcol[I] := 0;
  Prova := pProva;
// Exemplo de string resultante GA5A-TX2U
  vcol[1] := ord(Prova[1]);
  vcol[2] := ord(Prova[2]);
  vcol[3] := StrToInt(Prova[3]);
  vcol[4] := ord(Prova[4]);
  vcol[5] := ord(Prova[6]);
  vcol[6] := ord(Prova[7]);
  vcol[7] := StrToInt(Prova[8]);
  vcol[8] := ord(Prova[9]);

  if vcol[1] > 70 then vcol[1] := vcol[1] - 5  else vcol[1] := vcol[1] + 5;
  if vcol[2] < 85 then vcol[2] := vcol[2] + 5  else vcol[2] := vcol[2] - 5;
  if vcol[3] < 5  then vcol[3] := vcol[3] + 5  else vcol[3] := vcol[3] - 5;
  if vcol[4] > 75 then vcol[4] := vcol[4] - 10 else vcol[4] := vcol[4] + 10;
  if vcol[5] < 80 then vcol[5] := vcol[5] + 10 else vcol[5] := vcol[5] - 10;
  if vcol[6] < 78 then vcol[6] := vcol[6] + 12 else vcol[6] := vcol[6] - 12;
  if vcol[7] > 5  then vcol[7] := vcol[7] - 6  else vcol[7] := vcol[7] + 4;
  if vcol[8] > 80 then vcol[8] := vcol[8] - 15 else vcol[8] := vcol[8] + 10;
//  Edit6.Text � o Contraprova q � apresentado no software do suporte
  Result := Chr(vcol[1]) + Chr(vcol[2]) +
            IntToStr(vcol[3]) + Chr(vcol[4]) + '-' +
                        Chr(vcol[5]) + Chr(vcol[6]) +
                        IntToStr(vcol[7]) + Chr(vcol[8]);
end;
//-----------------------------------------------------------------------------------------------
end.