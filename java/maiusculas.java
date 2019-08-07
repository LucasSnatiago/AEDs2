public class maiusculas{
    public static void main(String[] args) {
        int numMaiusculas = 0;

        String entrada = MyIO.readLine();
        while(!stringCompare("FIM", entrada)){

            numMaiusculas = quantasMaiusculas(entrada);

            MyIO.println(numMaiusculas);

            entrada = MyIO.readLine();
        }
    
    }

    public static int quantasMaiusculas(String frase){
        int tamanhoFrase = frase.length();
        int quantasMaiusculas = 0;

        for(int i = 0; i < tamanhoFrase; i++){
            if(ehMaiusculo(frase.charAt(i))) quantasMaiusculas++;
        }

        return quantasMaiusculas;
    }


    public static boolean ehMaiusculo(char c){
        boolean ehMaiusculo = false;

        if(c >= 'A' && c <= 'Z') ehMaiusculo = true;

        return ehMaiusculo;
    }

    public static boolean stringCompare(String frase1, String frase2){
        boolean stringCompare = true;
        int tamanhoFrase1 = frase1.length();
        int tamanhoFrase2 = frase2.length();

        if(tamanhoFrase1 != tamanhoFrase2){
            stringCompare = false;
        }
        else{
            for(int i = 0; i < tamanhoFrase1; i++){
                if(frase1.charAt(i) != frase2.charAt(i)){
                    stringCompare = false;
                }
            }
        }

        return stringCompare;
    }
}