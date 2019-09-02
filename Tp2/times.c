//Importando bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Criando o tipo boolean
#define bool short
#define true 1
#define false 0

//Constantes globais
const long int TAM = 1000000;
const int TAMmenor = 100;

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
  bool table = true;

  for(long int i = 0; i < tam; i++){
    if(texto[i] == procura[0] && table){
      encontrar = true;
      table = false;
      for(int j = 0; j < tamProcura; j++){
        if(texto[i+j] != procura[j]){
          encontrar = false;
          j = tamProcura;
        }
        else{
          table = true;
        }
      }
    }
    if(encontrar){
      posProcura = i + tamProcura;
      i = tam;
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
  find(&entrada[posProcura], "</table>", &posFIM);
  for(int i = posProcura; i < posFIM; i++){
    textoLimpo[pos] = entrada[i];
    pos++;
  }
}


//Funcao para procurar os itens dos times
void procurarItens(char entrada[], char procurarInicio[], char procurarFinal[], char resp[]){
  int posI;
  int posF;
  find(entrada, procurarInicio, &posI);
  find(&entrada[posI], procurarFinal, &posF);
  int j = 0;

  for(int i = posI; i < posI+posF-strlen(procurarFinal); i++){
    resp[j] = entrada[i];
    j++;
  }
  resp[j] = '\0';
}


//Removedor de tags HTML
void removerTags(char entrada[]){
  bool chaves = false;
  int pos = 0;
  bool espaco = false;

  for(int i = 0; i < strlen(entrada); i++){
    if(entrada[i] == '<'){
      chaves = true;
    }
    if(entrada[i] == '>'){
      entrada[i] = ' ';
      chaves = false;
    }
    if(chaves){
      entrada[i] = ' ';
    }
    if(entrada[i] == '_'){
      entrada[i] = ' ';
    }
  }
}


//Funcao para printar as respostas na tela
void printar(char texto[]){

  for(int i = 0; i < strlen(texto); i++){
    printf("%c", texto[i]);
  }
  printf("\n");

}


void limparData(char data[]){
  for(int i = 0; i < 20; i++){
    if(data[i] == '-'){
      data[i] = ' ';
    }
  }
}


void printarData(char data[]){
  if(strlen(data) == 4){
    for(int i = 0; i < 4; i++){
      printf("%c", data[i]);
    }
    printf(" 01 01\n");
  }
  else{
    printar(data);
  }
}

/*

  FUNCOES PRINCIPAIS DO PROGRAMA

*/


//Funcao para organizar todo o codigo
//Ordenando as execucoes
void ORQUESTRADOR(char entrada[], long int BytesArq){

  //Abrindo arquivo{
  FILE *arq;
  arq = fopen(entrada, "rb");
  //char *texto;
  //texto = (char*)malloc(TAM * sizeof(char)); //Menos Eficiente!
  char texto[TAM];  //Mais eficiente

  //char texto[TAM];
  char textoLimpo[TAM];

  //Lendo o arquivo
  fread(texto, TAM, sizeof(char), arq);

  //Removendo itens inuteis do texto
  limpandoEntrada(texto, textoLimpo);
  //free(texto);


  //Procurar itens
  //Variaveis para armazenar as caracteristicas do time
  char nomeTime[TAMmenor];
  char apelidoTime[TAMmenor];
  char nomeEstadio[TAMmenor];
  char tecnico[TAMmenor];
  char liga[TAMmenor];
  char capacidade[TAMmenor];
  char data[TAMmenor];
  char dia[2];
  char mes[2];
  char ano[4];


  //Funcoes para procurar as caracteristicas dos times
  procurarItens(textoLimpo, "Full name</th><td>", "<", nomeTime);
  procurarItens(textoLimpo, "class=\"nickname\"><i>", "<", apelidoTime);
  procurarItens(textoLimpo, "Ground</th><td class=\"label\"><a href=\"/wiki/", "\"", nomeEstadio);
  procurarItens(textoLimpo, "<td class=\"agent\"><a href=\"/wiki/", "\"", tecnico);
  procurarItens(textoLimpo, "League</th><td><a href=\"/wiki/", "\"", liga);
  procurarItens(textoLimpo, "Capacity</th><td>", "<", capacidade);
  procurarItens(textoLimpo, "bday dtstart published updated\">", "<", data);


  //Funcao para printar na tela os resultados
  printar(nomeTime);
  removerTags(apelidoTime);
  printar(apelidoTime);
  removerTags(nomeEstadio);
  printar(nomeEstadio);
  removerTags(tecnico);
  printar(tecnico);
  removerTags(liga);
  printar(liga);
  printar(capacidade);
  limparData(data);
  printarData(data);
  printf("%li\n", BytesArq);

}

long int quantosBytes(char entrada[]){
  long int BytesArq = 0;
  FILE *arq = fopen(entrada, "rb");
  char texto[TAM];
  fread(texto, TAM, sizeof(char), arq);
  BytesArq = strlen(texto);
  fclose(arq);
  printf("OLHAQGRAnde: %li", BytesArq);
  return BytesArq;
}

//O fgets adiciona um '\0' no final do input
void consertarFgets(char entrada[]){
  int tam = strlen(entrada);
  entrada[tam-1] = '\0';
}


int main(){
  char entrada[TAM];
  fgets(entrada, TAM, stdin);
  int BytesArq = 0;

  while(!ehFim(entrada)){
    consertarFgets(entrada);
    BytesArq = quantosBytes(entrada);
    ORQUESTRADOR(entrada, BytesArq);
    printf("\n");
    fgets(entrada, TAM, stdin);
  }

  return 0;
}
