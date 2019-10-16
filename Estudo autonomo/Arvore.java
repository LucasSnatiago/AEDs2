import java.util.Scanner;

class Arvore{
    public static void main(String[] args){
        Scanner leitor = new Scanner(System.in);
        int entrada = leitor.nextInt();
        ArvoreBinaria arvbin = new ArvoreBinaria();

        while(entrada != 0){

            arvbin.inserir(entrada);

            entrada = leitor.nextInt();
        }

        if(arvbin.pesquisa(5)){
            System.out.println("tem 5 na arvore!");
        }else System.out.println("Tem 5 n!");

        if(arvbin.pesquisa(8)){
            System.out.println("tem 8 na arvore!");
        }else System.out.println("Tem 8 n!");
    
        arvbin.mostrar();
    }
}


class No{
    protected int x;
    protected No esq;
    protected No dir;

    public No(int elemento){
        this.x = elemento;
    }
}


class ArvoreBinaria{
    private No topo;

    public ArvoreBinaria(){
        this.topo = null;
    }

    public ArvoreBinaria(int elemento){
        inserir(elemento);
    }

    public void inserir(int elemento){
        this.topo = inserir(elemento, this.topo);
    }

    public No inserir(int elemento, No i){
        if(i == null) i = new No(elemento);
        else if(elemento < i.x) i.esq = inserir(elemento, i.esq);
        else if(elemento > i.x) i.dir = inserir(elemento, i.dir);
        return i;
    }

    public boolean pesquisa(int elemento){
        return pesquisa(elemento, this.topo);
    }

    public boolean pesquisa(int elemento, No i){
        boolean achou;
        if(i == null) achou = false;
        else if(i.x == elemento) achou = true;
        else if(elemento < i.x) achou = pesquisa(elemento, i.esq);
        else achou = pesquisa(elemento, i.dir);
        return achou;
    }

    public void mostrar(){
        System.out.print("[ ");
        mostrar(this.topo);
        System.out.print("]\n");
    }

    public void mostrar(No i){
        if(i.esq != null) mostrar(i.esq);    
        System.out.print(i.x + " ");    
        if(i.dir != null) mostrar(i.dir);
    }
}