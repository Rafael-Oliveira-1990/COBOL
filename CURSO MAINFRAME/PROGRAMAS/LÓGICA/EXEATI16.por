programa
{
       // Autor   : Rafael de oliveira
       // Empresa : Foursys
       // Data    : 20/06/2024
       // Objetivo: Dado um array A com “n” (10 está bom ) números inteiros,
       // obter quantos elementos são maiores que a média aritmética dos valores de A.

       // Variavel de acumulacao
          inteiro var_numero[11] = {20,25,44,33,21,11,22,77,88,99,100}
          inteiro var_acum  = 0
          
       // Variaveis de calculo  
          inteiro var_quant = 0
          inteiro var_media = 0
       
	
	funcao inicio()
	       
	{
		 escreva("-----Soma dos numeros inteiros da media de A-----\n\n")
		para(inteiro i = 0; i <= 10 ;i++){   // Condicao para que contador inicie com 0 va ate 10.
                                               
		var_acum = var_acum + var_numero[i]  // Calculo do acumulado de A.
		 var_quant++
	}
	    var_media =  var_acum / var_quant    // Calculo da media de A.
         var_quant = 0     // Zerando a variavel quantidade.

	    para(inteiro i = 0; i >=10; i++){
	    	se(var_numero[i] > var_media)
	    	var_quant++
	    }
	    escreva("A quantidade dos numeros maiores que a media de A sao:  ", var_media)
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 721; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */