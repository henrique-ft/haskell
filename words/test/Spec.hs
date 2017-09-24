-- É a library de testes unitários do Haskell
import Test.Hspec
import Lib

main :: IO ()

-- O dolar ($) é uma função 'sintax sugar' do haskell para remover parenteses
-- A palavra chave 'do' server para sequenciar as coisas, por exemplo
main = hspec $ do -- A partir desse primeiro do teremos uma ou mais descrições do teste
	describe "How to write a test" $ do -- A partir daqui teremos uma ou mais afirmações do teste
		it "Should be able do run tests" $ do -- A partir daqui teremos uma ou mais asserções do teste
			someString `shouldBe` "someString"
			someString `shouldBe` "another String" -- Se colocarmos outra condição o teste falha

-- Sem o dolar ficaria assim:
--main = hspec ( do
--	describe "How to write a test" ( do
--		it "Should be able do run tests" ( do
--			someFunc `sholdBe` "someFunc" )))