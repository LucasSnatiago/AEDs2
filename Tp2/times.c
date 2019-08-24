//Importando bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

//Criando o tipo boolean
#define bool short
#define true 1
#define false 0

//Constantes globais
const long int TAM = 1000000;


//Funcao para verificar se eh o fim
bool ehFim(char entrada[]){
  bool fim = true;

  if(entrada[0] != 'F' || entrada[1] != 'I' || entrada[2] != 'M'){
    fim = false;
  }

  return fim;
}


//Funcao para encontrar um texto em uma frase
bool find(char texto[], char procura[], int *resp){
  bool encontrar = false;
  long int tam = strlen(texto);
  int tamProcura = strlen(procura);
  int posProcura = -1;

  for(long int i = 0; i < tam; i++){
    if(texto[i] == procura[0]){
      encontrar = true;
      for(int j = 0; j < tamProcura; j++){
        if(texto[i+j] != procura[j]){
          encontrar = false;
          j = tamProcura;
        }
      }
      if(encontrar) posProcura = i;
    }
  }
  *resp = posProcura;
  return encontrar;
}


//Funcao para limpar o html
void limpandoEntrada(char entrada[], char textoLimpo[]){
  int tam = strlen(entrada);
  int posProcura = 0;
  int posFIM = 0;
  int pos = 0;

  find(entrada, "<table", &posProcura);
  find(entrada, "</table>", &posFIM);
  for(int i = posProcura; i < posFIM; i++){
    textoLimpo[pos] = entrada[i];
    pos++;
  }

}


//Funcao para organizar todo o codigo
//Ordenando as execucoes
void ORQUESTRADOR(char entrada[]){

  //Abrindo arquivo{
  FILE *arq;
  arq = fopen(entrada, "r");
  char texto[TAM];
  char textoLimpo[TAM];

  //Lendo o arquivo
  fread(texto, TAM, sizeof(char), arq);


  //Removendo itens inuteis do texto
  limpandoEntrada(texto, textoLimpo);

  for(int i = 0; i < strlen(textoLimpo); i++){
    printf("%c", textoLimpo[i]);
  }

}


//O fgets adiciona um '\0' no final do input
void consertarFgets(char entrada[]){
  int tam = strlen(entrada);
  entrada[tam-1] = '\0';
}


int main(){
  char entrada[TAM];
  fgets(entrada, TAM, stdin);

  while(!ehFim(entrada)){
    consertarFgets(entrada);
    ORQUESTRADOR(entrada);
    fgets(entrada, TAM, stdin);
  }

  return 0;
}
