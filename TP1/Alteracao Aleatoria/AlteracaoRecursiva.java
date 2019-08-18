import java.util.Random;

class AlteracaoRecursiva {
    public static void main(String[] args){

        String entrada = MyIO.readLine();
        Random gerador = new Random();
        gerador.setSeed (4);
        char[] escolha = new char[2];

        while(!strComp(entrada)){  //Repetir execucao do programa enquanto nao for escrito "FIM"

            
            escolherLetras(entrada, gerador, escolha);
            aleatorizar(entrada, escolha, entrada.length()-1);
            MyIO.println("");

            entrada = MyIO.readLine();            
        }

    }


    public static void escolherLetras(String frase, Random gerador, char[] escolha){  //Funcao que escolha duas letras de 'a' ate 'z' de forma aleatoria

        escolha[0] = (char)('a' + Math.abs(gerador.nextInt()) % 26);
        escolha[1] = (char)('a' + Math.abs(gerador.nextInt()) % 26);

    }


    public static void aleatorizar(String frase, char[] escolha, int tam){  //Funcao para trocar a letra da primeira escolha pela segunda escolha de forma recursiva
        char letra = frase.charAt(tam);

        
        if(letra == escolha[0]){
            letra = escolha[1];
        }
        if(tam > 0) aleatorizar(frase, escolha, tam-1);
        MyIO.print(letra);
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