#include <stdio.h>
#include <stdlib.h>

//Bool
#define bool short
#define true 1
#define false 0


typedef struct Arvore{
    int elemento;
    struct Arvore* esq;
    struct Arvore* dir;
}no;

no Arvore;


no* inserirArvore(int elemento, no* i){
    if(i == NULL){
        i = (no*) malloc(sizeof(no));
    }else if(elemento < i->elemento){
        i->esq = inserirArvore(elemento, i->esq);
    }else if(elemento > i->elemento){
        i->dir = inserirArvore(elemento, i->dir);
    }else{
        printf("ERRO!\n");
    }
    return i;
}


no* inserir(int elemento){
    no* i = inserirArvore(elemento, &Arvore);
    
}