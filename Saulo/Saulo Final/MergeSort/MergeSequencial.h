#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>


void merge(int vetor[], int tamanho) {
  int meio = tamanho / 2;
  int i = 0, j = meio, k = 0;
  int aux[tamanho];

  while( i < meio && j < tamanho ){
    if( vetor[i] <= vetor[j] )
      aux[k] = vetor[i++];
    else
      aux[k] = vetor[j++];
    k++;
  }
 
  if( i == meio )
    while( j < tamanho )
      aux[k++] = vetor[j++];
  else
    while( i < meio )
      aux[k++] = vetor[i++];
 
  for( i = 0; i < tamanho; i++ )
    vetor[i] = aux[i];
}
 
int mergeSort(int vetor[], int tamanho){
	int meio = tamanho / 2;

	if( tamanho > 1 ){
		mergeSort(vetor, meio);
		mergeSort(vetor + meio, tamanho - meio);
		merge(vetor, tamanho);
	}

}


int MergeSortSequencial(int arranjo[], int tamanhoArranjo){

    double inicio; 
    double fim;
    double tempoTotal;
    double tempoMedio = 0;

    for(int i = 0; i < 10; i++){

        inicio = omp_get_wtime();  //Inicio do cronometro
        mergeSort(arranjo, tamanhoArranjo);  //Ordenando os valores
        fim = omp_get_wtime();  //Fim do cronometro
        tempoTotal = fim - inicio;
        tempoMedio += tempoTotal;

    }

    tempoTotal /= 10;
    bool ordenado = testar(arranjo, tamanhoArranjo);

    escreverValores(tempoTotal, ordenado); 	
}