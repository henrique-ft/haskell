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
