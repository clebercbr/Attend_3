{------------------------------------------------------------------------------------------------

              O C E A N O   -    M A R    D E    S O L U � � E S

-------------------------------------------------------------------------------------------------
                                I N I C I O
-------------------------------------------------------------------------------------------------
Cria��o      : 10/09/2001 09:30
Local        : Escrit�rio, Florian�polis
Autor(es)    : Cleber Amaral
               Iomani Engelmann Gomes
Descri��o    : Classe generica para fazer relatorio
Coment�rio   : Para fazer a reusabilidade de codigo dos relatorios, essa classe tem os m�todos
               comuns cos relatorios de nossas aplica��es
-------------------------------------------------------------------------------------------------
Atualiza��o  : 10/10/2001 09:00
Autor(es)    : Iomani Engelmann Gomes
Coment�rio   : implementa�ao de todos os m�todos testados

-------------------------------------------------------------------------------------------------}
unit URelatorio;
//-----------------------------------------------------------------------------------------------
interface
//-----------------------------------------------------------------------------------------------
  uses
   qrprntr, DBTables, Windows, SysUtils, Graphics, Dialogs, QUICKRPT;
//-----------------------------------------------------------------------------------------------
  type
    Relatorio = class
  private
    { Private declarations }
  protected
    { Protected declarations }
    Pag ,                    //-- Pag = P�gina Atual do Relat�rio
    Rod ,                    //-- Rod = Linha Rodap� do relat�rio
    Lin ,                    //-- Lin = Linha Atual
    Col ,                    //-- Col = Coluna Atual
    Tam ,                    //-- Tam = Tamanho da ( largura ) da fonte
    Alt ,                    //-- Alt = Altura da fonte
    Cof ,                    //-- Cof = Coluna Final do Relat�rio
    Coi : Integer;           //-- Coi = Coluna Inicial do Relat�rio
    Ini : bool;              //-- Ini = Inicio de P�gina
    rTitulos ,
    rFiltro  : string;
  public
    { Public declarations }
    //--Procedimentos
    //--Faz a centraliza��o do texto
    procedure centrar(C,L,T:Integer; sTexto:String; iMd: integer );
    //--Escreve o cabe�alho do relat�rio a ser impresso
    procedure colocarCabecalho( pNome, pTitulo : string);
    //Escreve o cabe�alho personalizado para entregadores:
    procedure colocarCabecalhoEntregador(pNome,pTitulo,pEntregador:string);
    //--Escreve uma linha no relat�rio a ser impresso
    procedure escrever( pConteudo : string );
    //--Altera a fonte a ser impressa
    procedure alterarFonte( pFonte : string );
    //--Altera a coluna corrente do relat�rio
    procedure alterarColuna( pCol : Integer );
    //--Altera a linha corrente do relat�rio
    procedure alterarLinha( pLin : integer );
    //--Pula uma linha no relat�rio
    procedure pularLinha;
    //--Verifica se o relat�rio ja preencheu uma pagina completa, se for verdade, ele inicia uma nova pagina
    procedure finalizarPagina;
    //--Inicia as variaveis do relat�rio
    procedure iniciarVariaveis;
    //--Inicia a p�gina do relat�rio
    procedure iniciarRelatorio;
    //--Finaliza o relat�rio do qrPrinter
    procedure finalizarRelatorio;
    //--'Desenha' um risco no relat�rio a ser impresso
    procedure riscar;
    //--Faz o qrPrinter mostrar o layout de impress�o do relat�rio
    procedure visualizarRelatorio;
    //--Rotina que manda o relat�rio para a fila de impress�o
    procedure imprimirRelatorio;
    //--Faz a finaliza��o do relat�rio, escrevendo a mensgagem enviada como parametro
    procedure finalizarArquivoGeral( pRodape : string );
    //--Finaliza o relatorio com query
    procedure finalizarArquivoQuery( pQuery : TQuery; pRodape : string );
    //--Incluir nova pagina no relatorio
    procedure incluirNovaPagina;
    //--Altera o titulo do relatorio;
    procedure alterarRTitulo(qualTitulo : string);
    //--Altera a filtragem (parametros) do relatorio;
    procedure alterarRFiltro(qualFiltro : string);
    //--Limpa o buffer de impressao
    procedure limparBuffer;

  end;
//-----------------------------------------------------------------------------------------------
implementation
//-----------------------------------------------------------------------------------------------
uses UFuncoes, UTabTele;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.centrar(C,L,T:Integer; sTexto:String; iMd: integer );
var Te : Integer;
begin
  Te := ( iMd - Length(sTexto) ) Div 2;
  QRPrinter.Canvas.TextOut(Te*T,L,sTexto);
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.colocarCabecalho( pNome, pTitulo: string);
begin
  if Ini then begin
    QRPrinter.Title := pNome;
    QRPrinter.Canvas.Font.Name := 'Courier New' ;
    QRPrinter.Canvas.Font.Size := StrToInt(FTabTele.retornarVariavel('TamanhoFonte','12'));
    Tam := QRPrinter.Canvas.TextWidth('M');
    Alt := QRPrinter.Canvas.TextHeight('M');
    pularLinha;
    riscar;
    Inc( Lin, Alt div 2);
    alterarFonte( 'Negrito' );
    Escrever( DateToStr( Date ) ); //-- Data
    centrar( Col, Lin, Tam, pTitulo, Cof ); //-- Empresa
    alterarColuna( Cof - 12 );
    escrever( TimeToStr( Time ) ); //-- Hor�rio
    pularLinha;
    centrar( Col, Lin, Tam, QRPrinter.Title, Cof ); //-- T�tulo
    pularLinha;
    centrar( Col, Lin, Tam, rFiltro, Cof ); //-- Filtro
    pularLinha;
    riscar;
    Inc( Lin, Alt div 2 );
    escrever( rTitulos ); //-- Cabe�alho;
    pularLinha;
    riscar;
    pularLinha;
    alterarFonte( 'Normal' );
    Ini := False;
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.colocarCabecalhoEntregador(pNome,pTitulo,pEntregador:string);
begin
  if Ini then begin
    qRPrinter.Title := pNome;
    qRPrinter.Canvas.Font.Name := 'Courier New' ;
    qRPrinter.Canvas.Font.Size := StrToInt(FTabTele.retornarVariavel('TamanhoFonte','12'));
    Tam := QRPrinter.Canvas.TextWidth('M');
    Alt := QRPrinter.Canvas.TextHeight('M');
    pularLinha;
    riscar;
    Inc( Lin, Alt div 2);
    alterarFonte( 'Negrito' );
    escrever( DateToStr( Date ) ); //-- Data
    centrar( Col, Lin, Tam, pTitulo, Cof ); //-- Empresa
    alterarColuna( Cof - 12 );
    escrever( TimeToStr( Time ) ); //-- Hor�rio
    pularLinha;
    centrar( Col, Lin, Tam, QRPrinter.Title, Cof ); //-- T�tulo
    pularLinha;
    centrar( Col, Lin, Tam, rFiltro, Cof ); //-- Filtro
    pularLinha;
    riscar;
    Inc( Lin, Alt div 2 );
    escrever('Entregador: '+pEntregador);
    pularLinha;
    pularLinha;
    escrever( rTitulos ); //-- Cabe�alho;
    pularLinha;
    riscar;
    pularLinha;
    alterarFonte( 'Normal' );
    Ini := False;
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.escrever( pConteudo : string );
begin
  QRPrinter.Canvas.TextOut( Col, Lin, pConteudo );
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.alterarFonte( pFonte : string );
begin
  if pFonte = 'Negrito' then
    QRPrinter.Canvas.Font.Style := [ fsBold ]
  else
    QRPrinter.Canvas.Font.Style := [  ];
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.alterarColuna( pCol : Integer );
begin
  Col := ( Tam * pCol ) + ( Tam * Coi );
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.alterarLinha( pLin : integer );
begin
  Lin := Lin + ( pLin * Alt );
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.pularLinha;
begin
  alterarlinha ( 1 );
  alterarcoluna( 0 );
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.finalizarPagina;
begin
  if Lin > (Alt * Rod) then begin
    alterarColuna( 0 );
    riscar;
    pularLinha;
    centrar( Col, Lin, Tam, StrZero(Pag,3), Cof );
    pularLinha;
    riscar;
    Pag := Pag + 1;
    Lin := 0;
    Ini := True;
    QRPrinter.NewPage;
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.iniciarVariaveis;
begin
  Lin := 00;
  Col := 00;
  Tam := 00;
  Alt := 00;
  Coi := 00;
  Cof := 80;
  Pag := 01;
  Rod := 53;
  Ini  := True;
  rFiltro  := ''; //-- Limpa a terceira linha
  rTitulos := ''; //-- Limpa a SEGUNDA linha
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.iniciarRelatorio;
begin
  QRPrinter.BeginDoc;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.finalizarRelatorio;
begin
  QRPrinter.EndDoc;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.riscar;
begin
  QRPrinter.Canvas.MoveTo( Coi, Lin );
  QRPrinter.Canvas.Pen.Width := StrToInt(FTabTele.retornarVariavel('TamanhoRisco','2'));
  QRPrinter.Canvas.LineTo( Tam * ( Cof - 4 ), Lin );
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.visualizarRelatorio;
begin
  QrPrinter.PreviewModal;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.imprimirRelatorio;
begin
  QRPrinter.Print;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.finalizarArquivoGeral( pRodape : string );
begin
  pularLinha;
  riscar;
  Inc( Lin, Alt div 2 );
  alterarColuna(0);
  alterarFonte('Negrito');
  QrPrinter.Canvas.TextOut(Col,Lin,escreveE(FTabTele.retornarVarMarcaEmpresa(),24)+pRodape);
  alterarFonte( '' );
  pularLinha;
  riscar;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.finalizarArquivoQuery( pQuery : TQuery; pRodape : string );
begin
  if (pQuery.eof) then begin
    pularLinha;
    riscar;
    Inc( Lin, Alt div 2 );
    alterarColuna(0);
    alterarFonte('Negrito');
    QrPrinter.Canvas.TextOut(Col,Lin,escreveE(FTabTele.retornarVarMarcaEmpresa(),24)+pRodape);
    alterarFonte( '' );
    pularLinha;
    riscar;
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.incluirNovaPagina;
begin
  qrPrinter.newPage;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.alterarRTitulo(qualTitulo : string);
begin
  rTitulos := qualTitulo;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.alterarRFiltro(qualFiltro : string);
begin
  rFiltro:=qualFiltro;
end;
//-----------------------------------------------------------------------------------------------
procedure Relatorio.limparBuffer;
begin
  qrPrinter.cleanup;
end;
//-----------------------------------------------------------------------------------------------
end.
//-----------------------------------------------------------------------------------------------
//   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM
//-----------------------------------------------------------------------------------------------

