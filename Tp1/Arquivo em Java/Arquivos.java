import java.io.FileOutputStream;
import java.io.IOException;

public class Arquivos{
    public static void main(String[] args) throws IOException{
    
        int numEntrada = MyIO.readInt();
        double[] valores = new double[numEntrada];
        for(int i = 0; i < numEntrada; i++){
            valores[i] = MyIO.readDouble();
        }

        escreverArquivo(valores, numEntrada);
        
    }





    public static void escreverArquivo(double[] valores, int numEntrada) throws IOException{  //Funcao para escrever valores em um arquivo
        
        try{
            FileOutputStream arquivo = new FileOutputStream("arquivo.txt");
        
            for(int i = 0; i < numEntrada; i++){
                if(valores[i] == (int) valores[i]){
                    arquivo.write((int) valores[i]);
                }
                else
                    arquivo.write(valores[i]);
            }
        }
        finally{
            arquivo.close();
        }
    }

}