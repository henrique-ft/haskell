module DataTypes where

data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta deriving (Show,Enum)

diaSemana :: DiaSemana -> String
diaSemana Segunda = "Segunda feira"
diaSemana Terca = "Terça feira" 

func1 :: [Char]
func1 = tail (reverse ['a'..'z'])

func2 :: String -> [Char]
func2 "oi" = func1
