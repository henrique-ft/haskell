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
