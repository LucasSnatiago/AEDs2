#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

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

double sequencial() {
  long LIMITE_MAX = 2000000;
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
    for (n = 3; n < LIMITE_MAX; n += 2){
      contaPrimo = ehPrimo(n);
      soma = soma + contaPrimo;
    }
    fim = omp_get_wtime();
  }
  double total = fim - inicio;

  return total;
}


double reduction() {
  long LIMITE_MAX = 2000000;
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
    #pragma omp parallel for private (contaPrimo) reduction(+:soma)
    for (n = 3; n < LIMITE_MAX; n += 2){
      contaPrimo = ehPrimo(n);
      soma = soma + contaPrimo;
    }
    fim = omp_get_wtime();
  }
  double total = fim - inicio;

  return total;
}


int main(){
  double Sequencial = sequencial();
  double Reduction = reduction();

  printf("O speedup entre reduction e sequencial foi de %lf vezes.\n", Sequencial / Reduction);
  return 0;
}
