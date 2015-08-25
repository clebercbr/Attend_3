{------------------------------------------------------------------------------------------------

              O C E A N O   -    M A R    D E    S O L U � � E S

-------------------------------------------------------------------------------------------------
                                I N I C I O
-------------------------------------------------------------------------------------------------
Cria��o      : 29/09/2001 18:00
Local        : Escrit�rio, Florian�polis
Autor(es)    : Cleber Amaral
               Iomani Engelmann Gomes
Descri��o    : Classe de defini�ao da instancia pessoa
Coment�rio   : Define uma entidade do tipo pessoa
-------------------------------------------------------------------------------------------------
Atualiza��o  : 10/10/2001 09:00
Autor(es)    : Iomani Engelmann Gomes
Coment�rio   : Adi�ao da classe ao projeto e reonemanto do m�todos para
               nosso padr�o de codifica��o
-------------------------------------------------------------------------------------------------}
unit UPessoa;

interface

type Pessoa = class

protected
  nome : string ;
  endereco : string ;
  cpf : string;
  dataDeNasc : string;
  telefone   : string;
public
  constructor criarInstancia;
  procedure alterarNome( nvNOme : string);
  procedure alterarEndereco( nvEndereco :string);
  procedure alterarDataDeNasc( nvData :string);
  procedure alterarCpf(nvCpf : string);
  procedure alterarTelefone(nvTelefone : string);
  function fornecerNome : string;
  function fornecerEndereco : string;
  function fornecerDataDeNasc : string;
  function fornecerCpf : string;
  function fornecerTelefone : string;
  destructor destruir_se;
end;

implementation

constructor Pessoa.criarInstancia;
begin
end;
//-----------------------------------------------------------------------------------------------
procedure Pessoa.alterarNome( nvNome : string);
begin
  nome := nvNome
end;
//-----------------------------------------------------------------------------------------------
procedure Pessoa.alterarEndereco( nvEndereco :string);
begin
  endereco := nvEndereco
end;
//-----------------------------------------------------------------------------------------------
procedure Pessoa.alterarDataDeNasc( nvData :string);
begin
  dataDeNasc := nvData;
end;
//-----------------------------------------------------------------------------------------------
procedure Pessoa.alterarCpf(nvCpf : string);
begin
  cpf := nvCpf;
end;
//-----------------------------------------------------------------------------------------------
procedure Pessoa.alterarTelefone(nvTelefone : string);
begin
  telefone:= nvTelefone;
end;
//-----------------------------------------------------------------------------------------------
function Pessoa.fornecerNome : string;
begin
  result := nome;
end;
//-----------------------------------------------------------------------------------------------
function Pessoa.fornecerEndereco : string;
begin
  result := endereco;
end;
//-----------------------------------------------------------------------------------------------
function Pessoa.fornecerDataDeNasc : string;
begin
  result := dataDeNasc;
end;
//-----------------------------------------------------------------------------------------------
function Pessoa.fornecerCpf : string;
begin
  result := cpf;
end;
//-----------------------------------------------------------------------------------------------
function Pessoa.fornecerTelefone : string;
begin
  result := telefone;
end;
//-----------------------------------------------------------------------------------------------
destructor Pessoa.destruir_se;
begin
end;
//-----------------------------------------------------------------------------------------------
end.
//-----------------------------------------------------------------------------------------------
//   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM   FIM
//-----------------------------------------------------------------------------------------------



