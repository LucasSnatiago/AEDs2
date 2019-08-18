public class ISRecursivo {
    public static void main(String[] args){

        String entrada = MyIO.readLine();

        while(!strComp(entrada)){

            orquestrador(entrada);
            entrada = MyIO.readLine();
        }

    }

    public static void orquestrador(String entrada){  //Funcao para organizar o codigo e suas execucoes
        
        boolean somenteVogais = somenteVogais(entrada, entrada.length()-1);
        boolean somenteConsoantes = somenteConsoantes(entrada, entrada.length()-1);
        boolean ehInteiros = ehInteiros(entrada, entrada.length()-1);
        boolean ehReal = ehReal(entrada, entrada.length()-1, 0);

        if(somenteVogais)
            MyIO.print("SIM ");
        else
            MyIO.print("NAO ");
        if(somenteConsoantes)
            MyIO.print("SIM ");
        else
            MyIO.print("NAO ");
        if(ehInteiros)
            MyIO.print("SIM ");
        else
            MyIO.print("NAO ");
        if(ehReal)
            MyIO.print("SIM");
        else
            MyIO.print("NAO");

        MyIO.println("");
    }


    public static boolean somenteVogais(String frase, int tam){  //Checar se uma frase so contem vogais de forma recursiva
        boolean soVogais = true;
        char letra = frase.charAt(tam);

        if(letra != 'A' && letra != 'a' && letra != 'E' && letra != 'e' && letra != 'I' && letra != 'i' && letra != 'O' && letra != 'o' && letra != 'U' && letra != 'u'){
            soVogais = false;
            tam = 0;
        }
        if(tam > 0){
            soVogais = somenteVogais(frase, tam-1);
        }

        return soVogais;
    }


    public static boolean somenteConsoantes(String frase, int tam){  //Checar se uma frase so contem consoantes de forma recursiva
        boolean somenteConsoantes = true;
        char letra;

        
        letra = frase.charAt(tam);
        if(letra == 'A' || letra == 'a' || letra == 'E' || letra == 'e' || letra == 'I' || letra == 'i' || letra == 'O' || letra == 'o' || letra == 'U' || letra == 'u' || letra >= '0' && letra <= '9'){
            somenteConsoantes = false;
            tam = 0;
        }
        if(tam > 0) {
            somenteConsoantes = somenteConsoantes(frase, tam-1);
        }
        
        
        return somenteConsoantes;
    }


    public static boolean ehInteiros(String frase, int tam){  //Funcao para checar se uma frase so contem numeros inteiros de forma recursiva
        boolean ehInteiros = true;
        char letra;

        letra = frase.charAt(tam);
        if(letra >= 'a' && letra <= 'z' || letra >= 'A' && letra <= 'Z' || letra == '.' || letra == ','){
            ehInteiros = false;
            tam = 0;
        }
        if(tam > 0){
            ehInteiros = ehInteiros(frase, tam-1);
        }

        return ehInteiros;
    }


    public static boolean ehReal(String frase, int tam, int numVirgulas){  //Funcao para checar se uma frase so contem um numero real de forma recursiva
        boolean ehReal = true;
        char letra;

        
        letra = frase.charAt(tam);
        if(letra >= 'a' && letra <= 'z' || letra >= 'A' && letra <= 'Z'){
            ehReal = false;
            tam = 0;
        }
        if(letra == '.' || letra == ','){
            numVirgulas++;
        }

        
        if(numVirgulas > 1){
            ehReal = false;
        }

        if(tam > 0){
            ehReal = ehReal(frase, tam-1, numVirgulas);
        }

        return ehReal;
    }


    public static boolean strComp(String entrada){  //Funcao para checar se eh para sair do programa
        boolean ehFim = true;
        
        if(entrada.charAt(0) != 'F' || entrada.charAt(1) != 'I' || entrada.charAt(2) != 'M'){
            ehFim = false;
        }

        return ehFim;
    }
}