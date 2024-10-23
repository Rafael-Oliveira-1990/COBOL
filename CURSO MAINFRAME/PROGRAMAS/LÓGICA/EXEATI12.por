programa
{
     // Calcular os digitos verificadire do cnpj

     // Declaracao das variaveis de entrada
     inteiro var_cnpj[] = {0,4,8,9,9,3,1,6,0,4,7,9} // Numero do cnpj completo 04.899.316.0479/39
     inteiro var_cnpj1[12]
     inteiro var_cnpj2[13]

     // Variaveis de calculo
     inteiro var_mult1[] = {5,4,3,9,2,9,8,7,6,5,4,3,2}
	inteiro var_mult2[] = {6,5,4,3,2,9,8,7,6,5,4,3,2}

	// Variaveis de calculo
	inteiro var_digito1
	inteiro var_digito2
	inteiro var_soma = 0
	inteiro var_resto

	funcao inicio()
	{
     // Calculo do primeiro digito verificador
         para(inteiro i = 0 ; i < 12 ; i++){
         	  var_soma += (var_cnpj[i] * var_mult1[i])
         }
            var_resto = var_soma % 11
            
            se(var_resto < 2 ){
            	  var_digito1 = 0
            } 
               senao{
            	  var_digito1 = 11 - var_resto

            }

            var_cnpj[11] = var_digito1

            // Calculo do segundo digito verificador
                var_soma = 0
                para(inteiro i = 0 ; i < 12 ; i++){
                	var_soma += (var_cnpj1[i] * var_mult2[i])
                }
                    var_resto = var_soma % 11

                    se(var_resto < 2){
                    	var_digito2 = 0
                    }
                      senao{
                      	var_digito2 = 11 - var_resto
                      }

                      var_cnpj2[12] = var_digito2

                      // Exibição do CNPJ completo com os dígitos verificadores
                      escreva("-----Cnpj com os digitos verificadores-----\n\n")
                      escreva("O cnpj e: ")
                      para(inteiro i = 0 ; i < 13 ; i ++){
                           se(i == 2  ou i == 5){
                           	escreva(".")
                                } senao se (i == 8) {
                                	escreva("/")
                                	
                                }
                                escreva(var_cnpj2[i])
                      
	}}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1602; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */