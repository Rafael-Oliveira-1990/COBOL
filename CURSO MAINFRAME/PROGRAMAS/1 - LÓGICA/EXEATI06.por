programa {
	 // Autor   : Rafael de Oliveira
     // Data    : 24/06/2024
     // Empresa : Foursys
     // objetivo: Crie um algoritmo que receba um número inteiro e retorne verdadeiro
                  // caso o número for PRIMO e falso se o número não for PRIMO.
                 // Lembre-se que um número primo é aquele que é dividido APENAS por um e por ele mesmo.
                 
    // Variáveis globais
    inteiro var_num
    logico var_resultado = verdadeiro

    funcao inicio() {
        // Solicitar um número ao usuário
        escreva("Digite um número inteiro: ")
        leia(var_num)
        
        // Verificar se o número é primo e exibir o resultado
        se (ehPrimo(var_num)) {
            escreva("O número ", var_num, " é primo.\n")
        } senao {
            escreva("O número ", var_num, " não é primo.\n")
        }
    }

    funcao logico ehPrimo(inteiro num) {
        inteiro i
        
        // Números menores que 2 não são primos
        se (num < 2) {
            retorne falso
        }
        
        // Verificar se há divisores além de 1 e do próprio número
        // Percorre de 2 até a raiz quadrada de num
        para (i = 2; i * i <= num; i++) {
            se (num % i == 0) {
                retorne falso
            }
        }
        
        retorne verdadeiro
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 65; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */