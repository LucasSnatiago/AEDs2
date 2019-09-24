import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;

public class Times {

    public static void main(String[] args){
        Scanner leitor = new Scanner(System.in);
        String nomeTime = leitor.nextLine();
        //Time times = new Time();
    
        while(!ehFim(nomeTime)){

            Time times = new Time(nomeTime);
            nomeTime = leitor.nextLine();
        }
    }


    public static boolean ehFim(String texto){
        boolean ehFim = true;

        if(texto.charAt(0) != 'F' || texto.charAt(1) != 'I' || texto.charAt(2) != 'M'){
            ehFim = false;
        }

        return ehFim;
    }


}






class Time {

    protected char[] nomeTime;

    public Time(){
        System.out.println("Criado!");
    }

    public Time(String html) throws IOException {
        FileReader fr = new FileReader(html);
        System.out.println(fr);
    }



}
