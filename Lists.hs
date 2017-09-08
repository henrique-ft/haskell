module Lists where

--------- LISTAS --------------------------

-- Strings são uma lista de caracteres
--
-- Prelude> :type "Hello"
-- "Hello" :: [Char]
-- Prelude> ['H','e','l','l','o']
-- "Hello"

-- Podemos também ter listas de Números
-- DataStructures> [1,2,3,4]
-- [1,2,3,4] 
-- DataStructures> :type [1,2,3,4]
-- [1,2,3,4] :: Num t => [t]

-- Ou listas de Fractionals
-- DataStructures> [1.0,2.0,3.0]
-- [1.0,2.0,3.0]
-- DataStructures> :type [1.0,2.0,3.0]
-- [1.0,2.0,3.0] :: Fractional t => [t]

-- Podemos ter listas de qualquer tipo

-- O Haskell têm várias funções para trabalhar com listas
--
-- Você pode acha-las nessa página: https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-List.html

-- Também temos ranges, que nos geram listas sem muita dificuldade.
--
-- DataStructures> [1..10]
-- [1,2,3,4,5,6,7,8,9,10]
--
-- Os ranges são bem inteligentes e podem reconhecer padrões:
--
-- DataStructures> [1,2..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
--
-- DataStructures> [2,4..20]
-- [2,4,6,8,10,12,14,16,18,20]

-- O haskell define listas da seguinte maneira:
-- data [] a = [] | a : [a] 
-- 
-- Ṕara listas temos o operador(função) cons (:)
--
-- A função (:), é uma função que pode ser chamada da maneira infixa ( 5 : [0] ) resultando em [5,0]
-- Ela insere um valor em uma lista do mesmo tipo
-- Devemos usa-la sempre com uma lista como argumento final, pois ela requer como segundo argumento, uma lista.
-- Logo:
--
-- 6 : 5 : 4 : 3 : 2 : 1 : []
--
-- Se equivale a:
--
-- [6,5,4,3,2,1]
--
-- Também temos o operador (++)
--
-- Que recebe duas listas do mesmo tipo, e retorna a junção das duas ( [3,4] ++ [5] ) resultando em [3,4,5]