//Importando bibliotecas basicas
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//Criando o tipo boolean
#define bool short
#define true 1
#define false 0

//Constantes globais
const long int TAM = 1000000;
const int TAMmenor = 1000;
#define tamzinho 300

//Strutura para armazenar os arquivos
typedef struct TIMES{
  char nomes[tamzinho];
  char liga[tamzinho];
}TIMES;

typedef struct Ordem{
  TIMES times;
}Ordem;


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


//Funcao para retirar a tag table de todo o html
void limpandoEntrada(char entrada[], char textoLimpo[]){
  int tam = strlen(entrada);
  int posProcura = 0;
  int posFIM = 0;
  int pos = 0;

  find(entrada, "vcard", &posProcura);
  find(&entrada[posProcura], "</table>", &posFIM);
  for(int i = posProcura; i < posFIM+10000; i++){
    if(entrada[i] == '\n') {continue;}
    textoLimpo[pos] = entrada[i];
    pos++;
  }
}


//Removedor de tags HTML
char* removerTags(char entrada[]){
  bool chaves = true;
  char* string;
  int pos = 0;

  for (int i = 0; i < strlen(entrada); i++)
  {
    if (entrada[i] == '<')
      chaves = true;
    if (!chaves)
    {
      entrada[pos] = entrada[i];
      pos++;
    }
    if (entrada[i] == '>')
      chaves = false;
  }
  entrada[pos] = '\0';

  bool Ecomercial = false;
  int pos2 = 0;
  for (int i = 0; i < strlen(entrada); i++)
  {
    if (entrada[i] == '&')
    {
      Ecomercial = true;
    }
    if (!Ecomercial)
    {
      entrada[pos2] = entrada[i];
      pos2++;
    }
    if (entrada[i] == ';')
    {
      Ecomercial = false;
    }
  }
  entrada[pos2] = '\0';

  string = entrada;
  return string;
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
  strcpy(resp, removerTags(resp));

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


//Funcao para ordenar a data
void ordenarData(char entrada[]){

  char ano[4], mes[2], dia[2];
  ano[0] = entrada[0];
  ano[1] = entrada[1];
  ano[2] = entrada[2];
  ano[3] = entrada[3];
  mes[0] = entrada[5];
  mes[1] = entrada[6];
  dia[0] = entrada[8];
  dia[1] = entrada[9];

  entrada[0] = dia[0];
  entrada[1] = dia[1];
  entrada[2] = '/';
  entrada[3] = mes[0];
  entrada[4] = mes[1];
  entrada[5] = '/';
  entrada[6] = ano[0];
  entrada[7] = ano[1];
  entrada[8] = ano[2];
  entrada[9] = ano[3];
  entrada[10] = '\0';

  //Consertar casos onde nao ha data
  for(int i = 0; i < strlen(entrada); i++){
    if(i == 2 || i == 5){
      //Nao fazer nada
    }
    else{
      if(entrada[i] < '0' || entrada[i] > '9'){
        entrada[i] = '0';
      }
    }
  }

  //Retirando numeros maiores que 12 no mes e maiores que 31 no dia
  int auxDia;
  int auxMes;

  auxDia = ((int)dia[0] - 48) + ((int)dia[1] - 48);
  auxMes = ((int)mes[0] - 48) + ((int)mes[1] - 48);

  if(auxDia > 31 || auxMes > 12){
    entrada[0] = '0';
    entrada[1] = '0';
    entrada[3] = '0';
    entrada[4] = '0';
  }
}


//Funcao para pegar as datas
void resolverDatas(char entrada[]){

  char ano[4], mes[2], dia[2];
  int pos = 0;
  for(int i = 0; i < strlen(entrada); i++){
    if(entrada[i] == '('){
      for(int j = 1; j < strlen(entrada); j++){
        entrada[pos] = entrada[i+j];
        pos++;
        if(entrada[i+j] == ')'){
        j = strlen(entrada);
        i = strlen(entrada);
        }
      }
    }
  }
  entrada[pos-1] = '\0';

  ordenarData(entrada);
}

void printarListaOrdenada(Ordem time[], int quantTimes){
  for (int i = 0; i < quantTimes; i++){
    printf("%s\n", time[i].times.nomes);
  }
}


void bolha(Ordem lista[], int* comparacoes, int* movimentacoes, int tam){
  Ordem aux;
  for(int i = 0; i < tam; i++){
    for(int j = i; j < tam -1; j++){
      comparacoes++;
      if(strcmp(lista[j].times.liga, lista[j+1].times.liga) > 0){
        aux = lista[j];
        lista[j] = lista[j+1];
        lista[j+1] = aux;
        movimentacoes++;
      }
    }
  }
}


/*

  FUNCOES PRINCIPAIS DO PROGRAMA

*/

//Funcao para organizar todo o codigo
//Ordenando as execucoes
void ORQUESTRADOR(char entrada[], Ordem lista[], int listaAtual, bool print){

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

  /*
  //Zerar todas as variaveis
  memset(time.nomeTime, '\0', sizeof(time.nomeTime));
  memset(time.apelidoTime, '\0', sizeof(time.apelidoTime));
  memset(time.nomeEstadio, '\0', sizeof(time.nomeEstadio));
  memset(time.tecnico, '\0', sizeof(time.tecnico));
  memset(time.liga, '\0', sizeof(time.liga));
  memset(time.capacidade, '\0', sizeof(time.capacidade));
  memset(time.data, '\0', sizeof(time.data));
  */

  
  //Descobrir tamanho do Arquivo
  fseek(arq, 0, SEEK_END);
  time.tamanhoArquivo = ftell(arq);
  fseek(arq, 0, SEEK_SET);
  
  //Funcoes para procurar as caracteristicas dos times
  //printf("%s\n\n", textoLimpo);
  procurarItens(textoLimpo, "Full name", "</td></tr>", time.nomeTime);
  procurarItens(textoLimpo, "Nickname", "</td></tr>", time.apelidoTime);
  procurarItens(textoLimpo, "Ground", "</td></tr>", time.nomeEstadio);
  if (procurarItens(textoLimpo, "Manager", "</td>", time.tecnico)){}
  else if (procurarItens(textoLimpo, "Coach", "</td>", time.tecnico)) {}
  else {procurarItens(textoLimpo, "Head coach", "</td>", time.tecnico);}
  procurarItens(textoLimpo, "League", "</td></tr>", time.liga);
  procurarItens(textoLimpo, "Capacity", "</td></tr>", time.capacidade);
  procurarItens(textoLimpo, "Founded", "</td></tr>", time.data);
  //strcpy(time.tecnico, "0");	
 

  //Formatando prints
  consertarCapacidade(time.capacidade);
  resolverDatas(time.data);

  //Funcao para printar na tela os resultados
  if(print){
    printar(time.nomeTime);
    printar(time.apelidoTime);
    printar(time.data);
    printar(time.nomeEstadio);
    printar(time.capacidade);
    printar(time.tecnico);
    printar(time.liga);
    printar(entrada);
    printf(" %ld ## ", time.tamanhoArquivo);
    printf("\n");
  }

  /*
    Nome do time ## Apelido ## dia/mes/ano ## Estadio ## Capacidade ## Tecnico ## Liga ## Arquivo ## Bytes do arquivo ##\n
  */

 /*
	Sortings
 */
  int i;
  for(i = 0; i < strlen(time.tecnico); i++){
    lista[listaAtual].times.liga[i] = time.liga[i];
  }
	lista[listaAtual].times.liga[i] = '\0';
}

void SORT(char entrada[], bool ordenar, Ordem lista[], int listaAtual){
  //Executando os arquivos    
  if(!ordenar)
    ORQUESTRADOR(entrada, lista, listaAtual, false);

  /*-----
  ORDENAR APENAS QUANDO TODOS OS ARQUIVOS FOREM LIDOS
  -------*/

  /*if(ordenar){
    FILE *arq;
    arq = fopen("matrícula_bolha.txt", "wb");

    fprintf(arq, "%s", "650888\t");

    -----
    SORTING
    ------

    int comparacoes = 0;
    int movimentacoes = 0;

    ----------
    CRONOMETRANDO TEMPO DE EXECUCAO DA ORDENACAO
    ----------

    clock_t inicio = clock();

    bolha(lista, &movimentacoes, &comparacoes, listaAtual - 1);

    clock_t final = clock();
    double total = (double) (final - inicio) / CLOCKS_PER_SEC;

    //Numero de comparações (do array)
    fprintf(arq, "%d\t", comparacoes);

    //Numero de movimentações (do array)
    fprintf(arq, "%d\t", movimentacoes);

    //Tempo gasto de execucao
    fprintf(arq, "%lf\t", total);
  }*/
}

//O fgets adiciona um '\0' no final do input
void consertarFgets(char entrada[]){
  int tam = strlen(entrada);
  entrada[tam-1] = '\0';
}


int main(){
  char entrada[TAM];
  fgets(entrada, TAM, stdin);
  //Contador de numero arquivos
  Ordem ordem[TAMmenor];
  int numArquivo = 0;

  while(!ehFim(entrada)){
    consertarFgets(entrada);
    //Escrever nome do arquivo na struct

    //Salvar o nome dos arquivos em uma struct
    strcpy(ordem[numArquivo].times.nomes, entrada);

    SORT(entrada,  false, ordem, numArquivo);
    numArquivo++;
    fgets(entrada, TAM, stdin);
  }

  SORT(entrada, true, ordem, numArquivo);

  for (int i = 0; i < numArquivo; i++)
  {
    ORQUESTRADOR(ordem[i].times.nomes, ordem, i, true);
  }

  return 0;
}
