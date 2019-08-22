#include <stdio.h>

//Prototipos das funcoes
int quantasMaiusculas(char entrada[], int maiusculas, int tam);
int strComp(char entrada[]);


int main(){
    const int TAM = 1000;
    char entrada[TAM];

    fgets(entrada, TAM, stdin);

    while(!strComp(entrada)){
        printf("%d\n", quantasMaiusculas(entrada, 0, 0));
        fgets(entrada, TAM, stdin);
    }
    return 0;
}


int quantasMaiusculas(char *entrada, int maiusculas, int pos){  //Funcao de contar numero de maiusculas em uma frase

    if(entrada[pos] != '\0'){
        if(entrada[pos] >= 'A' && entrada[pos] <= 'Z'){
            maiusculas = quantasMaiusculas(entrada, maiusculas+1, pos+1);
        }
        else{
            maiusculas = quantasMaiusculas(entrada, maiusculas, pos+1);
        }
    }
    
    return maiusculas;
}


int strComp(char entrada[]){  //Funcao para finalizar o programa
    int ehFim = 1;

    if(entrada[0] != 'F' || entrada[1] != 'I' || entrada[2] != 'M'){
        ehFim = 0;
    }

    return ehFim;
}