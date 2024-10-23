programa
{
	// Autor   : Rafael de Oliveira
	// Empresa : Foursys
	// Data    : 20/06/2024
	// objetivo:Dado um array A com “n” (10 está bom ) números inteiros, obter a média dos elementos pares.
	
     // Variaveis de acumulacao
        inteiro A[11]  // Array com 10 números inteiros
        inteiro i 
        
     // Variável para contar quantos números pares foram encontrados   
        inteiro contador_pares = 0 
        
     // Variaveis de calculo                                                                   
        real media
	   inteiro soma = 0
	   
	funcao inicio(){
		
        escreva("Digite os 10  numeros do Array A: \n")

          para (i = 0 ; i < 10 ; i ++) {
          	
             leia(A[i])  // Lê cada número e armazena na posição i do array A
    
             // Verificar se o numero e par
            se(A[i] % 2 == 0){
            	
           	soma = soma + A[i]    // Acumula a soma dos números pares
         	     contador_pares = contador_pares + 1   // Incrementa o contador de pares
           }
         }  
            // Verifica se existem números pares para calcular a média
	         se(contador_pares > 0){
	         	
                media = soma / contador_pares  // Calcula a média dos números pares
                escreva("A media dos numeros pares e: " , media , "\n")
	         }
                senao{
                	
            	 escreva("Nao foram encontrados numeros pares no Array\n")
             }
	      }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 197; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */