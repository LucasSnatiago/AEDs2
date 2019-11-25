#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>


void mergesrt(int vetor[], int tamanho) {
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
 
int dividir(int vetor[], int tamanho){
	int meio = tamanho / 2;

	if( tamanho > 1 ){
        #pragma omp parallel sections
        {
            #pragma omp section
		    dividir(vetor, meio);
            #pragma omp section
		    dividir(vetor + meio, tamanho - meio);
            #pragma omp section
		    mergesrt(vetor, tamanho);
        }
    }

}

void escreverValoresMerge(double tempo, bool ordenado, int nested, int threads){
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


int MergeSortParalelo(int arranjo[], int tamanhoArranjo){

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
            for(int stop = 2; stop <= 64; stop*=2){
                for(int i = 0; i < 10; i++){
                    inicio = omp_get_wtime();  //Inicio do cronometro
                    mergesrt(arranjo, tamanhoArranjo);  //Ordenando os valores
                    fim = omp_get_wtime();  //Fim do cronometro
                    tempoTotal = fim - inicio;
                    tempoMedio += tempoTotal;
                }
                tempoMedio /= 10;
                bool ordenado = testar(arranjo, tamanhoArranjo);
                escreverValoresMerge(tempoMedio, ordenado, k ,j);
                tempoMedio = 0; 	
            }
        }
    }    
}