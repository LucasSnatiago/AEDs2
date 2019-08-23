//Importandos as bibliotecas em C
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


//Recriando boolean em C
#define bool short
#define true 1
#define false 0


//Constantes globais
const int TAM = 100000;


bool Find (char frase[], char texto[]){  //Funcao para procurar uma String dentro de um texto
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



bool ehFim(char entrada[]){  //Funcao para ver se esta no fim do arquivo
	bool ehfim = true;

	if(entrada[0] != 'F' || entrada[1] != 'I' || entrada[2] != 'M'){
		ehfim = false;
	}

	return ehfim; 
}


void fullName(char entrada[], char texto[]){
	int pos = 0;

	for (int i = 0; i < strlen(entrada); i++ ){
		printf("%c", entrada[i]);
		if(Find(entrada, "Full name")){
			printf("\n\n%d", i);
			pos = i;
			i = strlen(entrada);
		}
	}

	//for()
	
}



//Funcao que organiza todas as execucoes do codigo
//para a main ficar mais limpa
void ORQUESTRADOR(char html[]){
	
	//Abrindo o arquivo
	
	FILE *arqAtual;
	arqAtual = fopen(html, "r");

	//Recebendo o texto do arquivo

	char texto[TAM];
	bool ehTable = false;


	while(!feof(arqAtual) && !ehTable){

		fread(texto, TAM, sizeof(char), arqAtual);
		if(Find(texto, "<table class=\"infobox vcard\"")){
			ehTable = true;
		}
	}

	//Funcoes principais

	char nomeTime[100];
	fullName(texto, nomeTime);
	

}


//O fgets adiciona uma '\0' no final de cada linha lida
//Estou removendo o '\0' dele e adicionando antes
void consertarFgets(char html[]){
	int tam = strlen(html);
	html[tam-1] = '\0';
}

int main(){  //Funcao main
	char entrada[TAM];
	
	fgets(entrada, TAM, stdin);

	while(!ehFim(entrada)){

		consertarFgets(entrada);
		ORQUESTRADOR(entrada);
		fgets(entrada, TAM, stdin);

	}

	return 0;
}