/*

*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//prototipo das funcoes
int quantasMaiusculas(char *frase, int TAM);
int ehMaiuscula(char letra);
int stringCompare(char *frase1, char *frase2);

int main(){
    const int TAM = 50;
    char frase[TAM];
    char flag[] = "FIM";
    int numMaiusculas = 0;
    int tamanhoFrase;

    scanf(" %[^\n]",frase);  //Ler valores 
    tamanhoFrase = strlen(frase);  //Descobrir quantas letras tem na frase
    while(!stringCompare(frase, flag)){  //Repetir ate ser escrito "FIM"
        numMaiusculas = quantasMaiusculas(frase, tamanhoFrase);
        printf("%d\n", numMaiusculas);
        scanf(" %[^\n]",frase);
        tamanhoFrase = strlen(frase);
    }
    return 0;
}


int quantasMaiusculas(char *frase, int TAM){  //Contador de letras maiusculas em uma frase
    int quantasMaiusculas = 0;

    for(int i = 0; i < TAM; i++){
        if(ehMaiuscula(frase[i])){
                quantasMaiusculas++;
        }
    }

    return quantasMaiusculas;
}


int ehMaiuscula(char letra){  //Descobrir se uma letra eh maiuscula
    int ehMaiuscula = 0;

    if(letra >= 'A' && letra <= 'Z'){
	    ehMaiuscula = 1;
    }

    return ehMaiuscula;
}


int stringCompare(char *frase1, char *frase2){  //Comparador de strings (Feito para checar a palavra "FIM")
    int stringCompare = 1;

    for(int i = 0; i < 3; i++){
        if(frase1[i] != frase2[i]) stringCompare = 0;
    }

    return stringCompare;
}
