module Functions where

main :: IO ()
main = putStrLn (greet "World")

greeting = "Hello, "
greet who = greeting ++ who

-- Função para adicionar dois números

-- Recebe dois inteiros e retorna um inteiro
add :: Int -> Int -> Int
add a b = a + b

-- Recebe dois valores de tipos numericos e retorna um valor de tipo númerico
add2 :: Num a => a -> a -> a
add2 a b = a + b

-- As funções no Haskell são como as funções matemáticas 
-- Elas mapeiam valores de um certo tipo para valores de um outro tipo
--
-- Se chamarmos a função add 1 , dessa maneira mesmo, com um parâmetro, o haskell vai entender que á uma função com o tipo
-- add 1 :: Int -> Int
--
-- O haskell carrega os campos que faltam junto com a função, de tal tipo de fizermos (Segura os ultimos parâmetros)
--
-- Essa propriedade se chama Currying
--
-- Logo é correto dizer que addTres é do tipo :: Int -> Int,
-- Pois nesse caso o haskell segurou o ultimo parâmetro de add

addTres :: Int -> Int
addTres = add 3

-- VOCÊ ESTÁ DIZENDO AO HASKELL QUE addTres É IGUAL A add 3 OU SEJA, A FUNÇÃO add COM UM PARÂMETRO PREENCHIDO, PORÉM PRECISANDO DE MAIS UM.
--
-- lOGO A FUNÇÃO addTres TEM O TIPO:
--
-- addTres :: Int -> Int
--
-- QUE É O MESMO TIPO DE add 3
--
-- Prelude> :t add 3
--
-- add 3 :: Int -> Int
--
-- Tudo no Haskell é função, logo add 3 também. add 3 é a função precisando de mais um parâmetro
--

--
-- O (+) Também é uma função, logo podemos fazer somas dessa maneira (+) 4 5
--
-- E também podemos simplificar a função add utilizando a propriedade de Currying
--
sAdd :: Int -> Int -> Int
sAdd a = (+) a
--
-- O ultimo parâmetro pertence ao (+) e o haskell "segurou"
--
-- Para ficar amis simples ainda, podemos fazer
--
ssAdd :: Int -> Int -> Int
ssAdd = (+)
--
--
-- Dizemos que ssAdd é igual a função (+)
-- Ou seja, recebe o mesmo número de argumentos e têm o mesmo comportamento
--
-- Porém deixamos ssAdd com a tipagem mais restrita
-- 
-- A função (+) pode receber qualquer tipo númerico,
--
-- A função que criamos (ssAdd) recebe apenas inteiros
