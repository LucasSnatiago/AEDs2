public class IS{
    public static void main(String[] args){

        String entrada = MyIO.readLine();

        while(!strComp(entrada)){

            orquestrador(entrada);
            entrada = MyIO.readLine();
        }

    }

    public static void orquestrador(String entrada){  //Funcao para organizar o codigo e suas execucoes
        
        boolean somenteVogais = somenteVogais(entrada);
        boolean somenteConsoantes = somenteConsoantes(entrada);
        boolean ehInteiros = ehInteiros(entrada);
        boolean ehReal = ehReal(entrada);

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


    public static boolean somenteVogais(String frase){  //Checar se uma frase so contem vogais
        boolean somenteVogais = true;
        char letra;

        for(int i = 0; i < frase.length(); i++){
            letra = frase.charAt(i);
            if(letra != 'A' && letra != 'a' && letra != 'E' && letra != 'e' && letra != 'I' && letra != 'i' && letra != 'O' && letra != 'o' && letra != 'U' && letra != 'u'){
                somenteVogais = false;
                i = frase.length();
            }
        }

        return somenteVogais;
    }


    public static boolean somenteConsoantes(String frase){  //Checar se uma frase so contem consoantes
        boolean somenteConsoantes = true;
        char letra;

        for(int i = 0; i < frase.length(); i++){
            letra = frase.charAt(i);
            if(letra == 'A' || letra == 'a' || letra == 'E' || letra == 'e' || letra == 'I' || letra == 'i' || letra == 'O' || letra == 'o' || letra == 'U' || letra == 'u' || letra >= '0' && letra <= '9'){
                somenteConsoantes = false;
                i = frase.length();
            }
        }
        
        return somenteConsoantes;
    }


    public static boolean ehInteiros(String frase){  //Funcao para checar se uma frase so contem numeros inteiros
        boolean ehInteiros = true;
        char letra;

        for(int i = 0; i < frase.length(); i++){
            letra = frase.charAt(i);
            if(letra >= 'a' && letra <= 'z' || letra >= 'A' && letra <= 'Z' || letra == '.' || letra == ','){
                ehInteiros = false;
                i = frase.length();
            }
        }

        return ehInteiros;
    }


    public static boolean ehReal(String frase){  //Funcao para checar se uma frase so contem um numero real
        boolean ehReal = true;
        char letra;
        int numVirgulas = 0;

        for(int i = 0; i < frase.length(); i++){
            letra = frase.charAt(i);
            if(letra >= 'a' && letra <= 'z' || letra >= 'A' && letra <= 'Z'){
                ehReal = false;
                i = frase.length();
            }
            if(letra == '.' || letra == ','){
                numVirgulas++;
            }
        }
        
        if(numVirgulas > 1){
            ehReal = false;
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