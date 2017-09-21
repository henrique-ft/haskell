module Functors where

data Carteira a = Nada | UmItem a | DoisItens a a 

-- Criando instância de funtor para carteira

-- Instancias de funtores geralmente são muito parecidas
-- Seguem o padrão abaixo
instance Functor Carteira where
  fmap _ Nada = Nada
  fmap ab (UmItem a) = UmItem (ab a)
  fmap ab (DoisItens a1 a2) = DoisItens (ab a1) (ab a2)