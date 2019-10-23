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


double estatico(int LIMITE_MAX) {
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
    #pragma omp parallel for private (contaPrimo) reduction(+:soma) schedule (static,100)
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


double dynamic(int LIMITE_MAX) {
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
    #pragma omp parallel for private (contaPrimo) reduction(+:soma) schedule (dynamic,100)
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


double guided(int LIMITE_MAX) {
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
    #pragma omp parallel for private (contaPrimo) reduction(+:soma) schedule (guided,100)
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
    double Estatico = estatico(2000000);
    double Dinamico = dynamic(2000000);
    double Guiado = guided(2000000);

    double EstaticoDobro = estatico(4000000);
    double DinamicoDobro = dynamic(4000000);
    double GuiadoDobro = guided(4000000);


    printf("Estatico/Dinamico/Guiado com 2000000 testes: %lf\t%lf\t%lf\n", Estatico, Dinamico, Guiado);
    printf("Estatico/Dinamico/Guiado com 4000000 testes: %lf\t%lf\t%lf\n", EstaticoDobro, DinamicoDobro, GuiadoDobro);

    printf("\n");
}
