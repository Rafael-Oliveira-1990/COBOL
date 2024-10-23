programa
{
     
     // Autor   : Rafael oliveira
     // Data    : 12/06/2024
     // Empresa : Foursys
     // Objetivo: Aplicar desconto para: estudante (50 reais), trabalhador industria (30 reais)
     // socio clube (80 reais) e aposentados (100 reais)

      
     // Variaveis de entrada de dados
        logico var_cliente
        inteiro valor  = 0
        inteiro desconto = 0
    
     // Variavel de calculo
        inteiro valorfinal =0
    
	funcao inicio()
	{
	   escreva("-----Entrada dos dados-----\n\n")
        // Entrada dos dados do programa
        
        escreva("Escolha o tipo de cliente: (1) Estudante s/n) (2) Trabalhador industria s/n)" )
        escreva( "(3) Socio clube s/n) (4) Aposentado s/n) \n")
          leia(var_cliente)
          
           escreva("valor da hospedagem \n")
		leia(valor)
            limpa()

         escreva("-----Impressao dos dados-----\n\n")
            
	   // Processamento das variaveis de entrada
          escolha(valor)
           {
            caso 1:
             escreva("Estudante \n")
               valorfinal = valor - 50
               escreva("Valor final: " , valorfinal , " \n ")
             pare
              	
             caso 2:
              escreva("Trabalhador industria\n")
                valorfinal = valor - 30
                escreva("valor final: " , valorfinal)
             pare
              	
             caso 3:
              escreva("Socio clube\n")
              	 valorfinal = valor - 80
              	 escreva("valor final: " , valorfinal)
              pare

              caso 4:
              	escreva("Aposentado\n")
              	  valorfinal = valor - 100
              	  escreva("valor final: " , valorfinal)
              	pare
             
               caso contrario:
               escreva("desconto nao e valido")
               pare
              }
        }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 990; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */