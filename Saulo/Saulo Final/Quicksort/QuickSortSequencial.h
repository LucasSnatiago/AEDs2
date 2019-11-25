//Biblioteca que contem o QuickSort sequencial

//Bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

//Criando bool
#define bool short
#define true 1
#define false 0


void ordenarSequencial(int arranjo[], int esq, int dir) {
    int i, j, x, y;
     
    i = esq;
    j = dir;
    x = arranjo[(esq + dir) / 2];
     
    while(i <= j) {
        while(arranjo[i] < x && i < dir) {
            i++;
        }
        while(arranjo[j] > x && j > esq) {
            j--;
        }
        if(i <= j) {
            y = arranjo[i];
            arranjo[i] = arranjo[j];
            arranjo[j] = y;
            i++;
            j--;
        }
    }
     
    if(j > esq) {
        ordenarSequencial(arranjo, esq, j);
    }
    if(i < dir) {
        ordenarSequencial(arranjo, i, dir);
    }
}



int QuickSortSequencial(int arranjo[], int tamanhoArranjo){

    double inicio; 
    double fim;
    double tempoTotal;
    double tempoMedio = 0;

    for(int i = 0; i < 10; i++){

        inicio = omp_get_wtime();  //Inicio do cronometro
        ordenarSequencial(arranjo, 0, tamanhoArranjo);  //Ordenando os valores
        fim = omp_get_wtime();  //Fim do cronometro
        tempoTotal = fim - inicio;
        tempoMedio += tempoTotal;

    }

    tempoTotal /= 10;
    bool ordenado = testar(arranjo, tamanhoArranjo);

    escreverValores(tempoTotal, ordenado); 
}
