programa
{
	// Autor   :
	// Empresa :
	// Data    :
	// Objetivo:
	// Variveis de entrada de dados
	inteiro var_num1 = 0
	inteiro var_num2 = 0
	// Variaveis de calculo
	inteiro var_soma = 0
	// Variaveis de acumulacao
	inteiro var_i = 0
	
	funcao inicio()
	{
	    escreva("-----Algoritmo Soma inteiros Entre dois numeros-----\n\n")

     // Entrada de dados
         escreva("Digite o primeiro número: ")
            leia(var_num1)
         escreva("Digite o segundo número: ")
            leia(var_num2)
            limpa()

     // Laço para somar os números inteiros entre menor e maior
          para (   var_i = var_num1 ; var_i <= var_num2 ; var_i++) {
   
               var_soma = var_soma + var_i
          }
          
         escreva("-----Resultado final da soma-----\n\n")
     // Exibir o resultado
         escreva("A soma de todos os números inteiros entre ", var_num1, " e ", var_num2 , " é: ", var_soma)
         escreva("\n-----------------------------------------------------")
   
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 729; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */