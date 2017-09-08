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