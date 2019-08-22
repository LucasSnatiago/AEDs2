public class CifraDeCesar{
    public static void main(String[] args){
        String entrada;
        short cifra = 3;

        entrada = MyIO.readLine();

        while(!strComp(entrada)){  //Executar ate ser lido "FIM"

            cifrar(entrada, cifra);

            entrada = MyIO.readLine();
        }
    }


    public static void cifrar(String texto, short cifra){  //Funcao para cifrar o texto
        int tam = texto.length();
        char cifrado;

        for(short i = 0; i < tam; i++){
            cifrado = (char)(texto.charAt(i) + cifra);  //Somar a cifra na letra
            MyIO.print(cifrado);
        }

        MyIO.println("");
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