programa
{
     // Autor   : Rafael de Oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // objetivo: Multiplicar o raio de um circulo ao quadrado

     // Variaveis de entrada de dados
        real var_raio
   
     // Variavel de calculo
        const real PI = 3.1416 // PI usado como contante do tipo real
        real var_area
	
	funcao inicio()
	{
	   escreva("-----Entrada dos dados-----\n\n")

	// Solicitar o raio ao usuario
	   escreva("Digite o raio do circulo\n")
	      leia(var_raio)
           limpa()
           
	// Calcular a area do circulo
	   var_area = PI * var_raio * var_raio

	// Exibir a area do circulo
	   escreva("-----Exibindo o resultado-----\n\n")
	   
	   escreva("A area do circulo e: ", var_area , "\n")
	   escreva("------------------------------")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 709; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */