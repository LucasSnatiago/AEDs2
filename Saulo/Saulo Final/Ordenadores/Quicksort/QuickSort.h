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
#include "QuickSortSequencial.h"
#include "QuickSortParalelo.h"


void QuickSort(int arranjo[], int tamanhoArranjo){

    printS("Quicksort sequencial:");
    QuickSortSequencial(arranjo, tamanhoArranjo);
    printS("Quicksort paralelo:");
    QuickSortParalelo(arranjo, tamanhoArranjo);
}
