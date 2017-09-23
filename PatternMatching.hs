module PatternMatching where

-- Pattern Matching ----------------------------------------------------------------------------------------

-- Pattern matching é um conceito da programação funcional que consiste no reconhecimento de padrões
-- Ao definir funções, você pode definir códigos ou retornos específicos para cada padrão. 
-- Isso gera um código mais conciso, simples e legível. 
-- Você pode avaliar qualquer tipo de dado — números, caracteres, listas, tuplas... 
funcCase :: String -> String
funcCase "Segunda" = "Dia da preguiça" 
funcCase "Sexta" = "Dia de maldade" 
-- <?php
-- funcCase(string $x):string {
--
--   switch($x){
--         case "Segunda":
--             return "Dia da preguiça";
--             break;
--         case "Sexta":
--             return "Dia da maldade";
--             break;
--   }
--}
tuplePattern :: (Int,Int) -> String
tuplePattern (1,2) = "Eu sei que é uma tupla de um e dois"
tuplePattern (2,4) = "Eu sei que é uma de tupla de dois e quatro"
tuplePattern (1000,2000) = "Eu sei que é uma tupla de mil e doismil"

tuplePatternTwo :: (Int,Int) -> Int
tuplePatternTwo (a,b) = a+b 

tuplePatternThree :: (Int,Int) -> (Int,Int)
tuplePatternThree (a,b) = (a+a,b+b)

tuplePatternFour :: (Int,Int) -> (Int,Int) -> (Int,Int)
tuplePatternFour (a,b) (c,d) = (a+b, c+d)

-- Em um Pattern Matching você pode usar o _ , _ no haskell significa 'ignore'
tuplePatternIgnore :: (Int,Int) -> (Int,Int) -> (Int,Int)
tuplePatternIgnore (a,_) (c,d) = (a+3000, c+d)

bIgnore :: (a,b) -> a
bIgnore (a,_) = a

ignoreAll :: Int -> Int
ignoreAll _ = 60

-- Nesse caso, a função retorna uma tupla de listas, sendo cada, uma lista de um tipo
lotOfParamnsPattern :: Int -> String -> Float -> Char -> ([Int],[String],[Float],[Char])
lotOfParamnsPattern 2 b c d = ([2*5000],["se o Int for dois vou multiplicar por 2*5000"],[c],[d])
lotOfParamnsPattern a b c d = ([a+1],[b ++ "oi"],[3.9], 'c' : [d])
-- <?php
-- // Não existe tuplas em php

-- O operador : serve para adicionar elementos no começo de uma lista
operatorDotTwo :: [Int] 
operatorDotTwo = 1 : [5]
-- <?php // 7
-- function operatorDotTwo():array{ return array_unshift([5] , 1); }
maria :: String
maria = 'M' : ['a','r','i','a']
-- <?php
-- // o PHP não entende uma string como sendo um array de chars
------------------------------------------------------------------------------------------------------------

-- No Haskell podemos adicionar parâmetros aos nossos DataTypes
-- Inclusive, esses parâmetros podem ser recursivos

data Expression = Number Integer | Add Expression Expression | Subtract Expression Expression deriving (Eq, Ord, Show)

calculate :: Expression -> Integer
calculate (Number x) = x
calculate (Add x y) = (calculate x) + (calculate y)
calculate (Subtract x y) = (calculate x) - (calculate y)

-- Pattern Matching de Listas

-- Se formos fazer uma nova função head, por exemplo, que recebe uma lista e retorna o primeiro elemento
-- Póderíamos fazer dessa maneira:

-- newHead [] = error "Empty list"
-- newHead [a] = a
-- newHead [a, b] = a 
-- newHead [a, b, c] = a 
-- newHead [a, b, c, d] = a

-- Mas teríamos que seguir esse padrão infinitamente.

-- Então uma convenção usada no haskell é colocar o s no final da variável. 
-- Indica que é N possibilidades

newHead [a] -> a
newHead [] = error "empty list"
-- Poderíamos imaginar fazer dessa maneira, porém está errado. 
-- newHead [x:xs] = x
-- Com [x:xs] na verdade estamos dizendo que é uma lista de lista 
-- A maneira certa é a maneira abaixo
newHead (x:xs) = x

newTail [a] -> [a]
newTail [] = error ""
newTail (x:xs) = xs
