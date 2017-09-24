-- Aqui é como declara um Modulo no haskell.
-- A palavra chave e o nome.
-- Dentro dos parenteses é colocada uma lista de funções a serem exportadas quando esse modulo for carregado por outro.

module Lib
    ( someFunc
    , someString -- Sempre que criamos uma nova função, temos que adiciona-la aqui nos exports
    , grid
    , languages
    , formatGrid
    , outputGrid
    , findWord
    , findWords
    , findWordInLine
    ) where

-- Dizemos que queremos importar o módulo Data.List do haskell, mas apenas a função isInfixOf
import Data.List (isInfixOf)

-- Estamos importando uma função do módulo Data.Maybe do haskell, que recebe uma lista de Maybes e retorna todos os Just
import Data.Maybe(catMaybes)

-- Dizemos ao haskell que quando falarmos grid, estaremos nos referindo a lista de Strings [String]
type Grid = [String]

someFunc :: IO ()
someFunc = putStrLn someString

-- Criamos uma nova função que retorna uma string
someString :: String
someString = "someString"

grid = ["__HASKELL___","__PHP_______","_CSS________","___LARAVEL__","__HTML______","__YESOD_____"]

languages = ["PHP","HASKELL","HTML","CSS","LARAVEL","YESOD"]

-- Essa é uma maneira simplificada de chamar funções
formatGrid :: Grid -> String
formatGrid = unlines

-- A função acima equivale a:
-- formatGrid :: Grid -> String
-- formatGrid lines = unline lines

outputGrid :: Grid -> IO()
outputGrid grid = putStrLn (formatGrid grid)

-- Podemos usar a palavra let dentro de funções para declarar algo como se fosse "variáveis locais"
findWord :: Grid -> String -> Maybe String --findWord :: Grid -> String -> Bool
findWord grid word =
    let lines = grid ++ (map reverse grid) -- Concatena a grid normal, com a grid invertida, para encontrar palavras invertidas também.
        found = or $ map (findWordInLine word) lines
    in if found then Just word else Nothing

-- findWords :: Grid -> [String] -> [Bool]
findWords grid words = 
    let list = map (findWord grid) words
    in catMaybes list

-- Podemos chamar funções que recebem dois argumentos, de maneira infixa, usando `` no nome da função
findWordInLine :: String -> String -> Bool
findWordInLine word line = word `isInfixOf` line

-- A função acimaé equivalente a:
-- findWordInLine :: String -> String -> Bool
-- findWordInLine word line = isInfixOf word line

-- Como no exemplo acima, também podemos chamar essa função de maneira simplificada
-- Quando a entrada da função de retorno bate o haskell atribui automaticamente usando o CURRYING

-- findWordInLine :: String -> String -> Bool
-- findWordInLine = isInfixOf
