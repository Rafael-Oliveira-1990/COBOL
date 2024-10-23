programa
{
    /* Um caixa eletrônico trabalha com cédulas de 100, 50, 20, 10, 5, 2 e 1. 
       Faça um algoritmo que, a partir do valor de um saque informado,
       obtenha a quantidade mínima de células necessárias, 
       separadas por tipo, para atender ao valor informado pelo cliente.*/

       inteiro saque
    
	funcao inicio()
	{
		escreva("Digite quanto quer sacar ")
		  leia(saque)

          escreva("Numero de cedulas R$ 200: " , saque / 200 , " \n")
          saque = saque%200
          
		escreva("Numero de cedulas R$ 100: " , saque / 100 , " \n")
          saque = saque%100

		escreva("Numero de cedulas R$ 50: " , saque  / 50 , "\n")
		saque = saque%50

		escreva("Numero de cedulas R$ 20: " , saque / 20 , "\n")
		saque = saque%20

		escreva("Numero de cedulas R$ 10 " , saque / 10 , "\n")
		saque = saque%10

		escreva("Numero de cedulas R$ 05 " , saque / 05 , "\n")
		saque = saque%05

		escreva("Numero de ceduals R$ 02 " , saque / 02 , "\n")
		saque = saque%02

		escreva("Numero de saque R$ 01 " , saque / 01 , "\n")
		saque = saque%01 
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 379; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */