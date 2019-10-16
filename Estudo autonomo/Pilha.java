import java.util.Scanner;;

class Pilha{
    public static void main(String[] args){
        Scanner leitor = new Scanner(System.in);
        int entrada = leitor.nextInt();
        PilhaDinamica pl = new PilhaDinamica();

        while(entrada != 0){

            pl.inserir(entrada);

            entrada = leitor.nextInt();
        }

        pl.mostrar();

        int elemento;

        try{ 
            elemento = pl.remover();
            System.out.println("O elemento: " + elemento + " foi removido da lista!");
        }
        catch(Exception erro) {
            System.out.println("Deu erro!");
        }

        try{
            elemento = pl.remover();
            System.out.println("O elemento: " + elemento + " foi removido da lista!");
        }
        catch (Exception erro) {
            System.out.println("Deu erro!");
        }

        try{
            elemento = pl.remover();
            System.out.println("O elemento: " + elemento + " foi removido da lista!");
        }
        catch(Exception erro){ System.out.println("Deu erro!");}

        pl.inserir(6);
        pl.mostrar();

        try{
            elemento = pl.remover();
            System.out.println("O elemento: " + elemento + " foi removido da lista!");
        }
        catch (Exception erro) {
            System.out.println("Deu erro!");
        }
        pl.mostrar();
    }
}


class Celula{
    protected int x;
    protected Celula prox;

    public Celula(){
        this(-1);
    }

    public Celula(int elemento){
        this.x = elemento;
        this.prox = null;
    }
}


class PilhaDinamica extends Celula{
    private Celula topo; //O topo da pilha, tudo será empilhado acima

    public PilhaDinamica(){
        this.topo = null;    
    }

    public void inserir(int x){
        Celula tmp = new Celula(x);
        tmp.prox = this.topo;
        this.topo = tmp;
        tmp = null;
    }

    public int remover() throws Exception{
        int elemento = 0;
        
        if(this.topo == null) throw new Exception("Removendo de lista vazia!");
        else{
            elemento = topo.x;
            Celula i = this.topo;
            this.topo = this.topo.prox;
            i = i.prox = null;            
        }

        return elemento;
    }

    public void mostrar(){
        Celula tmp = this.topo;
        System.out.print("[ ");
        mostrar(tmp);
        System.out.print("]\n");
        tmp = null;
    }
    public void mostrar(Celula i){
        if(i.prox != null) mostrar(i.prox);
        System.out.print(i.x + " ");
    }
}