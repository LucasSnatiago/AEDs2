#include <stdio.h>
#include <omp.h>

long long precisao(){
	long double num_passos = 0.000000001;
	char escolha;
	do{
		printf("Deseja alterar a precisao de pi? (Padrao 0.000000001)\n");
		scanf("\n%c", &escolha);
	}while(escolha != 'S' && escolha != 'N' && escolha != 's' && escolha != 'n');

	if(escolha == 'S' || escolha == 's'){
		printf("Digite o valor desejado: ");
		scanf("\n%Lf", &num_passos);
	}
	return 1.0/num_passos;
}


int tamanho(int passos){
	int tamanho = 0;

	for(int i = passos; i > 1; i/=10) tamanho++;

	return tamanho;
}

int main(){
	long long num_passos = precisao();
	double passo;
	int i;
	double x, soma=0.0;
	passo = 1.0/(double)num_passos;

	float inicio = omp_get_wtime();
	#pragma omp parallel for private(x) reduction(+:soma)
	for(i=0; i < num_passos; i++){
	  x = (i + 0.5)*passo;
	  soma = soma + 4.0/(1.0 + x*x);
	}
	float fim = omp_get_wtime();
	float tempo = fim - inicio;

	long double pi = soma*passo;

	printf("O valor de PI é: %.*Lf\n", tamanho(num_passos), pi);
	printf("O tempo gasto na execucao do codigo paralelo foi: %f segundos\n", tempo);
	return 0;
}
