

class AlgebraBooleana{

    public static void main(String[] args){

        String entrada = MyIO.readLine();

        while(!strComp(entrada)){
            orquestrador(entrada);
            entrada = MyIO.readLine();
        }

    }


    public static void orquestrador(String entrada){
        char[] frase = new char[entrada.length()];

        int tam = limparEntrada(entrada, frase);

        for(int i = 0; i < tam; i++){
            System.out.print(frase[i]);
        }
        System.out.println("\nO tamanho do vetor eh " + tam);

    }


    public static int limparEntrada(String fraseSuja, char[] fraseLimpa){
        int contador = 0;
        int inicioAcoes = 0;

        if(fraseSuja.charAt(0) == '2') inicioAcoes = 5;
        if(fraseSuja.charAt(0) == '3') inicioAcoes = 8;

        for(int i = inicioAcoes; i < fraseSuja.length(); i++){
            if(fraseSuja.charAt(i) == 'a'){  //Se for encontrado um and
                fraseLimpa[contador] = 'a';
                i = i + 2;  //Pular a posicao do "nd"
            }
            if(fraseSuja.charAt(i) == 'o'){  //Se for encontrado um or
                fraseLimpa[contador] = 'o';
                i = i + 1;  //Pular a posicao do "r"
            }
            if(fraseSuja.charAt(i) == 'n'){
                fraseLimpa[contador] = 'n';
                i = i + 2; //Pular a posicao do "ot"
            }
            if(fraseSuja.charAt(i) == ' '){
                 //Pular o espaco
            }
            else{
                fraseLimpa[contador] = fraseSuja.charAt(i);
            }
            contador++; //Ir para a proxima posicao do vetor
        }

        return contador;

    }

    
    public static boolean strComp(String entrada){
        boolean ehFim = true;

        if(entrada.charAt(0) != '0'){
            ehFim = false;
        }

        return ehFim;
    }

}