#include <stdio.h>

int main(){
	int precisao = 0.000000001;

	int pi, x, passos, soma, entrada, num_passos;

	printf("Digite o numero de casas decimais de pi (Digite 0 para manter a precisao padrao): ");
	scanf("\n%d", &entrada);
	if(entrada != 0) num_passos = 1.0/entrada;
	else num_passos = 1.0/passos;

	for(i=0; i < num_passos; i++){
   		soma = soma + 4.0/(1.0 + ((i + 0.5)*passo)*((i + 0.5)*passo));
 	}

	printf("%d\n", pi);

	return 0;
}
