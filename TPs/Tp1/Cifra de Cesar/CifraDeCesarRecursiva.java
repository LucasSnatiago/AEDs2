public class CifraDeCesarRecursiva{
    public static void main(String[] args){
        String entrada;
        short cifra = 3;

        entrada = MyIO.readLine();

        while(!strComp(entrada)){  //Executar ate ser lido "FIM"

            cifrar(entrada, cifra, entrada.length()-1);
            MyIO.println("");

            entrada = MyIO.readLine();
        }
    }


    public static void cifrar(String texto, short cifra, int pos){  //Funcao para cifrar o texto de forma recursiva
        
        char cifrado = (char)(texto.charAt(pos) + cifra);  //Somar a cifra na letra

        if(pos > 0){
            cifrar(texto, cifra, pos-1);
        }
        MyIO.print(cifrado);
        
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