

public class Palindromo{
    public static void main(String[] args){

        String entrada = MyIO.readLine();
        int tamanho = entrada.length();
        boolean ehPalindromo;
        

        while(!strComp(entrada)){  //Repetir execucao do programa enquanto nao for escrito "FIM"

            ehPalindromo = ehPalindromo(entrada, tamanho);

            escrever(ehPalindromo);

            entrada = MyIO.readLine();
            tamanho = entrada.length();
            
        }

    }


    public static boolean ehPalindromo(String frase, int tamanho){  //Funcao para testar se uma palavra eh palindromo
        boolean ehPalindromo = true;
        int iaux = --tamanho;  //Se a palavra tem 3 letras significa que ela vai de 0 ate 2


        for(int i = 0; i < tamanho; i++){
            if(frase.charAt(i) != frase.charAt(iaux)){
                ehPalindromo = false;
                i = tamanho;
            }
            iaux--;
        }

        return ehPalindromo;
    }


    public static void escrever(boolean ehPalindromo){  //Funcao para escrever na tela se eh palindromo
        if(ehPalindromo){
            MyIO.println("SIM");
        }
        else{
            MyIO.println("NAO");
        }
    }


    public static boolean strComp(String teste){  //Funcao para terminar a execucao do programa ao ser lido "FIM"
        boolean ehFim = true;
        String FIM = "FIM";

        for(int i = 0; i < 3; i++){
            if(FIM.charAt(i) != teste.charAt(i)){
                ehFim = false;
                i = 3;
            }
        }

        return ehFim;
    }
}