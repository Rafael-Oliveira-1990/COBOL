programa
{
    // Autor   : Rafael oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // Objetivo: Colocar em ordem crecente tres numeros inteiros distintos.
     

     // Variaveis de entrada de dados
        inteiro var_num1
        inteiro var_num2
        inteiro var_num3
        
    //  Variavel temporaria
        inteiro var_temp
                 
	
	funcao inicio()
	{
        escreva("-----Ordenar 3 numeros-----\n\n")

     // Solicitar os tres numeros ao usuario

        escreva("Digite o primeiro numero \n")
           leia(var_num1)
        escreva("Digite o segunda numero \n")
           leia(var_num2)
         escreva("Digite o terceiro numero \n")
           leia(var_num3) 
             limpa()
     // Ordenar os numeros em ordem crescente

         se (var_num1 > var_num2)
         {
            var_temp = var_num1
            var_num1 = var_num2
            var_num2 = var_temp     	
         }

         se (var_num1 > var_num3)
         {
            var_temp = var_num1
            var_num1 = var_num3
            var_num3 = var_temp	
         }

         se (var_num2 > var_num3)
         {
            var_temp = var_num2
            var_num2 = var_num3
            var_num3 = var_temp
         }
     // Exibir os numeros ordenados 

        escreva("-----Numeros na ordem----- \n\n")

        escreva("Os numeros em ordem crescente são:  " , var_num1 , ", " , var_num2 , ", " , var_num3 , "\n")
        escreva("-------------------------------------------")
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1509; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */