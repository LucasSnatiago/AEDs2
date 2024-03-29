//Biblioteca que contem o quicksort Paralelo

//Bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>


//Debug
#define debug printf("Debug!!\n")
//#define printdec(x) printf("%d\n")

void swapParallel(int *a, int i, int j)
{
    int t = a[i];
    a[i] = a[j];
    a[j] = t;
}


int partitionParallel(int *a, int left,int right,int pivot)
{
    int pos, i;
    swapParallel(a, pivot, right);
    pos = left;
    for(i = left; i < right; i++)
    {
        if (a[i] < a[right])
        {
            swapParallel(a, i, pos);
            pos++;
        }
    }
    swapParallel(a, right, pos);
    return pos;
}

void quickParallel(int *a, int left, int right, int stop)
{
    if (left < right)
    {
        int pivot = (left + right) / 2;
        int pos = partitionParallel(a,left,right,pivot);
        if (stop > 1) {     // chamadas paralelizadas
		printf("%d\n",stop);
          #pragma omp parallel sections
          {
            #pragma omp section
            quickParallel(a, left, pos - 1, stop/2);
            #pragma omp section
            quickParallel(a, pos + 1, right, stop/2);
          }
        }
        else {              // chamadas sequenciais
          quickParallel(a, left, pos - 1, stop);
          quickParallel(a, pos + 1, right, stop);
        }
    }
}

void quickSeq(int *a, int left, int right)
{
    if (left < right)
    {
        int pivot = (left + right) / 2;
        int pos = partitionParallel(a,left,right,pivot);

        quickSeq(a, left, pos - 1);
        quickSeq(a, pos + 1, right);
    }
}

void escreverValoresCompleto(double tempo, bool ordenado, int nested, int threads){
    printf("Tempo medio por ordenacao: %lf segundos, Valores ordenados: ", tempo);
    if(ordenado){
        printf("sim");
    }else{
        printf("nao");
    }
    printf(", nested: ");
    if(nested){
        printf("sim");
    }
    else{
        printf("nao");
    }
    printf(", threads: %d\n", threads);
}

void QuickSortParalelo(int arranjo[], int tamanhoArranjo){
    
    double inicio; 
    double fim;
    double tempoTotal;
    double tempoMedio = 0;
    int max_threads = omp_get_max_threads();
    int k;

    for(int j = 1; j <= max_threads; j*=2){  //Testando todas as threads
        omp_set_num_threads(j);
        for(k = 0; k <= 1; k++){  //Setar o nested para true or false
            omp_set_nested(k); 
            for(int stop = 2; stop <= 32; stop*=2){  
                //for(int i = 0; i < 10; i++){
                    inicio = omp_get_wtime();  //Inicio do cronometro
                    quickParallel(arranjo, 0, tamanhoArranjo-1, stop);  //Ordenando os valores
                    fim = omp_get_wtime();  //Fim do cronometro
                    tempoTotal = fim - inicio;
                    tempoMedio += tempoTotal;
                //}
            }
            tempoMedio /= 10;
            bool ordenado = testar(arranjo, tamanhoArranjo);
            escreverValoresCompleto(tempoMedio, ordenado, k ,j); 
            tempoMedio = 0;
        }
    }
}
