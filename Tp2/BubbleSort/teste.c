#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct Teste
{
    int a[2];
    int b;
}teste;

int strNomeRecursivo(char time1[], char time2[], int pos){
    int resp = -1;
    if (time1[pos] < time2[pos])
    {
        resp = 1; //O time 1 vem primeiro na ordem alfabetica
    }
    if (time2[pos] < time1[pos])
    {
        resp = 0; //O time 2 vem primeiro na ordem alafabetica
    }
    if (strlen(time1) < strlen(time2))
    {
        resp = 1;
    }
    if (strlen(time2) < strlen(time1))
    {
        resp = 0;
    }

    if (strlen(time1) < pos && strlen(time2) < pos || resp == -1){
        resp = strNomeRecursivo(time1, time2, pos + 1);
    }

    return resp;
}

int strNome(char time1[], char time2[])
{
    return strNomeRecursivo(time1, time2, 0);
}

int main(){
    
    printf("%d\n", strNome("Thiago", "Thiagos"));

}