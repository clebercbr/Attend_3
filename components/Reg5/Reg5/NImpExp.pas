{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Autor        : C�ssio Lacerda
N�dulo       : NUImpExp.pas
Cria��o      : 11/10/00 23:31
Descri��o    : Componente para Importa��o e Exporta��o de informa��es
Coment�rio   : Este componente � derivado do TComponent, sua fun��o � exportar
               da tabela para o arquivo e vice-versa.

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit NImpExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, DB, DBTables;

type
  TNImpExp = class(TComponent)
  private
    FArquivo    : string;
    FDataSet    : TDataSet;
    FEmpty      : Bool;
  protected
    Function BuscaTipoCampo( sTipo : TFieldType; ret : string ) : string; {Busca o Tipo do DataField retorna S/N}

  public
    constructor Create (Aowner:TComponent); override;
    destructor  Destroy; override;
    function Importar: bool;
    function Exportar: bool;
  published
    property Arquivo    : string      read FArquivo      write FArquivo ;
    property DataSet    : TDataSet    read FDataSet      write FDataSet;
    property Empty      : Bool        read FEmpty        write FEmpty;
  end;


implementation  

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

function TNImpExp.BuscaTipoCampo( sTipo : TFieldType; ret : string ) : string;
begin
  if sTipo = ftString    then if ret = 'S' then BuscaTipoCampo := 'A' else BuscaTipoCampo := '0';
  if sTipo = ftInteger   then if ret = 'S' then BuscaTipoCampo := 'I' else BuscaTipoCampo := '1';
  if sTipo = ftFloat	 then if ret = 'S' then BuscaTipoCampo := 'F' else BuscaTipoCampo := '2';
  if sTipo = ftCurrency	 then if ret = 'S' then BuscaTipoCampo := '$' else BuscaTipoCampo := '3';
  if sTipo = ftBoolean	 then if ret = 'S' then BuscaTipoCampo := 'L' else BuscaTipoCampo := '4';
  if sTipo = ftDate	 then if ret = 'S' then BuscaTipoCampo := 'D' else BuscaTipoCampo := '5';
  if sTipo = ftTime	 then if ret = 'S' then BuscaTipoCampo := 'T' else BuscaTipoCampo := '6';
  if sTipo = ftAutoInc	 then if ret = 'S' then BuscaTipoCampo := '+' else BuscaTipoCampo := '7';
  if sTipo = ftGraphic	 then if ret = 'S' then BuscaTipoCampo := 'G' else BuscaTipoCampo := '8';
  if sTipo = ftMemo	 then if ret = 'S' then BuscaTipoCampo := 'M' else BuscaTipoCampo := '9';
  if sTipo = ftFmtMemo	 then if ret = 'S' then BuscaTipoCampo := 'N' else BuscaTipoCampo := '10';
end;

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

function TNImpExp.Importar: bool;
var I,P       : integer;
    F       : TextFile;
    Cab,pri     : Bool;
    Linha,R : String;
begin
  try
    AssignFile (F, FArquivo );

    Reset(F);
    Cab := True;

    FDataSet.Open;
    FDataSet.First;

    // Limpa a Tabela
    if FEmpty then begin
       while not FDataSet.eof do begin
         FDataSet.Delete;
         //FDataSet.Next;
       end;
    end;

    pri := True;
    while not Eof(F) do begin
      Readln(F, Linha);
      if not pri then begin
        if Linha <> '' then begin
          FDataSet.Append;
          for I := 0 to FDataSet.FieldCount -1 do begin
            P := Pos( ' | ', Linha );
            R := Trim( copy ( Linha, 0, P ) );
            Linha := copy ( Linha, P + 3, length( Linha ) );
            if Buscatipocampo(FDataSet.Fields[I].DataType, 'S') <> '+' then begin
              if R <> '' then
                FDataSet.Fields[I].Text := R;
            end;
          end;
          FDataSet.Post;
        end;
      end;
      pri := false;
    end;

    FDataSet.Close;
    CloseFile (F);
    Result := True;
  except
    Result := False;
  end;
end;

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

function TNImpExp.Exportar : Bool;
var I       : integer;
    F       : TextFile;
    Cab     : Bool;
begin
  try
    AssignFile (F, FArquivo );
    Rewrite (F);
    Cab := True;
    FDataSet.Open;
    FDataSet.First;
    while not FDataSet.eof do begin
      if Cab then begin
        for I := 0 to FDataSet.FieldCount -1 do
          Write(F, FDataSet.Fields[I].FieldName + ' - ' + Buscatipocampo(FDataSet.Fields[I].DataType, 'S')  + ' - ' + IntToStr(FDataSet.Fields[I].Size)+ ' | ' );
        Cab := False;
        Writeln(F,''); end
      else begin
        for I := 0 to FDataSet.FieldCount -1 do
          Write(F,FDataSet.Fields[I].Text + ' | ');
      end;
      Writeln(F,'');
      FDataSet.Next;
    end;
    FDataSet.close;
    CloseFile (F);
    Result := True;
  except
    Result := False;
  end;
end;

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

constructor TNImpExp.Create (Aowner:TComponent);
begin
  inherited Create(AOwner);
end;

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}

destructor TNImpExp.Destroy;
begin
  inherited Destroy;
end;

{= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =}


end.

{
        for I := 0 to FDataSet.FieldCount -1 do begin
          P := Pos( ' | ', Linha );
          if pri then begin
            R := copy ( Linha, 0, P );
            pri := false;
          end
          else
            R := copy ( Linha, 1, P );

          Linha := copy ( Linha, P + 1, length( Linha ) );
          FDataSet.Fields[I].Text := R;

}