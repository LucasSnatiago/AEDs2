#include <stdio.h>
#include <stdlib.h>

//Criando a variavel bool
#define bool short
#define true 1
#define false 0


typedef struct celula{
    int elemento;
    struct Celula* prox;
}Celula;


Celula* novaCelula(int elemento){
    Celula* tmp = (Celula*) malloc(sizeof(Celula));
    tmp->elemento = elemento;
    tmp->prox = NULL;
    return tmp;
}


Celula* primeiro;


void start(){
    primeiro = novaCelula(-1);
}


typedef struct fila{
    Celula primeiro;
    Celula ultimo;
}Fila;


void inserir(int elemento){
    
    primeiro->prox = novaCelula(elemento);
    Celula *tmp = primeiro;
    primeiro = primeiro->prox;
    free(tmp);
    
}


int main(){
    int entrada;

    start();

    while(true){
        inserir(2);
    }

    return 0;
}
