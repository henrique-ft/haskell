module Lambdas where

-- Lambdas no haskell são escritas da seguinte maneira:
--
-- (\x y -> x + y) 5 8
--
-- ou 
--
-- let dobro = \x -> 2*x
--
-- Caso o lambda tenha só um parâmetro podemos escreve-lo da maneira reduzida
--
-- (*2)
--
-- O lambda acima é equivalente a (\x -> x*2)

-- HIGH ORDER FUNCTIONS: São funções que:
--
-- 1) Recebem funções como parâmetro
-- 2) Retornam funções

foo :: (Int -> Int) -> Int -> Int
foo f x = x + f 1

goo :: (String -> String) -> String
goo f = f "OLA MUNDO"

-- Nesse caso para chamar a função abaixo deveremos passar mais um valor: 
--
-- (hoo 3) 5
--
-- Pois (hoo 3) retorna uma função que precisa de um argumento, no caso passamos 5 acima

hoo :: Int -> (Int -> Int)
hoo x = \y -> 7*y - x

-- Currying

somar :: Int -> Int -> Int -> Int
somar x y z = x+y+z

-- Se você atribui a função acima como retorno de outra, a outra irá 'segurar' o ultimo parâmetro

f = somar 1 2

-- A partir daí se chamarmos f 3, obteremos o resultado 6
