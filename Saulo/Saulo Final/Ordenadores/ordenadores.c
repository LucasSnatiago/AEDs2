//Bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

//Criando bool
#define bool short
#define true 1
#define false 0

//Diminuindo funcoes
#define printS(x) printf("%s\n", x)


void criarValores(int valores[], int tam){
    for(int i = 0; i < tam; i++){
        valores[i] = rand() % tam;
    }
}

bool testar(int arranjo[], int tam){  //Funcao de debug, apenas para testar se o codigo esta ordenando corretamente
    bool ordenado = true;
    for(int i = 0; i < tam-1; i++){
        if(arranjo[i] > arranjo[i+1]){
            ordenado = false;
            i = tam;
        }
    }
    return ordenado;
}


void escreverValores(double tempo, bool ordenado){
    printf("Tempo medio por ordenacao: %lf segundos, Valores ordenados: ", tempo);
    if(ordenado){
        printf("sim!\n");
    }else{
        printf("nao!\n");
    }
}

//Incluindo o mergesort e o quicksort
#include "Quicksort/QuickSort.h"
#include "MergeSort/MergeSort.h"

int main(){

    int tamanhoArranjo = 1000000;
    int arranjo[tamanhoArranjo];

    printS("");
    printS("Quicksort:");
    QuickSort(arranjo, tamanhoArranjo);
    printS("");
    printS("Mergesort:");
    MergeSort(arranjo, tamanhoArranjo);
}