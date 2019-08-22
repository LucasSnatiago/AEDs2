#include <stdio.h>

#define bool short
#define true 1
#define false 0

//Prototipo das funcoes
int length(char frase[]);
bool ehPalindromo(char frase[]);
bool strComp(char frase[]);


int main(){
    const int TAM = 1000;
    char entrada[TAM];

    fgets(entrada, TAM ,stdin);  //Ler valores
    int tam = length(entrada);  //Contar tamanho da frase recebida
    
    while(!strComp(entrada)){  //Repetir ate ler "FIM"
        if(ehPalindromo(entrada)){
            printf("SIM\n");
        }
        else{
            printf("NAO\n");
        }

        fgets(entrada, TAM ,stdin);
        tam = length(entrada);
    }

}


bool ehPalindromo(char frase[]){  //Verificar se uma palavra eh palindromo
    bool ehPalindromo = true;
    int tamAux = length(frase)-1;  //Se uma palavra tem 3 letras ela vai de 0 ate 2
    int tam =  length(frase);

    for (int i = 0; i < tam/2; i++){
        if(frase[i] != frase[tamAux]){
            ehPalindromo = false;
            i = tam;
        }
        tamAux--;
    }
    

    return ehPalindromo;
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