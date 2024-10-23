programa
{
       // Variaveis de entrada
       cadeia   var_produto = " "
	  real     var_valor    = 0.0
	  real     var_frete    = 0.0
	  caracter var_continua = 'S'

	funcao inicio()
	{
	     escreva("-----Entrada dos dados do produto-----\n\n")
	     
	enquanto(var_continua == 'S')
	{
		   escreva("Entre  produto \n")
		      leia(var_produto)
		   escreva("Entre com o valor do produto \n")
		      leia(var_valor)

		   se (var_valor > 79.90)
		   {
		     var_frete = 0.0
		   }
		     senao
		   {
		   	var_frete = var_valor * 0.15
		   }
	           //limpa()	     
	
		   escreva(" -----Calculo de venda do produto-----\n\n")
             escreva("Valor do frete............." , var_frete , " \n")
             escreva("Continua (S/N) ")
                leia(var_continua) 
	}  }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 617; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */