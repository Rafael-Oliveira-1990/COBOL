programa {
	
	// Autor   : Rafael de Oliveira
	// Empresa : Foursys
	// Data    : 20/06/2024
	// objetivo: Criar um algoritmo que mostre os meses e acumule a venda e mostrar estatistica
	
    // Vetor para armazenar as vendas de cada mês
       inteiro vendas[12]
       
    // Variáveis para armazenar o mês informado e para controle do loop7
       inteiro mes
       inteiro i 
       
    // Variável para armazenar o valor da venda do mês
       real valor
       
    // Variáveis para armazenar o total acumulado
       real   totalVendas
       inteiro maiorValor = vendas[0]
       inteiro mesMaior = 1
	
    funcao inicio()
    {
        
        // Inicialização do vetor de vendas com zeros
        para (i = 0 ; i <= 11 ; i ++){
            vendas[i] = 0
        }
            limpa()
            escreva("-----Acumulando Vendas por Mês-----\n\n")
        // Loop para aceitar vendas até que seja informado o mês 99
        enquanto(verdadeiro){
            // Solicita ao usuário o mês da venda ou 99 para sair
            
            escreva("Digite o número do mês (ou 99 para sair): ")
            leia(mes)
             
            se (mes == 99){
                pare
            }
           
            se (mes >= 1 e mes <= 12){
                // Solicita ao usuário o valor da venda
                escreva("Digite o valor da venda para o mês ", mes, ": ")
                leia(valor)
                // Acumula o valor da venda no vetor correspondente ao mês
                vendas[mes - 1] = vendas[mes - 1] + valor
            }               
            senao{
                escreva("Mês inválido. Digite um número de 1 a 12 ou 99 para sair.\n")
            }
        }     limpa()
             escreva("Meses acumulados de Vendas\n\n")
             
        // Mostra os valores acumulados por mês de 1 a 12
        para(i = 0; i <= 11; i++){ 
            escreva( i + 1 ,"° ", "Mês",": R$ ", vendas[i], "\n")
        }
        
        // Calcula o total acumulado de vendas
        totalVendas = 0
        para(i = 0; i <= 11; i++){ 
            totalVendas = totalVendas + vendas[i]
        }
        
        // Mostra o total acumulado
         escreva("--------------------------------------------\n")
        escreva("Total acumulado de vendas: R$ ", totalVendas, "\n")

        // Encontra o mês com maior valor de vendas     
        para(i = 0; i <= 11; i++){ 
            se (vendas[i] > maiorValor){
                maiorValor = vendas[i]
                mesMaior = i + 1
            }
        }

        // Mostra o mês com maior valor de vendas
        
        escreva("Mês com maior valor de vendas: ", mesMaior,"°" , " com R$ ", maiorValor, "\n")
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2668; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */