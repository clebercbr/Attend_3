{ = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

                 O C E A N O   -    M A R    S O L U � � E S

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
                                I N I C I O
= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
Autor        : Equipe Oceano Tecnologia
Local        : Escrit�rio, Florian�polis
Data         :
Vers�o       : 1.0
Descri��o    : pacote de componentes Oceano para Delphi 2.0
Coment�rio   :
= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

unit NRegCom2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs, StdCtrls, ExtCtrls,
  NImpExp, NOrganiza, NVariavel, NMensagem, NInspetor, NMiniCad, NInternet,
  NPcSupor, NPcClien, NPergunta, OExpira, BINA;

procedure Register;

implementation

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

procedure Register;
begin
  RegisterComponents('Oceano', [
                                TNVariavel,
                                TNImpExp,
                                TNOrganiza,
                                TNMensagem,
                                TNPergunta,
                                TNInspetor,
                                TNMiniCad,
                                TNInternet,
                                TNpcSuporte,
                                TNpcCliente,
                                TOExpira,
                                TBina
                                ]);
end;

end.
