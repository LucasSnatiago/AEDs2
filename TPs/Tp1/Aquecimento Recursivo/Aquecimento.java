import java.util.Scanner;

public class Aquecimento {
    public static void main(String[] args) {

        String frase = "";
        Scanner scanner = new Scanner(System.in);

        frase = scanner.nextLine();

        while (!StrComp(frase, "FIM")) {

            System.out.println(Maiusculas(frase, 0, 0));
            frase = scanner.nextLine();

        }



    }

    public static int Maiusculas(String frase, int maiusculas, int pos) {  //Funcao recursiva para contar numero de maiusculas em uma frase

        if (pos < frase.length()) {

            if (frase.charAt(pos) >= 'A' && frase.charAt(pos) <= 'Z') {
                maiusculas = Maiusculas(frase, maiusculas+1, pos+1);
            }
            else {
                maiusculas = Maiusculas(frase, maiusculas, pos+1);
            }

        }

        return maiusculas;

    }

    public static boolean StrComp (String a, String b) {  //Funcao para verificar a hora de parar o programa
        
        if (a.length() != b.length()) {
            return false;
        }

        for (int i = 0; i < a.length(); i++) {
            if (a.charAt(i) != b.charAt(i)) {
                return false;
            }
        }

        return true;
    }

}
