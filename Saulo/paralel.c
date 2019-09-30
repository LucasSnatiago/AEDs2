#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

int main(){
	int i;
	#pragma omp parallel
	for(i = 0; i < 5; i++){
	printf("i = %d\n", i);
}
}

