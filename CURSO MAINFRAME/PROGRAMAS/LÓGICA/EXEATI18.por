programa
{
	inclua biblioteca Tipos    --> tip
	inclua biblioteca Texto    --> txt
	inclua biblioteca Arquivos --> arq
	
     // Caminho para abrir  arquivo em modo leitura
	cadeia  var_caminho = "C:/Users/roliveira/Desktop/curso/dados/clientes.txt"
	// Variavel para ler linha do arquivo
     inteiro var_func
     cadeia  var_linha
     // Variavel de verificacao se o arquivo existe
     logico  var_tem_arquivo = falso
     // variavel para ler a quantidade de registro no arquivo
     inteiro var_acum_lidos = 0
     inteiro var_acum = 0
     // Variavel para ler saldo do arquivo
     inteiro var_qt = 0
     real    var_saldo = 0.0
 
	funcao inicio() {	
	  inicializar()
	  se(var_tem_arquivo) {
		processar()
	     finalizar()
	  }
     }
	funcao inicializar() {
	  var_tem_arquivo = arq.arquivo_existe(var_caminho)
	  se(var_tem_arquivo) {
	     var_func = arq.abrir_arquivo(var_caminho,arq.MODO_LEITURA)
	  }
	  senao {
	      escreva("Arquivo nao existe")
	  }
     }
	funcao processar() {
	    enquanto(nao arq.fim_arquivo(var_func)){
		   var_linha = arq.ler_linha(var_func)
		   var_qt = txt.numero_caracteres(var_linha)
		
		   se(var_qt > 0) {
	           se (txt.obter_caracter(var_linha,25 ) == 'P' ){
	               escreva(var_linha ,  "\n")
	       
	               var_saldo = var_saldo + tip.cadeia_para_inteiro(txt.extrair_subtexto(var_linha, 10,14 ),10)
	               var_acum++
	           }
	           var_acum_lidos++
	           limpa()
         }
	  }
     }
	funcao finalizar() {
	         escreva("---------------Estatistica----------------\n\n")
		    escreva("Saldo total dos clientes Premium...."  , var_saldo)
		    escreva("\nTotal de registros Premium lidos....", var_acum ,"\n")
		    escreva("------------------------------------------")
		    escreva("\nTotal geral de registros lidos......", var_acum_lidos,"\n")
		    escreva("Fim de arquivo\n")
		    escreva("------------------------------------------")
		    
		    arq.fechar_arquivo(var_func)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 762; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */