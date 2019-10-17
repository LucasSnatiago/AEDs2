class Matriz extends Celula{
   protected Celula inicio;
   protected int linha, coluna;

   public Matriz (){
      this(3, 3);
   }

   public Matriz (int linha, int coluna){
      this.linha = linha; //Alocar <linha> linhas
      this.coluna = coluna; //Alocar <coluna> colunas
   }

   public Matriz soma (Matriz m) {  
      Matriz resp = null;

      if(isQuadrada()){
         //PQP FELIPE!
      }

      return resp;
   }

   public Matriz multiplicacao (Matriz m) {
      Matriz resp = null;

      //if(){
         //...
      //}

      return resp;
   }

   public boolean isQuadrada(){
      return (this.linha == this.coluna);
   }

   public void mostrarDiagonalPrincipal (){
      if(isQuadrada()){
         for(Celula i = inicio; i != null; i = i.inf.dir){
            MyIO.printf("%d ", i.elemento);
         }
         MyIO.println("");
      }
   }

   public void mostrarDiagonalSecundaria (){
      if(isQuadrada() == true){

      }
   }

   public void mostrar(){
      for(Celula i = inicio; i != null; i = i.dir){
        // for(Celula j = 
      }
   }

   public void ler(){
      
   }

   public Celula listaDuplaEncadeada(int elemento, Celula inf, Celula sup, Celula esq, Celula dir){
      Celula aux = new Celula(MyIO.readInt(), null, null, null, null);
      Celula tmp;

      for(int i = 0; i < this.linha -1; i++){
         tmp = new Celula(MyIO.readInt(), null, null, aux, null);
         aux.dir = tmp;
      }
      return aux;
   }

   public void linkarCadeia(Celula principal, Celula secundaria){
      Celula tmp1 = principal;
      Celula tmp2 = secundaria;

      while(tmp1 != null && tmp2 != null){
         tmp1.inf = tmp2;
         tmp2.sup = tmp1;
         tmp1 = tmp1.dir;
         tmp2 = tmp2.dir;
      }
   }

   public Celula criarCelula(int elemento, Celula inf, Celula sup, Celula esq, Celula dir){
      Celula tmp = new Celula(elemento, inf, sup, esq, dir);
      return tmp;
   }
}


class Principal extends Matriz{
   public static void main(String[] args){
      Matriz m1, m2, soma, m3, m4, multiplicao;

      m1 = new Matriz(MyIO.readInt("Digite o numero de linhas (M1): "), MyIO.readInt("Digite o numero de colunas (M1): "));
      m2 = new Matriz(MyIO.readInt("Digite o numero de linhas (M2): "), MyIO.readInt("Digite o numero de colunas (M2): "));
      m3 = new Matriz(MyIO.readInt("Digite o numero de linhas (M3): "), MyIO.readInt("Digite o numero de colunas (M3): "));
      m4 = new Matriz(MyIO.readInt("Digite o numero de linhas (M4): "), MyIO.readInt("Digite o numero de colunas (M4): "));

      //int numRodadas
      m1.ler();
      m2.ler();
      m3.ler();
      m4.ler();

      //Somar as duas matrizes e salvar o resultado na matriz soma
      //soma = m1.soma(m2); //verifique se eh possivel somar

      //Imprimir a matriz 1
      //soma.print();

      //Multiplicar duas matrizes e salvar o resultado na matriz multiplicacao
      //multiplicacao = m3.multiplicacao(m4); //verifique se eh possivel multiplicar

      //Imprimir a matriz 1
      //multiplicacao.print();

   }
}


class Celula {
   protected int elemento;
   protected Celula inf, sup, esq, dir;

   public Celula(){
      this(0, null, null, null, null);
   }

   public Celula(int elemento){
      this(elemento, null, null, null, null);
   }

   public Celula(int elemento, Celula inf, Celula sup, Celula esq, Celula dir){
      this.elemento = elemento;
      this.inf = inf;
      this.sup = sup;
      this.esq = esq;
      this.dir = dir;
   }
}

