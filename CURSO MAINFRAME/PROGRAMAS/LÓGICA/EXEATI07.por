programa
{ 
     // Autor   : Rafael oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // Objetivo: Dada a temperaturade uma pessoa, mostrar sua situação, de acordo com as seguintes faixas de temperatura:
          //Abaixo de 36,5º   hipotermia
         //De 36,6º até 37º   normal
         //De 37º até 38º   estado febril
         //Acima de 38º   febre
         


     // Variaveis de entrada de dados
      real var_temperatura
	
	funcao inicio()
	{
     // Solicitar a temperatura ao usuario
		escreva("Digite a temperatuta \n")
		   leia(var_temperatura)
     // verificar a situacao da temperatura
     se (var_temperatura < 36.5)
        {
        	escreva("Situacao: Hipotermia")
        }
        senao se (var_temperatura >= 36.6 e var_temperatura <=37)
        {
        	escreva("Situacao normal")
        }
           senao se (var_temperatura > 37 e var_temperatura <= 38.8)
           {
           	escreva("Situacao: febril")
           }
              senao se (var_temperatura > 38.0)
              {
              	escreva("Situacao: febre")
              }
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1103; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */