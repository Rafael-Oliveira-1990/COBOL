programa
{  
       //Supondo que a população de um país A seja da ordem de 5000 habitantes com uma taxa anual de crescimento 
       //de 3% e que a população de B seja 10000 habitantes com uma taxa de crescimento de 1.5%.
       //Faça um programa que calcule e escreva o número de anos necessários para
      //que a população do país A ultrapasse ou iguale a população do país B, mantidas as taxas de crescimento.

      inteiro a     = 5000
      inteiro b     = 10000
  	 inteiro anos  = 0
  	 
	funcao inicio()
	{
		enquanto(a <b){
		a = a + (a * 5 / 100)
		b = b + (b * 2 / 100)
		anos++
		}
		escreva("Populacao de A sera maior em "  , anos , " anos do que a populacao de  B \n "  )	
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 697; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */