#include <stdio.h>
#include <string.h>


//Recriando boolean em C
#define bool short
#define true 1
#define false 0



//Constantes globais
const int TAM = 1000;


//Main no final do arquivo


void ORQUESTRADOR(char arquivoAtual[]){  //Funcao para organizar as execucoes do codigo
	FILE *html;
	char arquivoAtual[TAM];
	char texto[TAM];

	fgets(arquivoAtual, TAM, stdin);	

	int tam = strlen(arquivoAtual);
	arquivoAtual[tam-1] = '\0';

	html = fopen(arquivoAtual, "r");
	fscanf(html, "%s", texto);

		

	fclose(html);
}


void nomeCompletoTime(char arquivoAtual[]){  //Procurando o nome do time 
	FILE *arquivo;
	char texto[TAM];

	arquivo = fopen(arquivoAtual, "r");
	
	while(!feof(arquivo)){
	
	}


}


bool ehFim(char entrada[]){
	bool ehfim = true;

	if(entrada[0] != 'F' || entrada[1] != 'I' || entrada[2] != 'M'){
		ehfim = false;
	}

	return ehfim; 
}


int main(){
	char entrada[TAM];
	
	fgets(entrada, TAM, stdin);

	while(!ehFim(entrada)){

		ORQUESTRADOR(entrada);
		fgets(entrada, TAM, stdin);

	}

	return 0;
}