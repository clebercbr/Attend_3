unit NpcClien;
//-----------------------------------------------------------------------------------------------
interface
//-----------------------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;
//-----------------------------------------------------------------------------------------------
type
  TNpcCliente = class(TComponent)
  public
    function GerarProva: String;
    function Conferir(pProva, pContra: String): Byte;
    function SerialNum(FDrive:String) :String;
    //-- Testando se o carcter � letra
    function testarSeEhLetra(pCaracter:Char): bool;
    //-- Testando se o carcter � n�mero
    function testarSeEhNumero(pCaracter:Char): bool;
  end;
//-----------------------------------------------------------------------------------------------
implementation
//-----------------------------------------------------------------------------------------------
function TNpcCliente.GerarProva: String;
var
  dia, mes, ano: Word;
  hor, min, seg, mil: Word;
  I   : integer;
  vcol : array[0..12] of byte;
  drive : string;
begin
  drive := SerialNum('C');

  for I:= 0 to 12 do vcol[I] := 0;

  DecodeTime(Now(), hor, Min, Seg, mil);
  DecodeDate(Now(), ano, mes, dia);
  //-- 'A' = 65 (0x41) 'Z' = 90 (0x5A)
  //-- '0' = 48 (0x30) '9' = 54 (0x39)
  //-- 65-48 = 17 ; 90-65 / 2 = 12,5 + 65 = 77,5
  //-- 0
  if (testarSeEhLetra(drive[1]))  then
  begin
    if (testarSeEhNumero(drive[1])) then vcol[0] := (17+StrToInt(drive[1])) else vcol[0] := 77-mes;
  end
  else
  begin
    vcol[0] := 77-mes;
  end;
  //-- 1
  if (testarSeEhLetra(drive[2]))  then
  begin
    if (testarSeEhNumero(drive[2])) then vcol[1] := (18+StrToInt(drive[2])) else vcol[1] := 77+mes;
  end
  else
  begin
    vcol[1] := 77+mes;
  end;
  //-- 2
  if (testarSeEhLetra(drive[2]))  then
  begin
    if (testarSeEhNumero(drive[2])) then vcol[2] := (19+StrToInt(drive[3])) else vcol[2] := 77-mes;
  end
  else
  begin
    vcol[2] := 77-(mes div 2);
  end;
  //-- 3
  if (testarSeEhLetra(drive[3]))  then
  begin
    if (testarSeEhNumero(drive[3])) then vcol[3] := (20+StrToInt(drive[3])) else vcol[3] := 77+(mes div 2);
  end
  else
  begin
    vcol[3] := 77+(mes div 2);
  end;
  //-- 4
  if (testarSeEhLetra(drive[4]))  then
  begin
    if (testarSeEhNumero(drive[4])) then vcol[4] := (21+StrToInt(drive[4])) else vcol[4] := 77+(mes div 2)+5;
  end
  else
  begin
    vcol[4] := 77+(mes div 2)+5;
  end;
  //-- 5
  if (testarSeEhLetra(drive[5]))  then
  begin
    if (testarSeEhNumero(drive[5])) then vcol[5] := (22+StrToInt(drive[5])) else vcol[5] := 77-(mes div 2)-5;
  end
  else
  begin
    vcol[5] := 77-(mes div 2)-5;
  end;
  //-- 6
  if (testarSeEhLetra(drive[6]))  then
  begin
    if (testarSeEhNumero(drive[6])) then vcol[6] := (23+StrToInt(drive[6])) else vcol[6] := 77+(dia div 2);
  end
  else
  begin
    vcol[6] := 77+(dia div 2);
  end;
  //-- 7
  if (testarSeEhLetra(drive[7]))  then
  begin
    if (testarSeEhNumero(drive[7])) then vcol[7] := (24+StrToInt(drive[7])) else vcol[7] := 77-(dia div 2);
  end
  else
  begin
    vcol[7] := 77-(dia div 2);
  end;
  //-- 8
  vcol[8] := 65+mes;
  //-- 9
  vcol[9] := 65+(dia div 2)+8;
  //-- 10
  vcol[10] := 65+(dia div 3)+14;
  //-- 11
  vcol[11] := 90-(dia div 3)-14;

  Result := Chr(vcol[0])+Chr(vcol[1])+Chr(vcol[2])+Chr(vcol[3])+
            Chr(vcol[4])+Chr(vcol[5])+Chr(vcol[6])+Chr(vcol[7])+
            Chr(vcol[8])+Chr(vcol[9])+Chr(vcol[10])+Chr(vcol[11]);
end;
//-----------------------------------------------------------------------------------------------
function TNpcCliente.Conferir(pProva, pContra: String): Byte;
var Prova, ContraProva : String;
    vcol : array[0..8] of byte;
begin
  Prova := pProva;
  if Length(Prova) <> 9 then Exit;
// Exemplo de string resultante GA5A-TX2U
  vcol[1] := ord(Prova[1]);
  vcol[2] := ord(Prova[2]);
  vcol[3] := StrToInt(Prova[3]);
  vcol[4] := ord(Prova[4]);
  vcol[5] := ord(Prova[6]);
  vcol[6] := ord(Prova[7]);
  vcol[7] := StrToInt(Prova[8]);
  vcol[8] := ord(Prova[9]);
//  Edit4.Text := IntToStr(vcol[1])+' '+IntToStr(vcol[2])+' '+Str[3]+' '+
//               IntToStr(vcol[4])+' '+IntToStr(vcol[5])+' '+IntToStr(vcol[6])+' '+
//                Str[8]+' '+IntToStr(vcol[8]);
  if vcol[1] > 70 then vcol[1] := vcol[1] - 5  else vcol[1] := vcol[1] + 5;
  if vcol[2] < 85 then vcol[2] := vcol[2] + 5  else vcol[2] := vcol[2] - 5;
  if vcol[3] < 5  then vcol[3] := vcol[3] + 5  else vcol[3] := vcol[3] - 5;
  if vcol[4] > 75 then vcol[4] := vcol[4] - 10 else vcol[4] := vcol[4] + 10;
  if vcol[5] < 80 then vcol[5] := vcol[5] + 10 else vcol[5] := vcol[5] - 10;
  if vcol[6] < 78 then vcol[6] := vcol[6] + 12 else vcol[6] := vcol[6] - 12;
  if vcol[7] > 5  then vcol[7] := vcol[7] - 6  else vcol[7] := vcol[7] + 4;
  if vcol[8] > 80 then vcol[8] := vcol[8] - 15 else vcol[8] := vcol[8] + 10;

  ContraProva := Chr(vcol[1]) + Chr(vcol[2]) + IntToStr(vcol[3]) + Chr(vcol[4]) + '-' +
                 Chr(vcol[5]) + Chr(vcol[6]) + IntToStr(vcol[7]) + Chr(vcol[8]);

  if (Copy(pContra,1,6) = Copy(ContraProva,1,6)) and (Copy(pContra,8,2) = Copy(ContraProva,8,2)) then begin
    case Ord(pContra[7]) of
      68: Result := 1; // Corresponde a letra 'D'
      75: Result := 2; // Corresponde a letra 'K'
      79: Result := 3; // Corresponde a letra 'O'
      84: Result := 4; // Corresponde a letra 'T'
      87: Result := 5; // Corresponde a letra 'W'
//      68: ShowMessage('Acesso por 15 dias!'); // Corresponde a letra 'D'
//      75: ShowMessage('Acesso por 1 m�s!');   // Corresponde a letra 'K'
//      79: ShowMessage('Acesso por 3 meses!'); // Corresponde a letra 'O'
//      84: ShowMessage('Acesso por 6 meses!'); // Corresponde a letra 'T'
//      87: ShowMessage('Acesso por 1 ano!');   // Corresponde a letra 'W'
    else
      Result := 0;
    end;
  end
  else
    Result := 0;
end;
//-----------------------------------------------------------------------------------------------
//-- Pegando o Serial do HD
function TNpcCliente.SerialNum(FDrive:String) :String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  Except
    Result :='';
  end; // end do Try
end;
//-----------------------------------------------------------------------------------------------
//-- Testando se o carcter � letra
function TNpcCliente.testarSeEhLetra(pCaracter:Char): bool;
begin
//  if ((pCaracter >= 65   and pCaracter < 90) or (pCaracter >= 97 and pCaracter <= 122)) then result := true else result := false;
end;
//-----------------------------------------------------------------------------------------------
//-- Testando se o carcter � n�mero
function TNpcCliente.testarSeEhNumero(pCaracter:Char): bool;
begin
//  if (pCaracter >= 48 and pCaracter <= 57) then result := true else result := false;
end;
//-----------------------------------------------------------------------------------------------

end.

