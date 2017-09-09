
-- A função main é uma função especial para o haskell, e o ghci permite que nos possamos chama-la usando :main
--
-- A função com o nome main é a primeira função a ser executada em um programa com Haskell

main :: IO ()
main = putStrLn (greet "World")

greeting = "Hello, "
greet who = greeting ++ who

-- Para compilar um arquivo de código haskell para um executável podemos utilizar o comando
--
-- stack ghc seuarquivo.hs
--
-- Após feito isso você pode executar o arquivo normalmente, se estiver no linux, pode usar o ./seuarquivo
--
-- Se você verificar o tamanho do executável, verá que é um arquivo muito pesado.
--
-- O que você deve fazer para gerar o programa de uma maneira mais leve é usar os parâmetros a seguir:
--
-- stack ghc -- -dynamic seuarquivo.hs