programa
{
     // Autor   : Rafael oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // Objetivo: Crie um algoritmo que receba um número inteiro e retorne verdadeiro caso o número for
     //             positivo e falso se o número for negativo

     // Variaveis de entrada de dados
       inteiro var_num
	  
	funcao inicio()
	{
		inicializar()
		processar()
		finalizar()
	}
	   funcao inicializar(){
	
	// Entrada dos dados do programa
		escreva("Digite um numero\n")
		   leia(var_num)
		escreva("\n")
	   }
	   funcao processar(){
    
     // Processamento se o numero e verdadeiro ou falso
		    se (var_num > 0){
		        escreva ("verdadeiro\n\n")
		     }
		     senao{
		        escreva("falso\n\n")
		     }
	   }
	   funcao finalizar(){
	   	
	 // Mensagem de finalizaocao do programa
	   	escreva("-----Fim do programa-----")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 826; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */