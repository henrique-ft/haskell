module Maybe where

---- MAYBE ---------------------------------------------

-- Maybe é um tipo no haskell com a seguinte definição:
--
-- data Maybe a = Nothing | Just a 	-- Defined in ‘GHC.Base’
-- instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Base’
-- instance Monad Maybe -- Defined in ‘GHC.Base’
-- instance Functor Maybe -- Defined in ‘GHC.Base’
-- instance Ord a => Ord (Maybe a) -- Defined in ‘GHC.Base’
-- instance Read a => Read (Maybe a) -- Defined in ‘GHC.Read’
-- instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
-- instance Applicative Maybe -- Defined in ‘GHC.Base’
-- instance Foldable Maybe -- Defined in ‘Data.Foldable’
-- instance Traversable Maybe -- Defined in ‘Data.Traversable’
-- instance Monoid a => Monoid (Maybe a) -- Defined in ‘GHC.Base’
--
-- O Maybe representa um tipo de computação. Ele que pode retornar um valor ou nothing,
-- É utilizado para tornar mais fácil a captura e tratamento de erros, assim como aumentar a consistência do código.
-- O resultado de uma função que utiliza maybe pode ser, just o tipo ou nada. Ou é um Int ou é nada, por exemplo.

-- O MAYBE CONCERTA FUNÇÕES PARCIAIS
--
-- "Uma função parcial é uma função que não está definida para todos os pattern matching"
--
-- O Maybe funciona como exceptions para o Haskell
--
-- A função head do haskell, por exemplo, é uma função parcial e pode causar uma exceptions
--
-- Se colocarmos um head [], (head com lista vazia), não existe como obter retorno.

-- safeHead :: [a] -> Maybe a
-- safeHead [] = Nothing
-- safeHead xs = Just (head xs)

-- O Haskell também tem o Either

-- data Either a b = Left a | Right b
--
-- O Either é melhor do que o maybe para tratamento de erros, pois temos certo Right e errado Left.
--
-- Podemos colocar um Left String com uma mensagem de erro, por exemplo.

-- safeHead' :: [a] -> Either String a
-- safeHead' [] = Left "lista vazia"
-- safeHeas' xs = Right (head xs)
--
--
--