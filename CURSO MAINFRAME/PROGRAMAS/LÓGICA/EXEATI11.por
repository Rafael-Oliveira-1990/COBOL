programa 
{
	// Autor   : Rafael Silva
	// Empresa : Foursys
	// Data    : 19/06/2024
	// Objetivo: Calcular os digitos verificadores do cpf

     // Declaração das variaveis de entrada     
        inteiro cpf[]={3,2,8,1,8,5,5,2,8} // Numero do cpf completo 414.263.088-17
        inteiro cpf1[10]
        inteiro cpf2[11]
        
     // Variaveis de calculo  
        inteiro mult1[]={10,9,8,7,6,5,4,3,2}
        inteiro mult2[]={11,10,9,8,7,6,5,4,3,2}
        
     // Variaveis de armazenamento     
        inteiro digito1  
        inteiro digito2  
        inteiro soma  = 0
        inteiro resto 

     funcao inicio() {
        
        para(inteiro i = 0 ; i < 9 ; i++){
        	  soma += (cpf[i] * mult1[i])
        } 
            resto = soma % 11
            digito1 = 11 - resto

             se (digito1 > 9){
                 digito1 = 0
        }

        para(inteiro i = 0 ; i < 9 ; i++){
        	  cpf1[i] = cpf[i]
        }
            cpf1[9] = digito1

            soma = 0
        para(inteiro i = 0 ; i < 10 ; i++){
        	  soma += (cpf1[i] * mult2[i])
        } 
            resto = soma % 11
            digito2 = 11 - resto

            se (digito2 > 9){
          	 digito2 = 0
        }

        para(inteiro i = 0 ; i < 10 ; i++){
            cpf2[i] = cpf1[i]
        }
            cpf2[10] = digito2

            escreva("O CPF e: ")
         para(inteiro i = 0; i < 11 ; i++){
         	   escreva(cpf2[i])
         }
      }
    }
    
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 216; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */