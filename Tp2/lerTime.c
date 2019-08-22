#include <stdio.h>
#include <string.h>
#include <stdlib.h>


//Recriando boolean em C
#define bool short
#define true 1
#define false 0


//Constantes globais
const int TAM = 1000;


//Protoripo das funcoes
void escreverNomeTela(FILE *arquivo);


//Main no final do arquivo
//Orquestrador subistitui a main
void ORQUESTRADOR(char arquivoAtual[]){  //Funcao para organizar as execucoes do codigo
	FILE *html;
	char texto[TAM];

	int tam = strlen(arquivoAtual);
	arquivoAtual[tam-1] = '\0';

	html = fopen(arquivoAtual, "r");
	escreverNomeTela(html);

	fclose(html);
}



void escreverNomeTela(FILE *arquivo){
	char texto[TAM];
	bool lerArquivo = true;
	int contadorLinhas = 0;
	char nome[TAM];
	bool achou = false;


	while(!feof(arquivo) && lerArquivo){
		fscanf(arquivo, "%s", texto);
		for(int i = 0; i < strlen(texto); i++){
			if(texto[i] == 'F' && texto[i+1] == 'u' && texto[i+2] == 'l' && texto[i+3] == 'l'){ //&& texto[i+4] == ' ' && texto[i+5] == 'n' && texto[i+6] == 'a' && texto[i+7] == 'm' && texto[i+8] == 'e'

			}
		}
	}
}



bool Find (char frase[], char texto[]){

	bool encontrou = true;
	int tam = strlen(frase);

	if (strlen(frase) < tam) {

		encontrou = false;
	}
	for (int i = 0; i < tam && encontrou; i++) {

		if (frase[i] != texto[i]) {

			encontrou = false;

		}

	}
	return encontrou;

}



bool ehFim(char entrada[]){
	bool ehfim = true;

	if(entrada[0] != 'F' || entrada[1] != 'I' || entrada[2] != 'M'){
		ehfim = false;
	}

	return ehfim; 
}


int main(){  //Funcao main
	char entrada[TAM];
	
	fgets(entrada, TAM, stdin);

	while(!ehFim(entrada)){

		ORQUESTRADOR(entrada);
		fgets(entrada, TAM, stdin);

	}

	return 0;
}