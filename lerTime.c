#include <stdio.h>
#include <string.h>


//Constantes globais
const int TAM = 1000;


int main(){
	FILE *html;
	char arquivoAtual[TAM];
	char texto[TAM];

	fgets(arquivoAtual, TAM, stdin);	

	int tam = strlen(arquivoAtual);
	arquivoAtual[tam-1] = '\0';

	html = fopen(arquivoAtual, "r");
	fscanf(html, "%s", texto);

		

	fclose(html);
	return 0;
}


void nomeCompletoTime(char arquivoAtual[]){
	char arquivo[TAM];
	char texto[TAM];

	arquivo = fopen(arquivoAtual, "r");
	
	while(!feof(arquivo)){
		if(
	
	}


}
