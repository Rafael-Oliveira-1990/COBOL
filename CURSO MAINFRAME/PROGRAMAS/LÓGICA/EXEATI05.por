programa
{ 
     
     // Autor   : Rafael de Oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // objetivo: Criar um algoritmo que calcule mostra a hora, minuto e segundo
     
     // Variaveis de entrada de dados 
        inteiro var_totalsegundos

     // Variaveis de calculo
        inteiro var_horas
        inteiro var_minutos
        inteiro var_segundos
        
	funcao inicio()
	{
	   escreva("-----Entrada dos dados-----\n\n")
   
     // Solicitar a quantidade total de segundos ao usuario 
        escreva("Digite a quantidade total de segundos: \n")
           leia(var_totalsegundos)
           limpa()
           
     // Calcular a quantidade de horas, minutos e segundos
        var_horas = var_totalsegundos / 3600
        var_totalsegundos = var_totalsegundos % 3600
        var_minutos = var_totalsegundos / 60
        var_segundos = var_totalsegundos % 60

        escreva("-----Saida dos dados-----\n\n")
     // Exibindo o resultado
        escreva("Horas....: ", var_horas ,    "\n")
        escreva("Minutos..: ", var_minutos ,  "\n")
        escreva("segundos.: ", var_segundos , "\n")
         escreva("------------------------")
	} 
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1182; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */