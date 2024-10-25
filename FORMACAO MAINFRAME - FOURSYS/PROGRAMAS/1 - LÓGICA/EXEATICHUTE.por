programa
{
	inclua biblioteca Util --> util

	inteiro numsorteado = Util.sorteia(1, 10)
	inteiro chute = 0
	inteiro tentativas = 0
	
	funcao inicio()
	{
		escreva("-----Tente adivinhar um numero sorteado de 1 a 100-----\n\n")

		   enquanto (chute != numsorteado)      // Loop de chute do jogador
		   {
		   	escreva("Digite o seu chute \n")
		   	   leia(chute)

		   	   se (chute < numsorteado)
		   	   {
		   	   	escreva("O numero sorteado e maior que o seu chute\n\n") // Mensagem se o numerofor maior que o chute
		   	   }
		   	        senao se (chute > numsorteado)       // Mensagem se o numero for menor que o chute
		   	          {
		   	          	escreva("O numero sorteado e menor que o seu chute\n\n")
		   	          }
		   	               tentativas ++
		   }
		           escreva("Paraben voce acertou o numero sorteado " , numsorteado , " em " , tentativas , " tentativas")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 223; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */