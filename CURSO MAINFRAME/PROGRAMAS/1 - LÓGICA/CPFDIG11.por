programa {

	// Autor   : Rafael de Oliveira
     // Empresa : Foursys
     // Data    : 17/06/2024
     // Objetivo: Somar os dois digitos verificadores do "CPF", e mostrar em tela.
	
	inclua biblioteca Tipos    --> tip
	inclua biblioteca Texto    --> txt
	
    
    funcao inicio() {
        // Declaração das variáveis de entrada
        cadeia cpf  
        // Variaveis de acumulacao
        inteiro digito1  
        inteiro digito2  
        inteiro multiplicador = 10
        // Variaveis de calculo
        inteiro soma  = 0
        inteiro resto 
        // Variaveis de apoio 
        inteiro i 
        
        // Entrada de dados (corpo do CPF)
        escreva("Digite os 9 primeiros dígitos do CPF: ")
        leia(cpf)
        
        // Cálculo do primeiro dígito verificador
        para (i=0 ;i<9; i++)  {
        	digito1 = tip.caracter_para_inteiro(txt.obter_caracter(cpf, i))
            soma += digito1 * multiplicador 
            multiplicador -= 1
        }
        resto = soma % 11
        
        se (resto < 2) {
            digito1 = 0
        } senao {
            digito1 = 11 - resto
        }
        
        // Adicionar o primeiro dígito ao CPF
        cpf= cpf  + digito1 
        
        // Zerar a variável soma para cálculo do segundo dígito
        soma = 0
        multiplicador = 11
      
       
        // Cálculo do segundo dígito verificador
        para ( i=0; i<10; i++)  {
        	digito2 = tip.caracter_para_inteiro(txt.obter_caracter(cpf,i))
            soma +=  digito2 * multiplicador 
            multiplicador -= 1
            
        }
        
        resto = soma % 11
        
        se (resto < 2) {
            digito2 = 0
        } senao {
            digito2 = 11 - resto
        }
        
        
        // Exibição dos dígitos verificadores calculados
        escreva("Dígitos verificadores calculados: ", digito1, " e ", digito2)
    }

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 587; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */