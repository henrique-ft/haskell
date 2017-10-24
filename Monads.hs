module Monads where

import Control.Monad

--------------------------------------------------------------------------------
--
-- Mônada ou (Monads) 
--
-- Uma Monad serve para conseguirmos trazer valores externos(impuros) para trabalharem dentro da nossa aplicação em um contexto monadico(computacional) pré definido através de um funtor (Maybe, por exemplo)
-- sem interferir na pureza do nosso código. E de quebra ainda definir uma estrutura de sequenciamento de funções se assemelhando a programação imperativa
-- Toda monad trabalha no contexto de um funtor(que também pode ser associado a um rótulo)
-- Uma monad é composta por um funtor (tipo de kind * -> *) e duas transformações naturais (join e return)
-- sendo join m ( m a ) -> m a
-- sendo return a -> m a
-- No haskell temos uma função extra para monad chamada bind (>>=) que nada mais é o equivalente a: join (fmap f a)
--
-- Com as monads também temos a validação do nosso código melhorada, se trabalharmos sempre com funções não parciais (que implementam pattern matching para todos os value constructors do tipo)
-- logo, se trabalharmos com monads dentro do contexto do funtor maybe, podemos estar sequenciando funções sempre definindo as validações/retornos esperados em caso de nothing
--
-- Resumindo, monads servem para:
--
-- - Sequenciamento de funções
-- - Trabalhar com valores impuros sem retirar a pureza do código
-- - Trabalhar dentro de um contexto computacional, em outras palavras, dentro de um funtor(rótulo) como o Maybe, que pode ser Just ou Nothing (o nothing pode ser associado a exceptions)
--
--
--------------------------------------------------------------------------------
--

g :: Int -> Maybe Int
g z = Just z >>= \x -> Nothing >>= \y-> Just(x*y)

--
-- O retorno da função g será nothing porque a instância de Monad Maybe trata todos os pattern matchings de Maybe na definição de (>>=)
--
-- | @since 2.01
-- instance  Monad Maybe  where
--     (Just x) >>= k      = k x
--     Nothing  >>= _      = Nothing

--     (>>) = (*>)

--     fail _              = Nothing


-- "Atribuição de variável é o ato de tirar o valor fora da mônada por um tempo"

g1 :: Int -> Maybe Int
g1 z = do
    x <- Just z
    y <- Just (x+1)
    return(x*y) 
    
-- A ÚLTIMA LINHA DO do TEM QUE SER O TIPO DA FUNÇÃO, SEMPRE. NO CASO: Maybe Int.
--
-- o >> é igual a >>= \_ -> just (2+1)
--
-- o >> ignora o retorno da função anterior, e serve para procedimentos, funções que não tem retorno. 
--
-- Por exemplo, você quer printar algo na tela.
--
-- Na notação 'do' o lado esquerdo é 'sem funtor' e o lado direito é 'com funtor'.

recebe :: IO Char
recebe = do
    getChar 
    
recebe2 :: IO ()
recebe2 = recebe >>= \x -> putChar x

-- Programando em haskell, estaremos muitas vezes dentro do contexto de Monads, 
-- ou seja devemos estudar/procurar funções definidas que trabalham(tem o tipo, recebendo ou retornando) com a Monad que estaremos trabalhando.  
--
-- Por exemplo, para ver quais funções podemos usar que trabalham com retorno IO a, para condizer com as funções recebe e recebe2 definidas acima, podemos id no Hoogle:
-- E buscar :: IO a
--
-- https://www.haskell.org/hoogle/?hoogle=%3a%3a+IO+a
--
-- No hoogle estão todas as funções definidas no Haskell