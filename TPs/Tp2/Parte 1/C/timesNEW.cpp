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
  int resp = 0;
  char* tmp = (char*) malloc(100 * sizeof(char));

  for(int i = 0; i < strlen(entrada); i++){  //toLowerCase
    if(entrada[i] > 'A' && entrada[i] < 'Z'){
      entrada[i] = (char) entrada[i] + 32;
    }
  }


  if (procurarItens(entrada, "january", "<", tmp) == true) {
  	resp = 1;
	} else if (procurarItens(entrada, "february", "<", tmp) == true) {
		resp = 2;
	} else if (procurarItens(entrada, "march", "<", tmp) == true) {
		resp = 3;
	} else if (procurarItens(entrada, "april", "<", tmp) == true) {
		resp = 4;
	} else if (procurarItens(entrada, "may", "<", tmp) == true) {
		resp = 5;
	} else if (procurarItens(entrada, "june", "<", tmp) == true) {
		resp = 6;
	} else if (procurarItens(entrada, "july", "<", tmp) == true) {
		resp = 7;
	} else if (procurarItens(entrada, "august", "<", tmp) == true) {
		resp = 8;
	} else if (procurarItens(entrada, "september", "<", tmp) == true) {
		resp = 9;
	} else if (procurarItens(entrada, "october", "<", tmp) == true) {
		resp = 10;
	} else if (procurarItens(entrada, "november", "<", tmp) == true) {
		resp = 11;
	} else if (procurarItens(entrada, "december", "<", tmp) == true) {
		resp = 12;
	}

  int pos = 0;
  for(int i = 0; i < strlen(entrada); i++){  //Retirar o mes da contagem
    if(entrada[i] >= 'a' && entrada[i] <= 'z'){
      continue;
    }
    else{
      entrada[pos] = entrada[i];
      pos++;
    }
  }
  entrada[pos] = '\0';

  char ano[4], mes[2], dia[2];
  if(resp < 10){  //Consertar numero do mes
    mes[0] = '0';
    mes[1] = (char) resp + 48;
  }
  else{
    resp -= 10;
    mes[0] = '1';
    mes[1] = (char) resp + 48;
  }

  int cont = 0;
  for(int i = 0; i < strlen(entrada); i++){  //Procurar onde comeca o ano
    if(entrada[i] == ' '){
      cont = i + 1;  //Lugar onde esta o primeiro numero do ano
    }
  }

  //Escrever dia
  dia[0] = '0';
  dia[1] = '0';
  if(cont < 3){
    dia[1] = entrada[0];
  }
  else{
    dia[0] = entrada[0];
    dia[1] = entrada[1];
  }


  ano[0] = entrada[cont];
  ano[1] = entrada[cont+1];
  ano[2] = entrada[cont+2];
  ano[3] = entrada[cont+3];

  /*--- METODO ANTIGO DE PEGAR AS DATAS
  //mes[0] = entrada[5];
  //mes[1] = entrada[6];
  //dia[0] = entrada[0];
  //dia[1] = entrada[1];
  ------------------------------------*/

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


  //Retirando numeros maiores que 12 no mes e maiores que 31 no dia
  int auxDia;
  int auxMes;

  auxDia = ((int)dia[0] - 48) + ((int)dia[1] - 48);
  auxMes = ((int)mes[0] - 48) + ((int)mes[1] - 48);

  if(auxDia > 31 || auxMes > 12 || auxMes == 0){
    entrada[0] = '0';
    entrada[1] = '0';
    entrada[3] = '0';
    entrada[4] = '0';
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

/*
  for(int i = 0; i < strlen(entrada); i++){  //toLowerCase
    if(entrada[i] >= 'A' && entrada[i] <= 'Z'){
      entrada[i] = (char) entrada[i] + 32;
    }
  }
*/

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
  if (procurarItens(textoLimpo, "Head coach", "</td></tr>", time.tecnico)){
  }else{ procurarItens(textoLimpo, "Manager", "</td></tr>", time.tecnico);}
  procurarItens(textoLimpo, "League", "</td></tr>", time.liga);
  procurarItens(textoLimpo, "Capacity", "</td></tr>", time.capacidade);
  procurarItens(textoLimpo, "Founded", "<span", time.data);

  //Descobrir tamanho do Arquivo
  rewind(arq);
  fseek(arq, SEEK_SET, SEEK_END);
  time.tamanhoArquivo = ftell(arq);

  //Formatando prints
  consertarCapacidade(time.capacidade);
  ordenarData(time.data);


  //Funcao para printar na tela os resultados
  printar(time.nomeTime);
  printar(time.apelidoTime);
  printar(time.data);
  printar(time.nomeEstadio);
  printar(time.capacidade);
  printar(time.tecnico);
  printar(time.liga);
  printar(entrada);
  printf(" %ld ## ", time.tamanhoArquivo);


  //Fechando o arquivo
  fclose(arq);

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
