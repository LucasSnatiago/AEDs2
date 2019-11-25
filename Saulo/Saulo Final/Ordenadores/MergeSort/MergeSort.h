#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

//Criando bool
#define bool short
#define true 1
#define false 0

//Reduzindo funcoes
#define printd(x) printf("%d\n", x)
#define printS(x) printf("%s\n", x)


//Incluindo minhas bibliotecas
#include "MergeSequencial.h"
#include "MergeParalelo.h"

void MergeSort(int arranjo[], int tamanhoArranjo){

    printS("Mergesort Sequencial:");
    MergeSortSequencial(arranjo, tamanhoArranjo);
    printS("Mergesort Paralelo:");
    MergeSortParalelo(arranjo, tamanhoArranjo);

}