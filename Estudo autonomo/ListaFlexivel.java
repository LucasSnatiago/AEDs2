import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class ListaFlexivel{
    public static void main(String[] args) throws IOException{
        Scanner leitor = new Scanner(System.in);
        String entrada = leitor.nextLine();
        File arq = new File(entrada);
        BufferedReader bf = new BufferedReader(new FileReader(arq));

        Lista listaFlexivel = new Lista();

        int[] valores = new int[100];

        for(int i = 0; i < 100; i++){
            valores[i] = Integer.parseInt(bf.readLine());
        }

        listaFlexivel.inserir(valores[0], 1);
        listaFlexivel.inserir(valores[1], 2);
        //listaFlexivel.inserir(valores[2], 3);
        //listaFlexivel.inserir(valores[3], 4);

        listaFlexivel.mostrar();
    }
}


class Celula{
    protected int elemento;
    protected Celula prox;

    public Celula(){
        this.elemento = -1;
    }
    public Celula(int elemento){
        this.elemento = elemento;
    }
}


class Lista extends Celula{

    private Celula primeiro, ultima;
    private int n;

    public Lista(){
        this.primeiro = null;
        this.ultima = this.primeiro;
        this.n = 0;
    }

    public void inserir(int valor, int pos){
        if(pos == 1) inserirInicio(valor);
        else if(pos == n) inserirFinal(valor);
        else if(pos < 1 || pos > n) System.out.println("Tentativa de inserir um valor em uma posicao inexistente!");
        else{
            Celula i = primeiro;
            for(int j = 0; j < pos; j++, i = i.prox);
            Celula tmp = new Celula(valor);
            tmp.prox = i.prox;
            i.prox = tmp;
            i = tmp = null;
        }
        this.n++;
    }

    public void inserirInicio(int valor){
        Celula tmp = new Celula(valor);
        tmp.prox = primeiro.prox;
        primeiro.prox = tmp;
        if(primeiro == ultima) ultima = tmp;
        tmp = null;
    }

    public void inserirFinal(int valor){
        Celula tmp = new Celula(valor);
        ultima.prox = tmp;
        tmp = null;
    }

    public int remover(int pos){
        int remover = -1;

        if(primeiro == ultima) System.out.println("A lista esta vazia!");
        else if(pos == 1) remover = removerInicio();
        else if(pos == n) remover = removerFinal();
        else if(pos < 1 || pos > n) System.out.println("Tentativa de remover um item de uma posição inexistente!");
        else{
            Celula i = primeiro;
            for(int j = 0; j < pos; j++, i = i.prox);
            Celula tmp = i.prox;
            remover = tmp.elemento;
            tmp.prox = null;
            i.prox = tmp.prox;
            i = tmp = null;
        }
        return remover;
    }

    public int removerInicio(){
        Celula i = primeiro.prox;
        int valor = i.elemento;
        primeiro = i;
        i = null;
        return valor;
    }

    public int removerFinal(){
        Celula i;
        for(i = primeiro; i.prox != ultima; i = i.prox);
        int elemento = ultima.elemento;
        ultima = i;
        i = ultima.prox = null;
        this.n--;
        return elemento;
    }

    public void mostrar(){
        System.out.print("[ ");
        Celula i = primeiro;
        for(i = i.prox; i.prox != null; i = i.prox){
            System.out.print(i + " ");
        }
        i = null;
        System.out.print("]\n");
    }
}
