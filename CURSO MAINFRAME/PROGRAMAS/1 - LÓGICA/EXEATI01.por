programa
{
	// Autor   : Rafael de oliveira
	// Data    : 11/06/2024
	// empresa : Foursys
	// objetivo: Fazer a leitura de dois numeros (A e B) e informar a soma no console
	
     // Variaveis de entrada de dados
        real var_numA
        real var_numB
        
     // Variaveis de calculo
        real var_res
	
	funcao inicio()
	{
          escreva ("----------Entrada dos numeros 1/2----------\n")
          escreva ("\n")
	      
     // Entrada das variaveis do programa
	            
		escreva("Digite o numero 1 : \n")
		   leia(var_numA)
		escreva("Digite o numero 2 : \n")
		   leia(var_numB)
                 limpa()
		
	     	var_res = var_numA + var_numB // Soma das variaveis (var_numA, var_numB), dando o resultado
		
     // mostrando o o resultado final da soma 
           
          escreva("-----Resultado final----- \n")
          escreva("\n")
          
		escreva("O numero 1 digitado e : " , var_numA , "\n")
		escreva("O numero 2 digitado e : " , var_numB , "\n")
		escreva("O resultado e igual a : " , var_res)
		
		   
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 714; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */