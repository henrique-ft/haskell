module DataTypes where

data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta deriving (Show,Enum)

diaSemana :: DiaSemana -> String
diaSemana Segunda = "Segunda feira"
diaSemana Terca = "Terça feira" 

func1 :: [Char]
func1 = tail (reverse ['a'..'z'])

func2 :: String -> [Char]
func2 "oi" = func1

-- Tipos multiplicativos
--
-- Os tipos multiplicativos são uma tupla disfarçada, são uma tupla "Gourmet"

data Curso = SI | ADS | Log | GE | GP deriving Show

-- Objetos são tuplas
-- Aluno é o value constructor, o resto são campos
-- A representação Aluno carrega String Int Curso

data Aluno = Aluno String Int Curso deriving Show

aniversario :: Aluno -> Aluno
aniversario (Aluno nome idade curso) = (Aluno nome (idade + 1) curso)

transferir :: Aluno -> Aluno
transferir (Aluno nome idade SI) = (Aluno nome idade ADS)
transferir (Aluno nome idade ADS) = (Aluno nome idade SI)
transferir x = x

-- Na prova sempre gosta de dar um exercício para dar tipo e um exercício para dar pattern matching

-- Questão: Faça uma função que receba uma Carta e retorne se ela é preta ou vermelha

-- Na prova vai perguntar: dê o tipo

data Correncia = Libra | Euro | Dollar | Real deriving Show

-- Dinheiro é o tipo, os values contructors são Dinheiro, Moeda e Nada. Os campos dos values contructors Dinheiro e Moeda são Double e Correncia

-- Podemos ter um value contructor com o mesmo nome do tipo

-- data Dinheiro = Dinheiro Double Correncia | Moeda Double Correncia | Nada deriving Show

-- Record Sintax

-- O Record Sintax é o ato de nomear os campos dos tipos. 
-- São os nomes dos campos definidos no tipo, esses nomes agem similarmente aos "Gets" da programação Orientada a Objetos
-- São geradas funções automaticamente para resgatar os values contructors de correncia e valor.
-- As funções são: valor e correncia

data Dinheiro = Dinheiro { valor :: Double, correncia :: Correncia } deriving Show

-- Se você colocar :t correncia, o ghci vai retornar
-- correncia :: Dinheiro -> Correncia
-- A função corrência recebe um dinheiro e retorna uma Correncia

-- Quando usamos Record Sintax, não podemos definir funções com o mesmo nome 
-- correncia = 4

-- Função que converte Dollar para Real

converterReal :: Dinheiro -> Dinheiro
converterReal (Dinheiro x Dollar) = Dinheiro (3.15 * x) Real
converterReal (Dinheiro x Euro) = Dinheiro (3.75 * x) Real
converterReal (Dinheiro x Libra) = Dinheiro (4.02 * x) Real
converterReal x = x -- x = x, o que entra sai

dobraDinheiro :: Dinheiro -> Dinheiro
dobraDinheiro (Dinheiro x y) = Dinheiro (x*2) y

somarDinheiro :: Dinheiro -> Dinheiro -> Dinheiro
somarDinheiro din1 din2 = Dinheiro ( (valor (converterReal din1)) + (valor (converterReal din2)) ) Real

-- Também podemos usar a palavra chave Type, para nomear tipos (facilitar a leitura de uma função por exemplo)

type Inteiro = Integer

-- Se chamarmos no terminal:
--
-- DataTypes> 5 :: Inteiro
-- 5

-- POLIMORFISMO PARAMÉTRICO

-- É um tipo algébrico que pode carregar mais de um outro tipo em sua definição.
-- O 'a' é chamado de TypeParameter
--
-- Todos os tipos tem "kind", quando mais type parameteres, maior o "kind" do tipo.

-- 1 + a + a^2 
data Carteira a = Nada | UmItem a | DoisItens a a 

-- Carteira no caso, tem kind 2, pois recebe um TypeParameter.
--
-- Tipos normais tem Kind 1. Então, tipos com kind 4 tem 3 parâmetros, com king 3 tem dois parâmetro e assim por diante.
--
-- Para conferir o Kind de um tipo no ghci podemos usar o :kind, ou :k
--
-- Tuplas tem Kind 3, e funções também.
--
-- Funções são Tuplas "modificadas geneticamente" pois:
--
-- f x = x*x
-- f 1 = 1
-- f 2 = 4
-- f 3 = 9
--
-- (1,1)
-- (2,4)
-- (3,9)

-- Função parcial:
--
-- Uma função parcial é uma função que não está definida para todos os pattern matching
--
-- Função polimorfica:
--
-- É quando a função é programada independente do valor 'dentro da carteira'
--
-- É quando a função é programada independente do valor dentro do type parameter
--
-- Carteira a
--

mostrarPrimeiro :: Carteira a -> a
mostrarPrimeiro (UmItem x) = x
mostrarPrimeiro (DoisItens x _) = x

mostrar :: Show a => Carteira a -> String
mostrar (UmItem x) = "UmItem: " ++ show x
mostrar (DoisItens x _) = "DoisItens: " ++ show x
mostrar Nada = "Nada"


