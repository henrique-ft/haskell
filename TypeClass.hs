module TypeClass where

-- No Haskell podemos criar classes de tipos, assim como gerar instâncias das classes para os tipos.

data Compass = North | East | South | West

-- Toda classe de tipo (TypeClass) define funções que devem ser implementada por todas as suas instâncias
-- É similar à classes abstratas na Orientação a Objetos, as funções seriam o equivalente a métodos abstratos
-- Todas os TypeClasses possuem Métodos
--
-- Um exemplo disso é a classe Show, todo tipo que instancia a classe Show, pode ser 'printado no terminal'
-- Na verdade, o que acontece por de 'trás das câmeras' é que show converte os values constructors para String
--
-- Se verificarmos no terminal informações sobre a classe Show, veremos que ela é definida da seguinte maneira:
--
-- class Show a where
--  showsPrec :: Int -> a -> ShowS
--  show :: a -> String
--  showList :: [a] -> ShowS
--
-- Logo, para criarmos uma instância de Show, teremos que escrever os seus métodos
--
-- Os métodos dentro da instância devem ser definidos através de 2 espaços

instance Show Compass where
  show North = "North"
  show East = "East"
  show South = "South"
  show West = "West"

-- A partir do momento que declaramos as intâncias, agora podemos utilizar tranquilamente no terminal da seguinte maneira:
--
-- TypeClass> North
-- North

instance Eq Compass where
  North == North = True
  South == South = True
  East == East = True
  West == West = True

-- Uma maneira simplificada de atribuir instâncias de classes para tipos, é usando a palavra chave deriving.
--
-- Para essas classes de tipos simples, é algo mecânico e repetitivo definir os métodos da instância como no exemplo acima.
--
-- Geralmente todas as instâncias de Eq, por exemplo, terão os métodos da maneira acima.
--
-- Tendo isso em mente, o Haskell ja faz isso para você automaticamente.
-- 
-- Se você não tiver uma comparação muito específica no seu tipo, por exemplo, é mais conveniente criar a instância de Eq com a palavra deriving mesmo

data Meses = Jan | Fev | Mar | Apr | Mai | Jun | Jul | Ago | Set | Out | Nov | Dez 
  deriving (Eq, Show, Enum, Ord)

-- No Haskell podemos adicionar parâmetros aos nossos DataTypes
-- Inclusive, esses parâmetros podem ser recursivos

data Expression = Number Integer | Add Expression Expression | Subtract Expression Expression deriving (Eq, Show)

-- Este exemplo é a criação de uma instância de num para o tipo algébrico Expression

instance Num Expression where
  (+) (Number a) (Number b) = Number (a + b)
  (-) (Number a) (Number b) = Number (a - b)
  (*) (Number a) (Number b) = Number (a * b)
  negate (Number a) = Number (negate a)
  abs (Number a) = Number (abs a)
  signum (Number a) = Number (signum a)
  fromInteger a = (Number a)
  
-- Criando instâncias para tipos com polimorfismo paramétrico

data Carteira a = Nada | UmItem a | DoisItens a a 

mostrarPrimeiro :: Carteira a -> a
mostrarPrimeiro (UmItem x) = x
mostrarPrimeiro (DoisItens x _) = x

mostrar :: Show a => Carteira a -> String
mostrar (UmItem x) = "UmItem: " ++ show x
mostrar (DoisItens x _) = "DoisItens: " ++ show x
mostrar Nada = "Nada"

-- Show a -> Show para a
-- Show (Carteira a) -> Show para Carteira que possui um a
--
-- Aqui criamos uma instância de Show para (Carteira a) sendo o tipo 'a' uma instância de Show
--
-- Para toda carteira 'a' em que o tipo 'a' tiver instância de Show, teremos essa instância

instance Show a => Show (Carteira a) where
  show Nada = "nada"
  show (UmItem x) = ""
  show (DoisItens x y) = ""

-- Dessa mesma maneira, podemos criar instâncias de Show para Carteira Int, Carteira String, Carteira QualquerTipo, etc ..

