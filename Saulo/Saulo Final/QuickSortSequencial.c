#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

//Criando bool
#define bool short
#define true 1
#define false 0

//Constantes globais
const int MAX_THREADS = 1024;


void criarValores(int valores[], int tam){
    for(int i = 0; i < tam; i++){
        valores[i] = rand() % tam;
    }
}


void quickSort(int arranjo[], int esq, int dir) {
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
        quickSort(arranjo, esq, j);
    }
    if(i < dir) {
        quickSort(arranjo, i, dir);
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


int main(){

    int tamanhoArranjo = 1000000;
    int arranjo[tamanhoArranjo];

    double inicio; 
    double fim;
    double tempoTotal;
    double tempoMedio = 0;

    for(int i = 0; i < 10; i++){
        criarValores(arranjo, tamanhoArranjo); //Gerando valores aleatorios para serem ordenados

        inicio = omp_get_wtime();  //Inicio do cronometro
        quickSort(arranjo, 0, tamanhoArranjo);  //Ordenando os valores
        fim = omp_get_wtime();  //Fim do cronometro
        tempoTotal = fim - inicio;
        tempoMedio += tempoTotal;

    }

    tempoTotal /= 10;
    bool ordenado = testar(arranjo, tamanhoArranjo);

    escreverValores(tempoTotal, ordenado);

    
}