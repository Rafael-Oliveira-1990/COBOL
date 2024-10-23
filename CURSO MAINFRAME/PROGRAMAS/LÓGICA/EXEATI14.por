programa
{       
	
	// Autor   : Rafael de Oliveira
	// Empresa : Foursys
	// Data    : 20/06/2024
	// objetivo: Dado um número inteiro “x”, obter sua localização no array A (15).
	
     // Variavael de entrada de dados   
	   inteiro x
	   
	// Variavel de atribuicao
	   inteiro A[16]
	   
	// Variaveis de armazenamento
        inteiro posicao
	   inteiro i
	   
	funcao inicio()
     {
        escreva ("Localização de número inteiro no array\n\n")
       
     // Inicialização do array A (exemplo, pode ser substituído pelos valores desejados)
           A[1] = 10
           A[2] = 20
           A[3] = 30
           A[4] = 40
           A[5] = 50
           A[6] = 60
           A[7] = 70
           A[8] = 80
           A[9] = 90
           A[10] = 100
           A[11] = 110
           A[12] = 120
           A[13] = 130
           A[14] = 140
           A[15] = 150

     // Solicita ao usuário para digitar o número inteiro x a ser procurado
        escreva("Digite o numero inteiro x a ser procurado: ")
           leia(x)

           posicao = -1
    // Procura por x dentro do array A
             para(i = 1 ; i <= 15 ; i++){
             	
           	se(A[i] == x){
           	   posicao = i    // Armazena a posição de x no array
               }
       	   }
                   se(posicao != -1){
       		  	  escreva("O numero " , x, " foi encontrado na posico ", posicao)
       		    }
       			 senao{
       			    escreva("O numero ", x, " nao foi encontrado no array.")
       			 }
     }
}
       
	



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 180; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */