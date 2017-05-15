-- Um programa em haskell consiste em uma coleção de módulos, um módulo em haskell tem dois objetivos: separar e organizar funções
-- (da para fazer uma analogia aos namespaces do php, ou modules do ruby), e criar tipos de dados algébricos (veremos mais tarde)
-- TODO módulo deve conter a primeira letra maiúscula, e deve estar em um arquivo .hs com o mesmo nome

module IntroAndFunctions where
-- <?php
-- namespace Dia1;

-- Instalação e Iniciação -------------------------------------------------------------------------------------------

-- Ubuntu 16:
-- ~$ sudo apt-get haskell
-- ~$ ghci

-- Ubuntu 14 (c9.io):
-- ~$ sudo apt-get update
-- ~$ sudo apt-get install -y software-properties-common
-- ~$ sudo add-apt-repository -y ppa:hvr/ghc
-- ~$ sudo apt-get update
-- ~$ sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
-- ~$ cat >> ~/.bashrc <<EOF
-- >export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
-- >EOF
-- >export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH
-- ~$ ghci

-- Para usar o Haskell você precisa do seu compilador, chamado GHC, instalado acima.
-- Digitando ghci no terminal, você entra no modo interativo do GHC, similar ao IRB do Ruby. E pode brincar com o haskell interativamente.
-- Dentro do ghci você pode compilar um programa digitando:
-- $ :l Meuprograma
-- Após compilado, caso você queira re-compilar o mesmo programa, pode-se digitar apenas:
-- $ :r
-- Pressionando CTRL-D você pode sair do terminal ghci
-- Após ter compilado o programa, no ghci você pode chamar funções digitando
-- $ nomedaminhafuncao
-- O comando :t, dentro do ghci, inspeciona o tipo de uma função:
-- $ :t nomedaminhafuncao
-- * Importante: sempre rode o ghci DENTRO DA PASTA onde estão os seus programas *

---------------------------------------------------------------------------------------------------------------------

-- Funções e Tipagem (Iniciação) ----------------------------------------------------------------------------------------

-- Haskell é uma linguagem PURAMENTE FUNCIONAL, TUDO é função, e TUDO tem um tipo, podendo estar explícito ou implícito
-- Se você criar uma função sem definir o tipo, o compilador do haskell automaticamente infere um tipo para a sua função.
-- Podemos declarar funções sem tipar explicitamente, mas é BOA PRÁTICA sempre tipar.
-- uma função deve começar SEMPRE com a primeira letra minúscula

-- Apesar de parecer uma atribuição simples a uma variável, para o haskell isso na verdade é uma função que retorna "hello"
-- e apesar de não dizermos o tipo, se você digitar :t hello no ghci após compilar, o haskell irá dizer que hello tem o tipo [Char]
-- hello :: [Char]
hello = "hello"
-- <?php
-- function hello(){ return "hello"; }
um = 1
-- <?php
-- function um(){ return 1; }
dois = 2
-- <?php
-- function dois(){ return 2; }

-- no haskell você pode definir parâmetros de uma maneira super simples
soma x y = x + y
-- <?php
-- function soma($x, $y){ return $x + $y; }
somaUmDois = um + dois
-- <?php
-- function somaumcomdois(){ return um() + dois(); }

-- O operador :: se chama has type
-- Todo tipo começa com a letra maiúscula exceto [] e ()
-- Para tipar uma função em haskell a sintaxe é da seguinte maneira:
-- nomeDaFuncao :: Tipo
-- E em seguida a função
sayHello :: String
sayHello = hello
-- <?php // 7
-- function sayHello():String{ return hello(); }

-- Tipos comuns:
--
-- String
-- Char
-- Int
-- Float
-- Bool
-- [String]
-- [Char]
-- [Int]
-- [Float]
-- [Bool]
-- [Int]
-- (String)
-- (Char)
-- (Int)
-- (Float)
-- (Bool)
-- (Int)
--
-- No haskell String e [Char] significam exatamente a mesma coisa pois toda String também é uma lista de Char.
-- [] significa lista, você pode adicionar ou remover elementos de uma lista dinamicamente, toda lista tem um tipo definido
-- () significa tupla (Tupla é uma lista que tem um tamanho definido, e não pode ser alterado dinamicamente), uma tupla pode ter elementos de vários tipos aleatórios

-- Tipando parâmetros
helloSomeOne :: String -> String
helloSomeOne name = hello ++ " " ++ name
-- <?php // 7
-- function helloSomeOne(String $name):String{ return hello() + " " + $name; }
-- Recebe uma String e um Int, retorna uma String
helloAge :: String -> Int -> String
helloAge name age = hello ++ " " ++ name ++ (show age)
-- <?php // 7
-- function helloSomeOne(String $name, Int $age):String{ return hello() + " Não tem como definir que um array deve ter um determinado tipo específico no php" + $name + (string)$age ; }

-- Listas
-- No haskell você pode definir listas usando os [], toda lista tem um tipo,  você pode adicionar ou remover elementos de uma lista dinamicamente
fourToTen :: [Int]
fourToTen = [4..10]
-- <?php
-- ??
fourToAny :: Int -> [Int]
fourToAny a = [4..a]
-- <?php
-- ??
-- que tal o alfabeto até a primeira letra do seu nome?
alphaMyLetter :: Char -> [Char]
alphaMyLetter p = ['a'.. p]
-- <?php
-- ??
oneTwoThree :: [Float]
oneTwoThree = [1.0, 2.0, 3.0]
-- <?php
-- ??

-- Tuplas
returnTuple :: (Int, Int, Int)
returnTuple = (1,2,3)
-- <?php
-- ??
returnTupleCharInt :: (Int, Char, Float, String)
returnTupleCharInt = (1,'v',3.0,"tchal") -- Repare que characteres tem aspas simples, e Strings ou [Char] sempre terão aspas duplas
-- <?php
-- ??

-- Função com tipos variáveis
getSomething :: x -> x
getSomething x = x
-- <?php // 7
-- function getSomething($x){ return x; }
getSomethingReturnString :: algumtipo -> String
getSomethingReturnString x = "recebo alguma coisa de qualquer tipo e retorno uma string qualquer"
-- <?php // 7
-- function getSomethingReturnString($x):string{ return "recebo alguma coisa de qualquer tipo e retorno uma string qualquer"; }

-- . + * + * . * +
-- Aqui marca o início DA LOUCURA, DAS DORGAS, DO QUE NÃO É MAIS POSSÍVEL PASSAR PARA O PHP e para a maioria das linguagens normais e não FORTEMENTE TIPADAS
-- Podemos definir que uma função vai SEMPRE receber alguma coisa de qualquer tipo, e que SEMPRE vai retornar qualquer coisa que seja numérica, não importa se é Int, Float ou Double
getSomethingReturnOther :: Num outrotipo => umtipo -> outrotipo
getSomethingReturnOther x = 10
-- <?php 
-- ??
-- Podemos definir que uma função vai SEMPRE receber qualquer coisa que seja numérica (Int, Float, Double) e que vai retornar sempre String
getSomethingNumeric :: Num b => b -> String
getSomethingNumeric b = "Recebi alguma porra numérica que eu não sei o que é MAS, COMO eu sei que é numérico, sei que posso contar... " 
-- <?php 
-- ??
-- Bom.. que tal fazer uma função que precisa receber alguma coisa ordenável, ou seja algum tipo que tem uma ordem de valores estabelecida ( Int (1, 2, 3, 4, 5) (Segunda, Terca, Quarta, Quinta) ), dane-se o que
somethingEnum :: Ord tipoqualquerordenavel => tipoqualquerordenavel -> String
somethingEnum n = "String qualquer"
-- <?php 
-- ??
-- Isso é possível no Haskell porque aqui os TIPOS PODEM TER CLASSES (Mas pera lá, aqui as classes não como as de orientação a objetos, mas pode haver uma analogia)
-- alguns 'Type classes' básicos:
--
-- Show -- Tipos com a classe Show pode ser mostrado na tela
-- Eq -- Esse tipo pode ser comparado com operadores lógicos (>,<,==,>=,<=)
-- Ord -- Esse tipo pode ser ordenado ex : um Int pode ser ordenado [1..5] = 1,2,3,4,5
--
-- Existem muito mais 'Type classes', veremos mais tarde.

--------------------------------------------------------------------------------------------------------------------

---------- Compreensão de Listas -----------------------------------------------------------------------------------

-- No haskell existe uma coisa chamada compreensão de listas, ou list comprehension
--
minhaLista :: Int -> [Int]
minhaLista n = [ 2*x | x <- [1..n] ] -- Isto é uma list comprehension, mas o que quer dizer??
-- <?php // 7
--
-- function minhaLista (int $n):array
-- {
--      $result = [];
--      for ($i = 1; $i < $n; $i++) {
--          $result[] = $i * 2;
--      }
--      return $result;
-- }
--
-- // Ou:
--
-- function minhaLista(int $n):array{ array_map(function($x){ return 2*$x; } ,range(1,$n)); }
--
-- R: Multiplique por dois para mim todos os elementos de uma lista de 1 até n numeros
--
-- A compreensão de lista tem o seguinte formato:
--
-- [<Expressão>|<parametro> <- <lista>]
--
-- Ou seja, para cada elemento de uma lista como o parâmetro, o haskell vai executar uma expressão e trocar o valor antigo pelo resultado na lista final.

-- Uma lista comprehension pode ter filtros
queroSoMenorQue5 :: Int -> [Int]
queroSoMenorQue5 n = [ 2*x | x <- [1..n], x < 5] -- Multiplique por 2 para mim, mas apenas os menores que 5 de 1 até n
-- <?php
--
-- function queroSoMenorQue5 (int $n):array
-- {
--      $result = [];
--      for ($i = 1; $i < $n; $i++) {
--
--          if ($i < 5) {  
--
--              $result[] = $i * 2;
--
--          }
--      }
--      return $result;
-- }
--
-- // Ou:
--
-- function queroSoMenorQue5(int $n):array{ array_map(function($x){ return ($x <5)? 2*$x : $x; } ,range(1,$n)); }
--
-- A compreensão de lista com filtros tem o seguinte formato:
--
-- [<Expressão>|<parametro> <- <lista>, <filtro1>, <filtro2>]
--
-----------------------------------------------------------------------------------------------------------------------