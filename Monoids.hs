module Monoids where

import Data.Monoid

-- No haskell, as monoids estão no pacote Data.monoid
--
-- Monoid é um type class que implementa uma operação binária chamada Mappend (<>) :: m -> m -> m 
--
-- UMA MONEIDE É UM TYPO MAIS UMA OPERAÇÃO. UM TIPO E UMA OPERAÇÃO QUE IMPLEMENTAM AS CONDIÇÕES ABAIXO:
--
-- Essa operação binária deve estar satisfazendo as seguintes condições (Axiomas):
--
-- Existe um elemento neutro 'e' tal que: 
-- e <> a = a
-- a <> e = a
-- 
-- Associatividade:
-- (a <> b) <> c = a <> (b <> c)
--
-- Para definirmos uma monoide, precisamos mostrar que esta possui um elemento neutro e que é associativo.
--
-- no Haskell o elemento neutro se chama Mempty
--
-- Exemplos de monoid são as operações + e *.
--
-- No exemplo abaixo o tipo é Int e a operação é (+)
--
-- m = Int
--
-- (<>) = (+)
-- Mempty = 0
--
--
-- O haskell trás duas instâncias de monoid prontas para a gente. As monoids (product Int) (sum Int).
--
-- Logo, podemos somar da seguinte maneira:
--
-- Sum 3 <> Sum 4
--
-- Sum 5 <> Sum 2
--
-- Ou multiplicar da seguinte maneira:
--
-- Product 4 <> Product 2
--
-- Product 8 <> Product 5
--
-- As tipo Sum e Product podem receber também uma lista
--
-- Product [1,2,3]
-- 6
--
-- Sum [10,10,5]
-- 25
--

data Or = Or Bool deriving Show

-- Criando uma instância de Monoid para nosso Or
instance Monoid Or where
  mempty = Or False
  mappend (Or False) (Or False) = Or False -- (<>) (Or False) (Or False) = Or False -- Da no mesmo
  mappend _ _ = Or True -- (<>) _ _ = Or True -- Da no mesmo

-- A função mconcat do haskell recebe uma lista de monoids e aplica o mappend em todos