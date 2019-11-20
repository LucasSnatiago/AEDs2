public class AlocacaoDinamica {

    public static void main(String[] args){
        ListaDinamica lista = new ListaDinamica();

        lista.inserir(3);
        lista.inserir(4);
        lista.inserir(5);
        lista.inserir(6);

        lista.mostrar();

        //int numeroRemovido = lista.remover();
        lista.mostrar();
        System.out.println("Numero removido: ");
    }

}

class Celula {
    protected int valor; //Valor para ser armazenado pela prox celula
    protected Celula prox; //Apontar para a proxima prox celula

    public Celula(){
        this(0);
    }

    public Celula(int valor) {
        this.valor = valor;
        this.prox = null;
    }
}

class ListaDinamica extends Celula {
    private Celula topo;

    public void inserir(int valor){
        Celula tmp = new Celula();
        tmp.prox = this.topo;
        tmp = null;
        this.valor = valor;
    }

   /* public int remover(){
        int valor;
        valor = this.valor;
        this.topo = prox;

        return valor;
    }
    */

    public void mostrar(){
        System.out.println(this.valor);
        if(this.prox != null){
            mostrar(this.prox);
        }
    }

    private void mostrar(Celula tmp){
        System.out.println(this.valor);
        if(this.prox != null){
            mostrar(this.prox);
        }
    }
}