public class AlgebraBooleana{

    public static void main(String[] args){

        String entrada = MyIO.readLine();

        while(!strComp(entrada)){
            orquestrador(entrada);
            entrada = MyIO.readLine();
        }

    }


    public static void orquestrador(String entrada){  //Funcao para orquestrar e organizar execucoes de funcoes do programa
        int[] valores = new int[3];
        char[] frase = new char[entrada.length()];
        int resposta;

        lerVariaveis(valores, entrada);
        int tam = limparEntrada(entrada, frase);
        substituirVariaveis(frase, tam, valores);

        resposta = executar(frase, tam); 


        MyIO.println(resposta);

    }


    public static void substituirVariaveis(char[] frase, int tam, int[] valores){  //Substituir as variaveis para seus devidos valores

        for(int i = 0; i < tam; i++){
            if(frase[i] == 'A'){
                frase[i] = (char) valores[0];
            }
            else if(frase[i] == 'B'){
                frase[i] = (char) valores[1];
            }
            else if(frase[i] == 'C'){
                frase[i] = (char) valores[2];
            }
        }

    }


    public static void lerVariaveis(int[] variaveis, String frase){  //Funcao para substituir A,B e C por seus devidos valores
        if(frase.charAt(0) == '2'){
            variaveis[0] = frase.charAt(2);
            variaveis[1] = frase.charAt(4);
        }
        else if(frase.charAt(0) == '3'){
            variaveis[0] = frase.charAt(2);
            variaveis[1] = frase.charAt(4);
            variaveis[2] = frase.charAt(6);
        }
    }


    public static int limparEntrada(String fraseSuja, char[] fraseLimpa){  //Remover itens nao necessarios
        int contador = 0;
        int inicioAcoes = 0;

        if(fraseSuja.charAt(0) == '2') inicioAcoes = 5;
        if(fraseSuja.charAt(0) == '3') inicioAcoes = 8;

        for(int i = inicioAcoes; i < fraseSuja.length(); i++){
            if(fraseSuja.charAt(i) == 'a'){  //Se for encontrado um and
                fraseLimpa[contador] = 'a';
                i = i + 2;  //Pular a posicao do "nd"
            }
            else if(fraseSuja.charAt(i) == 'o'){  //Se for encontrado um or
                fraseLimpa[contador] = 'o';
                i = i + 1;  //Pular a posicao do "r"
            }
            else if(fraseSuja.charAt(i) == 'n'){
                fraseLimpa[contador] = 'n';
                i = i + 2; //Pular a posicao do "ot"
            }
            else if(fraseSuja.charAt(i) == ' '){
                 //Pular o espaco
            }
            else{
                fraseLimpa[contador] = fraseSuja.charAt(i);
            }
            contador++; //Ir para a proxima posicao do vetor
        }

        return contador;

    }


    public static int executar(char[] frase, int tam){
        int resposta = 0;
        int contador = 0;
        int j = 0;
        char tipo = 'c';  //Iniciando variavel com valor nulo
        char[] expressao;
        int i = 0;

        do{
            for(i = 0; i < tam; i++){
                j = i;
                if(frase[i+1] == ')'){
                    while(frase[j-1] != '('){
                        j--;
                        contador++;
                    }
                    tipo = frase[j-1];
                    if(tipo == 'a' && contador > 3){
                        tipo = 'b';
                    }
                }
            }
            contador = 0;

            expressao = new char[i-j];
            for(int k = j; k < i; k++){
                expressao[k-j] = frase[k];
            }

        }while(execucoes(expressao, contador, tipo));


        return resposta;
    }


    public static boolean execucoes(char[] frase, int tamanho, char tipo){
        boolean resp = true;

    
        if(tipo == 'a'){
            Portas.And2(frase);
        }
        else if(tipo == 'b'){
            Portas.And3(frase);
        }
        else if(tipo == 'o'){
            Portas.Or(frase);
        }
        else if(tipo == 'n'){
            Portas.Not(frase);
        }
        else{
            resp = false;
        }

        return resp;
    }

    
    public static boolean strComp(String entrada){  //Funcao para terminar o programa
        boolean ehFim = true;

        if(entrada.charAt(0) != '0'){
            ehFim = false;
        }

        return ehFim;
    }

}




class Portas{

    public static int And2(char[] frase){
        int resp = 0;

        MyIO.print(frase[0] + " " + frase[2]);

        if(frase[0] == '1' && frase[2] == '1'){
            resp = 1;
        }

        return resp;
    }

    public static int And3(char[] frase){
        int resp = 0;

        if(frase[0] == '1' && frase[2] == '1' && frase[4] == '1'){
            resp = 1;
        }

        return resp;
    }

    public static int Or(char[] frase){
        int resp = 0;

        if(frase[0] == '1' || frase[2] == '1'){
            resp = 1;
        }

        return resp;
    }

    public static int Not(char[] frase){
        int resp = 0;

        if(frase[0] == '0'){
            resp = 1;
        }

        return resp;
    }
}