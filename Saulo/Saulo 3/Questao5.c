#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>
#include <float.h>

typedef struct temposGlobais{
  int tipo; //tipo 1 - Dinamico, tipo 2 - Guiado
  double menorTempo;
  int tipoMedio; //tipo 1 - Dinamico, tipo 2 - Guiado
  double menorTempoMedio;
  int melhorChunk;
}Tempo;


int CHUNK = 50;
int LIMITE_MAX = 4000000;

int ehPrimo(long num) {
   long divisor;

   if( num <= 1 )
    return 0;
   else
    if(num > 3){
      if(num % 2 == 0)
        return 0;
      long max_divisor = sqrt(num);
      for(divisor = 3; divisor <= max_divisor; divisor += 2)
	    if (num % divisor == 0)
	       return 0;
    }
   return 1;
}


double dynamic() {
  long contaPrimo;
  long soma;
  int n;
  double inicio = 0;
  double fim = 0;

  if (LIMITE_MAX <= 1)
    soma = 0;
  else {
    soma = 1;
    inicio = omp_get_wtime();
    #pragma omp parallel for private (contaPrimo) reduction(+:soma) schedule (dynamic, CHUNK)
    for (n = 3; n < LIMITE_MAX; n += 2){
      contaPrimo = ehPrimo(n);
      soma = soma + contaPrimo;
    }
    fim = omp_get_wtime();
  }
  double total = fim - inicio;
  //printf("Número total de primos: %ld\n", soma);

  return total;
}


double guided() {
  long contaPrimo;
  long soma;
  int n;
  double inicio = 0;
  double fim = 0;

  if (LIMITE_MAX <= 1)
    soma = 0;
  else {
    soma = 1;
    inicio = omp_get_wtime();
    #pragma omp parallel for private (contaPrimo) reduction(+:soma) schedule (guided, CHUNK)
    for (n = 3; n < LIMITE_MAX; n += 2){
      contaPrimo = ehPrimo(n);
      soma = soma + contaPrimo;
    }
    fim = omp_get_wtime();
  }
  double total = fim - inicio;
  //printf("Número total de primos: %ld\n", soma);

  return total;
}


int main(){

    Tempo tempos;
    tempos.menorTempo = DBL_MAX;
    tempos.melhorChunk;
    tempos.menorTempoMedio = DBL_MAX;

    double dinamico;
    double guiado;
    double dinamicoMedio = 0;
    double guiadoMedio = 0;


    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 10; j++){
        dinamico = dynamic();
        guiado = guided();

        dinamicoMedio += dinamico;
        guiadoMedio += guiado;

        if(dinamico < tempos.menorTempo){
          tempos.tipo = 1;
          tempos.menorTempo = dinamico;
        }
        if(guiado < tempos.menorTempo){
          tempos.tipo = 2;
          tempos.menorTempo = guiado;
        }
        dinamicoMedio /= 10;
        guiadoMedio /= 10;
      }
      if(dinamicoMedio < tempos.menorTempoMedio){
        tempos.tipoMedio = 1;
        tempos.menorTempoMedio = dinamicoMedio;
        tempos.melhorChunk = CHUNK;
      }
      if(guiadoMedio < tempos.menorTempoMedio){
        tempos.tipoMedio = 2;
        tempos.menorTempoMedio = guiadoMedio;
        tempos.melhorChunk = CHUNK;
      }
      CHUNK += 50;
      dinamicoMedio = 0;
      guiadoMedio = 0;
    }

    if(tempos.tipo == 1){
      printf("O melhor tempo em todas as execuções foi do tipo dinamico e levou %lf segundos.\n", tempos.menorTempo);
    }
    else{
      printf("O melhor tempo em todas as execuções foi do tipo guiado e levou %lf segundos.\n", tempos.menorTempo);
    }

    if(tempos.tipoMedio == 1){
      printf("O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo dinamico e levou %lf segundos.\n", tempos.menorTempoMedio);
      printf("A melhor chunk encontrada foi: %d\n", tempos.melhorChunk);
    }
    else{
      printf("O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo guiado e levou %lf segundos.\n", tempos.menorTempoMedio);
      printf("A melhor chunk encontrada foi: %d\n", tempos.melhorChunk);
    }

	return 0;
}


/*
	Questao executada e testada!

	Esses sao alguns resultados obtidos:

	O melhor tempo em todas as execuções foi do tipo guiado e levou 0.175331 segundos.
O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo dinamico e levou 0.019625 segundos.
A melhor chunk encontrada foi: 50

	O melhor tempo em todas as execuções foi do tipo guiado e levou 0.175587 segundos.
O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo dinamico e levou 0.019609 segundos.
A melhor chunk encontrada foi: 200

	O melhor tempo em todas as execuções foi do tipo guiado e levou 0.176249 segundos.
O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo dinamico e levou 0.019716 segundos.
A melhor chunk encontrada foi: 300

	O melhor tempo em todas as execuções foi do tipo dinamico e levou 0.176816 segundos.
O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo guiado e levou 0.019828 segundos.
A melhor chunk encontrada foi: 100

	O melhor tempo em todas as execuções foi do tipo dinamico e levou 0.176763 segundos.
O melhor tempo medio (10 execucoes) em todas as execuções foi do tipo dinamico e levou 0.019723 segundos.
A melhor chunk encontrada foi: 450


*/
