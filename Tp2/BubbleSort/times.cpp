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

//Strutura para armazenar os arquivos
typedef struct TIMES{
  char nomes[1000];
  long int TAMarquivo;
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

/*
	FUNCAO NAO NECESSARIA AINDA!
void ordenadorLista(char listaChar[], int listaInt[]){
	int tam = strlen(listaChar);
	int i;
	for(i = 0; i < tam; i++){
		listaInt[i] = (int) listaChar[i];
	}
	listaInt[i] = '\0';
}
*/

void selectionSorting(Ordem listaOrdenada[], int* movimentacoes, int* comparacoes, int pos){
  int maior = 0;
  for(int i = 0; i < pos; i++){
    if (listaOrdenada[maior].times.TAMarquivo < listaOrdenada[i].times.TAMarquivo){
      maior = i;
    }
    *comparacoes += 1;
  }
  //Swap
  Ordem tmp = listaOrdenada[pos];
  listaOrdenada[pos] = listaOrdenada[maior];
  listaOrdenada[maior] = tmp;
  *movimentacoes += 2;

	if(pos > 0){
    selectionSorting(listaOrdenada, movimentacoes, comparacoes, pos - 1);
  }
}


/*

  FUNCOES PRINCIPAIS DO PROGRAMA

*/

//Funcao para organizar todo o codigo
//Ordenando as execucoes
void ORQUESTRADOR(char entrada[], long int* ordenar, bool print){

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
  fseek(arq, ftell(arq), SEEK_END);
  time.tamanhoArquivo = ftell(arq);

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
	*ordenar = time.tamanhoArquivo;
}

void SORT(char entrada[], long int* tamArq, bool ordenar, Ordem lista[], int numArquivo){
  //Executando os arquivos    
  if(!ordenar) ORQUESTRADOR(entrada, tamArq, false);


  /*-----
  ORDENAR APENAS QUANDO TODOS OS ARQUIVOS FOREM LIDOS
  -------*/

  if(ordenar){
    FILE *arq;
    arq = fopen("matrícula_selecaoRecursiva.txt", "wb");

    fprintf(arq, "%s", "650888\t");

    /*-----
    SORTING
    ------*/

    int comparacoes = 0;
    int movimentacoes = 0;

    /*----------
    CRONOMETRANDO TEMPO DE EXECUCAO DA ORDENACAO
    ----------*/

    clock_t inicio = clock();

    selectionSorting(lista, &movimentacoes, &comparacoes, numArquivo-1);

    clock_t final = clock();
    double total = (double) (final - inicio) / CLOCKS_PER_SEC;

    //Numero de comparações (do array)
    fprintf(arq, "%d\t", comparacoes);

    //Numero de movimentações (do array)
    fprintf(arq, "%d\t", movimentacoes);

    //Tempo gasto de execucao
    fprintf(arq, "%lf\t", total);
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
  //Contador de numero arquivos
  int numArquivo = 0;
  Ordem ordem[TAMmenor];


  while(!ehFim(entrada)){
    consertarFgets(entrada);
    //Escrever nome do arquivo na struct

    //Salvar o nome dos arquivos em uma struct
    int tmp;
    for(tmp = 0; tmp < strlen(entrada); tmp++){
      ordem[numArquivo].times.nomes[tmp] = entrada[tmp];
    }
    ordem[numArquivo].times.nomes[tmp] = '\0';

    SORT(entrada, &ordem[numArquivo].times.TAMarquivo, false, ordem, numArquivo);
    numArquivo++;
    fgets(entrada, TAM, stdin);
  }

  SORT(entrada, &ordem[numArquivo].times.TAMarquivo, true, ordem, numArquivo);

  long int tmp2;
  for(int i = 0; i < numArquivo; i++){
    ORQUESTRADOR(ordem[i].times.nomes, &tmp2, true);
  }

  return 0;
}
