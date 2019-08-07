#include <stdlib.h>
#include <stdio.h>

//prototipo das funcoes 
int quantasMaiusculas(char *frase, int TAM);
int ehMaiuscula(char letra);
int stringCompare(char *frase1, char *frase2);

int main(){
    const int TAM = 30;
    char frase[TAM];
    char flag[] = "FIM";

    scanf("%[^'\n']s", frase);
    printf("%s\n", frase);
    while(!stringCompare(frase, flag)){
        int numMaiusculas = quantasMaiusculas(frase, TAM);
        printf("%s", frase);
        printf("%i\n", numMaiusculas);
        scanf("%[^'\n']s", frase);
    }

    return 0;
}


int quantasMaiusculas(char *frase, int TAM){
    int quantasMaiusculas = 0;

    for(int i = 0; i < TAM; i++){
        if(ehMaiuscula(frase[i])) quantasMaiusculas++;
    }

    return quantasMaiusculas;
}


int ehMaiuscula(char letra){
    int ehMaiuscula = 0;

    if(letra >= 'A' && letra <= 'Z') ehMaiuscula = 1;

    return ehMaiuscula;
}


int stringCompare(char *frase1, char *frase2){
    int stringCompare = 1;

    for(int i = 0; i < 4; i++){
        if(frase1[i] != frase2[i]) stringCompare = 0;
    }

    return stringCompare;
}
