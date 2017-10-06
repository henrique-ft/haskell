module Monads where

import Control.Monad

--------------------------------------------------------------------------------
--
-- Mônada ou (Monads) 
--
-- Def: Uma mônada em uma categoria C (hask) é a tripla (m, return, join), onde
--
-- m é um funtor, um tipo de kind  * -> *
-- return é uma transformação natural de tipo a -> m a
-- join é uma transformação natural de tipo m (m a) -> m a
--
-- Uma mônada satisfaz dois axiomas
--
-- Associatividade
-- Elemento neutro
--
-- Uma mônada é um funtor de duas transformações naturais
--
-- Transformações naturais são funções que pulam de um funtor para o outro
--
--
-- Definição arrogante: (rsrs)
--
-- Uma mônado é apenas um monóide na categoria dos endofuntores
--
--------------------------------------------------------------------------------
--

g :: Int -> Maybe Int
g z = Just z >>= \x -> Just (x+1) >>= \y-> Just(x*y) 

-- "Atribuição de variável é o ato de tirar o valor fora da mônada por um tempo"

g1:: Int -> Maybe Int
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