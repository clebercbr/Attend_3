{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Autor        : C�ssio Lacerda
N�dulo       : NOrganiza.pas
Cria��o      : 16/10/00 00:30
Descri��o    : Componente para Organiza��o de Tabelas
Coment�rio   : Este componente � derivado do TComponent,
               sua fun��o � organizar uma tabela

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit NOrganiza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, DB, DBTables;

type
  TNOrganiza = class(TComponent) 
  private
    FCriar        : Bool;
    FTableName    : TFileName;
    FDatabaseName : string;
  protected
  public
//    constructor Create (Aowner:TComponent); override;
//    destructor  Destroy; override;

  published
    property Criar        : bool        read FCriar        write FCriar;
    property TableName    : TFileName   read FTableName    write FTableName;
    property DatabaseName : string      read FDatabaseName write FDatabaseName;
  end;

implementation

end.
