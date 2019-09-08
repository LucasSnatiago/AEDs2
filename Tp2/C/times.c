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
const int TAMmenor = 1000;

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

//Removedor de tags HTML
void removerTags(char entrada[]){
  bool chaves = true;
  int pos = 0;

  for(int i = 0; i < strlen(entrada) ; i++){
    if(entrada[i] == '<')
      chaves = true;
    if(!chaves){
      entrada[pos] = entrada[i];
      pos++;
    }
    if(entrada[i] == '>')
      chaves = false;
  }
  entrada[pos] = '\0';

  bool Ecomercial = false;
  int pos2 = 0;
  for(int i = 0; i < strlen(entrada); i++){
    if(entrada[i] == '&'){
      Ecomercial = true;
    }
    if(!Ecomercial){
      entrada[pos2] = entrada[i];
      pos2++;
    }
    if(entrada[i] == ';'){
      Ecomercial = false;
    }
  }
  entrada[pos2] = '\0';
}

//Funcao para procurar os itens dos times
bool procurarItens(char entrada[], char procurarInicio[], char procurarFinal[], char resp[]){
  int posI;
  int posF;
  bool encontrar = false;
  encontrar = find(entrada, procurarInicio, &posI);
  if(encontrar){
    find(&entrada[posI], procurarFinal, &posF);
  }
  int j = 0;

  if(encontrar){
    for(int i = posI; i < posI+posF-strlen(procurarFinal); i++){
      resp[j] = entrada[i];
      j++;
    }
    resp[j] = '\0';
}
  removerTags(resp);

  return encontrar;
}


//Funcao para tirar pontuacao da capacidade
void consertarCapacidade(char capacidade[]){
  int pos = 0;

  for(int i = 0; i < strlen(capacidade); i++){
    if(capacidade[i] != ',' && capacidade[i] != '.'){
      capacidade[pos] = capacidade[i];
      pos++;
    }
  }
  capacidade[pos] = '\0';
}

//Funcao para printar as respostas na tela
void printar(char texto[]){

  for(int i = 0; i < strlen(texto); i++){
    printf("%c", texto[i]);
  }
  printf(" ## ");

}


//Funcao para pegar as datas
void resolverDatas(char entrada[]){

  bool parenteses = false;

  for(int i = 0; i < strlen(entrada); i++){
    if(entrada[i] == '('){
      parenteses = true;
    }
  }
} 

/*

  FUNCOES PRINCIPAIS DO PROGRAMA

*/


//Funcao para organizar todo o codigo
//Ordenando as execucoes
void ORQUESTRADOR(char entrada[]){

  //Abrindo arquivo{
  FILE *arq;
  arq = fopen(entrada, "rb");
  char texto[TAM];

  //char texto[TAM];
  char textoLimpo[TAM];

  //Lendo o arquivo
  fread(texto, TAM, sizeof(char), arq);

  //Removendo itens inuteis do texto
  limpandoEntrada(texto, textoLimpo);


  //Procurar itens
  //Variaveis para armazenar as caracteristicas do time
  struct times{
    char nomeTime[TAMmenor];
    char apelidoTime[TAMmenor];
    char nomeEstadio[TAMmenor];
    char tecnico[TAMmenor];
    char liga[TAMmenor];
    char capacidade[TAMmenor];
    char data[TAMmenor];
    long int tamanhoArquivo;
  }time;


  //Funcoes para procurar as caracteristicas dos times
  procurarItens(textoLimpo, "Full name", "</td></tr>", time.nomeTime);
  procurarItens(textoLimpo, "Nickname", "</td></tr>", time.apelidoTime);
  procurarItens(textoLimpo, "Ground", "</td></tr>", time.nomeEstadio);
  if (procurarItens(textoLimpo, "Head coach", "</td></tr>", time.tecnico)){}
  else{ procurarItens(textoLimpo, "Manager", "</td></tr>", time.tecnico);}
  procurarItens(textoLimpo, "League", "</td></tr>", time.liga);
  procurarItens(textoLimpo, "Capacity", "</td></tr>", time.capacidade);
  procurarItens(textoLimpo, "Founded", "</td></tr>", time.data);

  //Descobrir tamanho do Arquivo
  fseek(arq, 0, SEEK_END);
  time.tamanhoArquivo = ftell(arq);

  //Funcao para printar na tela os resultados
  printar(time.nomeTime);
  printar(time.apelidoTime);
  //Printar data!
  printar(time.nomeEstadio);
  consertarCapacidade(time.capacidade);
  printar(time.capacidade);
  printar(time.tecnico);
  printar(time.liga);
  printar(entrada);
  printf(" %li ##", time.tamanhoArquivo);  

  /*
    Nome do time ## Apelido ## dia/mes/ano ## Estadio ## Capacidade ## Tecnico ## Liga ## Arquivo ## Bytes do arquivo ##\n
  */
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
    ORQUESTRADOR(entrada);
    printf("\n");
    fgets(entrada, TAM, stdin);
  }

  return 0;
}
