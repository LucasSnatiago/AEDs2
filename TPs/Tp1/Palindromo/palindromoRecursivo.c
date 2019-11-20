#include <stdio.h>

#define bool short
#define true 1
#define false 0

//Prototipo das funcoes
int length(char frase[]);
bool ehPalindromo(char frase[], int tam, int pos);
bool strComp(char frase[]);


int main(){
    const int TAM = 1000;
    char entrada[TAM];

    fgets(entrada, TAM ,stdin);  //Ler valores
    int tam = length(entrada);  //Contar tamanho da frase recebida
    
    while(!strComp(entrada)){  //Repetir ate ler "FIM"
        if(ehPalindromo(entrada, length(entrada)-1, 0)){
            printf("SIM\n");
        }
        else{
            printf("NAO\n");
        }

        fgets(entrada, TAM ,stdin);
        tam = length(entrada);
    }

}


bool ehPalindromo(char frase[], int tam, int pos){  //Funcao recursiva para checar se uma frase eh um palindromo
    bool palindromo = true;
    
    if(tam > pos){
        if(frase[tam] != frase[pos]){
            palindromo = false;
            tam = pos;
        } else {
            palindromo = ehPalindromo(frase, tam-1,pos+1);
        }
    }

    return palindromo;
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