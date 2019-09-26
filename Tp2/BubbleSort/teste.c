#include <stdio.h>

typedef struct Teste
{
    int a[2];
    int b;
}teste;




int main(){
    teste TESTE[2];
    TESTE[1].a[1] = 1;
    TESTE[1].b = 2;

    TESTE[2].a[1] = 3;
    TESTE[2].b = 4;

    teste tmp = TESTE[1];
    TESTE[1] = TESTE[2];
    TESTE[2] = tmp;

  
    printf("%p\n%p\n", &TESTE[1], &TESTE[1].a);
    printf("%p\n%p\n", &TESTE[1].b, &TESTE[2]);
    printf("%p\n%p\n", &TESTE[2].a, &TESTE[2].b);

}