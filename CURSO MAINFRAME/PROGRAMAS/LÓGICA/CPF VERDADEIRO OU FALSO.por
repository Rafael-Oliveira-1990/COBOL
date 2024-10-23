programa
{
	inclua biblioteca Tipos --> tip
	inclua biblioteca Texto --> txt

	cadeia  var_cpf
	inteiro var_digito1
	inteiro var_digito2
	inteiro var_cpf_digitos[11]
	logico  res = falso
	
	
	funcao inicio()
	{
		escreva("Digite os nove numeros do cpf ")
		   leia(var_cpf)

		para(inteiro i = 0; i <= 10; i++){
  var_cpf_digitos[i] = tip.caracter_para_inteiro(txt.obter_caracter(var_cpf, i))
		}
		res = validacpf(var_cpf_digitos)
		se (res == verdadeiro){
			escreva ("Cpf valido \n")
		}   senao{ 
			 escreva("Cpf invalido\n")
		}
	}
	
	funcao logico validacpf(inteiro num[]){
		  inteiro i
		  inteiro j
		  inteiro soma
		  inteiro resto
		  inteiro dv1
		  inteiro dv2

		   soma = 0 
		   j = 10

		   para(i = 0; i < 9; i++){
		   	soma += num[i] * j
		   	j -= 1
		   }
		      resto = soma % 11
		      se(resto < 2){
		      	dv1 = 0
		      }   senao {
		      	dv1 = 11 - resto
		      }

		      soma = 0
		      j = 11 

		       para(i = 0; i < 10; i++){
		   	soma += num[i] * j
		   	j -= 1
		   }
		   resto = soma % 11

		      se(resto < 2){
		      	dv2 = 0
		      }   senao {
		      	dv2 = 11 - resto
		      }

		      se((num[9] == dv1) e (num[10] == dv2)) {
		      	retorne verdadeiro
		      }   senao{ 
		      	retorne falso
		      }
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */