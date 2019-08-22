#include <stdio.h>

#define bool short
#define true 1
#define false 0

//Prototipo das funcoes
int length(char frase[]);
bool strComp(char frase[]);
int cifrar(char texto[], int cifra);


int main(){
    const short TAM = 1000; 
    char entrada[TAM];
    short cifra = 3;

    fgets(entrada, TAM, stdin);
    int tam = length(entrada);

    while(!strComp(entrada)){  //Executar ate ser lido "FIM"

        cifrar(entrada, cifra);

        fgets(entrada, TAM, stdin);
        tam = length(entrada);
    }
}


int cifrar(char texto[], int cifra){  //Funcao para cifrar o texto
    short tam = length(texto);
    char cifrado;

    for(short i = 0; i < tam; i++){
        cifrado = (char)(texto[i] + cifra);  //Somar a cifra na letra
        printf("%c", cifrado);
    }

    printf("\n");
    return 0;
}


int length(char frase[]){  //Descobrir tamanho da frase
    int tam = 0;

    while(frase[tam] != '\0'){
        tam++;
    }

    tam--; //Retirando o '\0' da contagem

    return tam;
}


bool strComp(char frase[]){  //Comparador de strings com a palavra "FIM"
    bool ehFim = true;
    char FIM[] = "FIM";

    for(int i = 0; i < 3; i++){
        if(frase[i] != FIM[i]){
            ehFim = false;
            i = 3;
        }
    }

    return ehFim;
}