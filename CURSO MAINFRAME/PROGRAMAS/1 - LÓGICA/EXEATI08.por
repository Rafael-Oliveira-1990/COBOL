programa 
{
    // Autor   : Rafael oliveira
    // Data    : 12/06/2024
    // Empresa : Foursys
    // Objetivo: Aplicar desconto para: estudante (50 reais), trabalhador industria (30 reais)
    // socio clube (80 reais) e aposentados (100 reais). Usar estruturas condicionais para melhorar o algoritmo.

    // Variáveis de entrada de dados
    inteiro var_cliente
    real valor = 0.0
    real desconto = 0.0

    // Variável de cálculo
    real valorfinal = 0.0

    funcao inicio()
    {
        escreva("-----Entrada dos dados-----\n\n")
        
        // Entrada dos dados do programa
        escreva("Digite o valor da hospedagem: ")
        leia(valor)
        
        escreva("Escolha o tipo de cliente:\n")
        escreva("(1) Estudante\n")
        escreva("(2) Trabalhador indústria\n")
        escreva("(3) Sócio clube\n")
        escreva("(4) Aposentado\n")
        leia(var_cliente)

        limpa()

        escreva("-----Impressão dos dados-----\n\n")

        // Processamento das variáveis de entrada
        se (var_cliente == 1) {
            escreva("Estudante\n")
            desconto = 50.0
        }
        senao se (var_cliente == 2) {
            escreva("Trabalhador indústria\n")
            desconto = 30.0
        }
        senao se (var_cliente == 3) {
            escreva("Sócio clube\n")
            desconto = 80.0
        }
        senao se (var_cliente == 4) {
            escreva("Aposentado\n")
            desconto = 100.0
        }
        senao {
            escreva("Tipo de cliente inválido\n")
        }

        // Cálculo do valor final com desconto
        valorfinal = valor - desconto
        
        // Saída do resultado
        escreva("Valor final: ", valorfinal, "\n")
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1738; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */