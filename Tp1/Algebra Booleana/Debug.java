public class Debug{
    public static void debug(char[] frase, int tam){
        for(int i = 0; i < tam; i++){
            MyIO.print(frase[i]);
        }
        
        MyIO.println("");
    }
}