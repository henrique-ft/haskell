module Files where

escreveArquivo :: FilePath -> IO ()
escreveArquivo x = writeFile "seila.txt" x

leArquivo :: FilePath -> IO String
leArquivo x = readFile x