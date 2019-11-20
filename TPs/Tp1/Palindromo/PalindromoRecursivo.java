

public class PalindromoRecursivo{
    public static void main(String[] args){

        String entrada = MyIO.readLine();
        int tamanho = entrada.length();
        boolean ehPalindromo;
        

        while(!strComp(entrada)){  //Repetir execucao do programa enquanto nao for escrito "FIM"

            ehPalindromo = ehPalindromo(entrada, tamanho-1, 0);  //Se a palavra tem 3 letras significa que ela vai de 0 ate 2

            escrever(ehPalindromo);

            entrada = MyIO.readLine();
            tamanho = entrada.length();
            
        }

    }


    public static boolean ehPalindromo(String frase, int tamanho, int pos){  //Funcao para testar se uma palavra eh palindromo usando recursividade
        boolean ehPalindromo = true;
        char letra1;
        char letra2;
        
        if(tamanho > pos){
            letra1 = frase.charAt(tamanho);
            letra2 = frase.charAt(pos);
            if(letra1 != letra2){
                ehPalindromo = false;
                tamanho = pos;
            }
            else{
                ehPalindromo = ehPalindromo(frase, tamanho-1, pos+1);
            }
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