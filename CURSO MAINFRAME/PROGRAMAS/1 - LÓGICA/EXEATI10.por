programa
{
	// Autor   : Rafael de Oliveira
     // Empresa : Foursys
     // Data    : 17/06/2024
     // Objetivo:  Tente adivinhar um numero sorteado de 1 a 10. Enquanto o chute não for igual ao número sorteado,
     // para cada tentativa o jogo avisa se o número é maior ou menor do que o chute. Ao acertar,
     // o programa avisa quantas tentativas foram necessárias para adivinhar.
     
	inclua biblioteca Util --> util

     inteiro var_numsorteado = util.sorteia(01, 10)
     inteiro var_chute = 0
     inteiro var_tentativas = 0
	
	funcao inicio()
	{
	  escreva("--------Jogo da Advinhacao de 1 a 10--------\n\n")
	   
	    enquanto (var_chute != var_numsorteado){ // Loop de chute do jogador
	      
	      escreva("Digite o seu chute \n")
	        leia(var_chute)
             escreva("===================\n")
              limpa()
	         se (var_chute > var_numsorteado) 
	      	{
	      	  escreva("O numero sorteado e menor que o seu chute \n\n") // Mensagem se o numero for maior que o chute
	      	} 
	      	 senao se (var_chute < var_numsorteado)
	      	  {
	      	    escreva("O numero sorteado e maior que o seu chute\n\n") // Mensagem se o numero for menor que o chute
	      	  }
	      	      var_tentativas ++
	      }                                                                // Mensagem se o jogaador acertou o chute
	    escreva("Parabens! voce acertou o numero sorteado " , var_numsorteado , " em " , var_tentativas , " tentativas \n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1132; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */