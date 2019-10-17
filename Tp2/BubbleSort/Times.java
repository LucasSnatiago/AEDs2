import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;


class Times extends Time{
    public static void main(String[] args) throws IOException{
        Scanner leitor = new Scanner(System.in);
        String entrada = leitor.nextLine();
        Time[] time = new Time[50];
        int numArq = 0;

        while(!ehFim(entrada)){
            try{
                time[numArq] = new Time();
                time[numArq].ler(entrada);
                numArq++;
            }
            catch(IOException erro){
                throw new IOException("Não foi possivel abrir o arquivo!");
            }
            entrada = leitor.nextLine();
        }

        for(int i = 0; i < numArq; i++){
            System.out.println(time[i].nome);
        }
    }

    public static boolean ehFim (String entrada){
        boolean fim = true;

        if(entrada.charAt(0) != 'F' || entrada.charAt(1) != 'I' || entrada.charAt(2) != 'M')
            fim = false;

        return fim;
    }
}


class Time{
    protected String nome, apelido, estadio, tecnico, liga, nomeArquivo;
    protected int capacidade, fundacaoDia, fundacaoMes, fundacaoAno;
    protected long paginaTam;

    public Time() {
        nome = apelido = estadio = tecnico = liga = nomeArquivo = "";
        paginaTam = capacidade = fundacaoDia = fundacaoMes = fundacaoAno = 0;
    }

    public Time(String nome, String apelido, String estadio, String tecnico, String liga, String nomeArquivo, int capacidade, int fundacaoDia, int fundacaoMes, int fundacaoAno, long paginaTam){
        this.nome = nome;
        this.apelido = apelido;
        this.estadio = estadio;
        this.tecnico = tecnico;
        this.liga = liga;
        this.nomeArquivo = nomeArquivo;
        this.capacidade = capacidade;
        this.fundacaoAno = fundacaoAno;
        this.fundacaoMes = fundacaoMes;
        this.fundacaoDia = fundacaoDia;
        this.paginaTam = paginaTam;
    }

    public String toString() {
        String resp = nome + " ## " + apelido + " ## ";
        resp += ((fundacaoDia > 9) ? "" : "0") + fundacaoDia + ((fundacaoMes > 9) ? "/" : "/0") + fundacaoMes + "/"
                + fundacaoAno + " ## ";
        resp += estadio + " ## " + capacidade + " ## " + tecnico + " ## " + liga + " ## " + nomeArquivo + " ## "
                + paginaTam + " ## ";
        return resp;
    }

    public String removePunctuation(String campo) {
        campo = campo.replace(".", "");
        campo = campo.replace(",", "");
        campo = campo.replace(";", "");
        String resp = "";
        for (int i = 0; i < campo.length(); i++) {
            if (Character.isDigit(campo.charAt(i)))
                resp += campo.charAt(i);
            else
                i = campo.length();
        }
 
        return resp;
    }

    public int getMes(String campo) {
        int resp = 0;
        if (campo.contains("january") == true) {
            resp = 1;
        } else if (campo.contains("february") == true) {
            resp = 2;
        } else if (campo.contains("march") == true) {
            resp = 3;
        } else if (campo.contains("april") == true) {
            resp = 4;
        } else if (campo.contains("may") == true) {
            resp = 5;
        } else if (campo.contains("june") == true) {
            resp = 6;
        } else if (campo.contains("july") == true) {
            resp = 7;
        } else if (campo.contains("august") == true) {
            resp = 8;
        } else if (campo.contains("september") == true) {
            resp = 9;
        } else if (campo.contains("october") == true) {
            resp = 10;
        } else if (campo.contains("november") == true) {
            resp = 11;
        } else if (campo.contains("december") == true) {
            resp = 12;
        }
        return resp;
    }

    public String getSubstringEntre(String s, String antes, String depois) {
        String resp = "";
        int posInicio, posFim;
 
        posInicio = s.indexOf(antes) + antes.length();
 
        if (antes.compareTo(depois) != 0) {
            posFim = s.indexOf(depois);
        } else {
            posFim = s.indexOf(depois, posInicio);
        }
 
        if (0 <= posInicio && posInicio < posFim && posFim < s.length()) {
            resp = s.substring(posInicio, posFim);
        }
 
        return resp;
    }


    public void ler(String nomeArquivo) throws IOException{
        try{
            FileReader file = new FileReader(nomeArquivo);
            BufferedReader buffer = new BufferedReader(file);
            String html = "";
            String line = buffer.readLine();
            while (line != null) {
                html += line;
                line = buffer.readLine();
            }
    
            buffer.close();
            file.close();
    
            html = html.substring(html.indexOf("Full name"));
            html = html.substring(0, html.indexOf("<table style"));
            //String campos[] = html.split("<tr>");
    
            this.nomeArquivo = nomeArquivo;

            //Todos os componentes estao em ordem

            
                        
            /*
            for (String campo : campos) {
                // Full name
                if (removeTags(campo).contains("Full name")) {
                    campo = removeTags(campo);
                    this.nome = campo.substring(9).trim();
                    continue;
    
                    // Nickname(s)
                } else if (removeTags(campo).contains("Nickname(s)")) {
                    campo = removeTags(campo);
                    this.apelido = campo.substring(11).trim();
    
                    // Founded
                } else if (removeTags(campo).toLowerCase().contains("founded")) {
                    campo = removeTags(campo.split("<br />")[0]);
                    this.fundacaoMes = this.getMes(campo.toLowerCase());
    
                    if (this.fundacaoMes == 0) {
                        this.fundacaoDia = 0;
                        campo = campo.substring(7);
                        this.fundacaoAno = Integer.parseInt(campo.substring(0, 4));
                    } else {
                        campo = campo.substring(7);
                        String data[] = campo.split(" ");
                        if (data.length < 3) {
                            this.fundacaoDia = 0;
                            this.fundacaoAno = Integer.parseInt(data[1].substring(0, 4));
                        }/* else {
                            if (campo.contains(",")) {
                                this.fundacaoDia = Integer.parseInt(data[1].replace("th", "").replace(",", ""));
                                this.fundacaoAno = Integer.parseInt(data[2].substring(0, 4));
                            } else if (Character.isDigit(data[0].charAt(0))) {
                                this.fundacaoDia = Integer.parseInt(data[0]);
                                this.fundacaoAno = Integer.parseInt(data[2].substring(0, 4));
                            } else {
                                this.fundacaoDia = 0;
                                this.fundacaoAno = Integer.parseInt(data[1].substring(0, 4));
                            }
                        }
                    }
    
                    // Ground
                } else if (removeTags(campo).toLowerCase().contains("ground")) {
                    campo = removeTags(campo);
                    this.estadio = estadio.substring(6).trim();
    
                    // Capacity
                } else if (removeTags(campo).toLowerCase().contains("capacity")) {
                    campo = campo.split("<br")[0];
                    campo = removeTags(campo.split("</td>")[0].replace(" ", ""));
                    this.capacidade = Integer.parseInt(removePunctuation(campo.substring(8).split(";")[0]));
    
                    // Coach
                } else if (removeTags(campo).toLowerCase().contains("coach") || campo.toLowerCase().contains("manager")) {
                    campo = removeTags(campo).replace("(es)", "").trim();
                    if (campo.toLowerCase().contains("coach")) {
                        int index = campo.toLowerCase().indexOf("coach");
                        this.tecnico = campo.substring(index + 5).trim();
                    } else if (campo.toLowerCase().contains("manager") && this.tecnico.isEmpty()) {
                        int index = campo.toLowerCase().indexOf("manager");
                        this.tecnico = campo.substring(index + 7).trim();
                    }
                    // League
                } else if (removeTags(campo).contains("League") && this.liga.isEmpty()) {
                    campo = removeTags(campo);
                    this.liga = campo.substring(6).trim();
                }*/
            }
            File Arq = new File(nomeArquivo);
            this.paginaTam = Arq.length();
            file.close();
        }
        catch(IOException erro){
            throw new IOException("ERRO!");
        }
    }


    public Time clone(){
		Time novo = new Time(nome, apelido, estadio, tecnico, liga, nomeArquivo, capacidade, fundacaoDia, fundacaoMes, fundacaoAno, paginaTam);
		return novo;
    }
    

    public String removeTags(String entrada){
        
        boolean limpo = false;
        int comeco = 0, fim = entrada.length();

        /*while(!limpo){
            if()
        }*/

        return entrada.trim();
    }

    import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;

class Time{
//====================================================================================================================================================
//Leitura de dados:
/**
 **Método criado por André Lucas Ribeiro Costa em Agosto de 2019.
 * Objetivo desta classe é utilizar funções para facilitar a leitura de entrada do teclado
 * no formato UTF-8, e entradas de arquivo.Com o auxílio de uma classe chamada MyIO.
 */
	public static String ler(){					//Função criada para ler a entrada do teclado e setar a entrada para UTF-8.	
		String nomeArquivo;
		nomeArquivo = MyIO.readLine();
		return nomeArquivo;
	}//end of ler()

	public static String lerArquivo(String nomeArquivo) throws IOException{		//Função criada para ler diretamente do arquivo
		FileReader lerArquivo = new FileReader(nomeArquivo);							//criando os leitores e retornando a string com
		BufferedReader leitorDeArquivo = new BufferedReader(lerArquivo);			//a linha do arquivo. Recomendado caso não necessite
		String linhaArquivo = leitorDeArquivo.readLine();								//ler diversar linhas.
		return linhaArquivo;
	}//end of lerArquivo

	public static String lerAquivo(String nomeArquivo,BufferedReader lerArquivo) throws IOException{	//Função criada para ler diretamente do
		String linhaArquivo = lerArquivo.readLine();																		//arquivo entretanto passando os leitores
		return linhaArquivo;																										//e o nome do arquivo como parametros.
	}//end of lerArquivo com leitor de arquivo já criado																//Recomendado para diversar linhas.

	public static BufferedReader criarLeitorArq(String nomeArquivo) throws IOException{		//Função que cria os leitores do arquivo sendo
		FileReader lerArq = new FileReader(nomeArquivo);												//necessário apenas parametrizar o nome do
		BufferedReader leitorDeArquivo = new BufferedReader(lerArq);								//arquivo.
		return leitorDeArquivo;
	}//end of criarLeitorArq

	public static String pegarTable(String nomeArquivo) throws IOException{		//Função que pesquisa em todo o arquivo HTML em busca da linha que
		BufferedReader leitor = criarLeitorArq(nomeArquivo);							//contem as informações do Time. Metódo de auxílio exlusivo para a
		String linha = "";																		//resolução de problemas da classe time.Está função percorre todo o
		while(!linha.contains("vcard")){														//o arquivo em busca da linha que contem "vcard", quando a encontra
			linha = leitor.readLine();															//adiciona ao final o nome do arquivo e a quantidade de caracteres 
		}//end of while																			//existentes no arquivo.
		linha += "Nome Arquivo";
		linha += nomeArquivo;
		linha += "Quantidade";
		linha += tamanhoArquivo(nomeArquivo);
		return linha;
	}//end of pegarTable
	
	public static String tamanhoArquivo(String nomeArquivo) throws IOException{		//Método criado para ler e retornar o tamanho do arquivo.
		File f = new File(nomeArquivo);																//Para isso o arquivo e aberto e sua length é salva e transfor-
		long tamanho = f.length();																		//da em uma string que é retornada para o usuário.
		String tamanho2 = Long.toString(tamanho);
		return tamanho2;
	}//end of tamanhoArquivo
//End of leitura de dados.
//==================================================================================================================================================
//Métodos de obter informações:
/**
 *  Método criado por André Lucas Ribeiro Costa em Agosto de 2019.
 *  A classe Informacoes foi criada para uso exclusivo da classe Times proposta pelo Trabalho Prático da disciplina
 *  de AED2. Seu principal objetivo é pegar a linha resultado da classe leitura e a partir dela e de funções auxiliares
 *  a transforma-la em uma linha que pode ser compreendida pelos métodos da classe Times. 
 */
	public static String tableFormatada() throws IOException{	//Função que tem o objetivo de utilizar os métodos existentes da classe leitura
		String nomeArquivo = ler();										//e transforma-los em uma linha que possa ser comprendida pela classe Times.
		String table = pegarTable(nomeArquivo);						//Para isso ela começa obtendo o nome do arquivo, e a linha com as informações
		String[] tableFormatada = table.split(">");					//dentro desse arquivo.Logo após, ele remove todas os final de tags de HTML ">",
		String tableFormatada2 = "";										//cria uma string vazia e dentro de um laço de repetição duplo.No laço externo ele
		for(int i = 0 ; i<tableFormatada.length; i++){				//percorre todos os arranjos de string resultados na split e no segundo ele copia
			for(int j = 0; j<tableFormatada[i].length(); j++){		//os caracteres de todos os arranjos até o inicio de tag "<" dos arranjos de string
				if(tableFormatada[i].charAt(j) == '<'){				//dentro da string vazia anteriormente criada, e com isso ele remove todas as tags
					j=tableFormatada[i].length();							//HTML da linha.
				}//end of if
				else{
					tableFormatada2+=tableFormatada[i].charAt(j);
				}//end of else
			}//end of for
		}//end of for
		return tableFormatada2;
	}//end of tableFormatada
	
	public static String tableFormatada(String nomeArquivo) throws IOException{		//Função pega a table com o nome parametrizado   
																					//Função que tem o objetivo de utilizar os métodos existentes da classe leitura
											                              //e transforma-los em uma linha que possa ser comprendida pela classe Times.
      String table = pegarTable(nomeArquivo);                  //Para isso ela começa obtendo o nome do arquivo, e a linha com as informações
      String[] tableFormatada = table.split(">");              //dentro desse arquivo.Logo após, ele remove todas os final de tags de HTML ">",
      String tableFormatada2 = "";                             //cria uma string vazia e dentro de um laço de repetição duplo.No laço externo ele
      for(int i = 0 ; i<tableFormatada.length; i++){           //percorre todos os arranjos de string resultados na split e no segundo ele copia
         for(int j = 0; j<tableFormatada[i].length(); j++){    //os caracteres de todos os arranjos até o inicio de tag "<" dos arranjos de string
            if(tableFormatada[i].charAt(j) == '<'){            //dentro da string vazia anteriormente criada, e com isso ele remove todas as tags
               j=tableFormatada[i].length();                   //HTML da linha.
            }//end of if
            else{
               tableFormatada2+=tableFormatada[i].charAt(j);
            }//end of else
         }//end of for
      }//end of for
      return tableFormatada2;
   }//end of tableFormatada
	
	public static String stringEntre(String string,String key1,String key2){	//Método que dado uma string com o formato "Palavra1ConteudoPalavra2"
		int posKey1 = stringPosContains(string,key1,0);									//retorna o conteudo desejado dentro da chamada substring conteudo.
		int posKey2 = stringPosContains(string,key2,posKey1+key1.length());		//Para isso deve ser parametrizado a string desejada e as duas palavras
		String resposta = "";																	//em volta do conteúdo, o método chamado stringPosContainsApartir é
		int contador = 0;																			//chamado método este que verifica a ocorrencia da palvra passada
		if(posKey1 != -1){																		//de uma determinada posição. A string de resposta para o usuário é
			if(posKey2 != -1){																	//criada e um contador também, o método verifica se a primeira palavra
				for(int i=posKey1+key1.length(); i < posKey2; i++,contador++){		//existe e se a segunda também existe. Se ambas existirem a string
					resposta += string.charAt(i);												//resposta é preenchida com todos os caracteres da posição inicial da
				}//end of for																		//primeira palavra mais o tamanho da palvra até a posição inicial do
			}//end of if posKey2																	//primeiro caracter da palavra2. Caso o contrário a string permanece
		}//end of if posKey1																		//vázia. Ao final essa string resposta é retornada.
		return resposta;
	}//end of stringEntre
	
	public static int stringPosContains(String string,String key,int n){ //Função que verifica se existe uma palavra-chave dentro da string inserida
      int pos = -1;                                                     //caso ela exista a posição inicial da mesma é retornada, caso contrário a
      for(int i=n; i< string.length(); i++){                            //FLAG = -1, é retornada. Para isso um laço de repetição duplo é criado.
         if(string.charAt(i) == key.charAt(0)){                         //no laço externo é verificado se a posição de pesquisa atual é igual a
            pos = i;                                                    //posição de 0 da palavra-chave, caso seja essa posição é salva e um laço
            if(string.length() > pos+key.length()){
               for(int j=1; j<key.length(); j++){                       //de repetição interno é ativado, esse laço percorre todo o palavra-chave
                  if(string.charAt(i+j) != key.charAt(j)){              //até o final verificando se o caracter da string na posição i+j é dife-
                     pos = -1;                                          //rente do caracter na posição j da palavra-chave, caso os dois sejam
                     j = key.length();                                  //diferentes a posição volta a flag e o laço de repetição interno é quebrado.
                  }//end of if                                          //Caso isso não ocorra o laço de repetição externa é quebrada e a posição é
               }//end of for j                                          //retornada.
            }//end of if
            if(pos != -1){
               i = string.length();
            }//if to "break" for i
         }//end of if
      }//end of for
      return pos;
   }//end of stringPosContains

	public static int stringPosContains(String string,String key){			//Função que verifica se existe uma palavra-chave dentro da string inserida
		int pos = -1;																		//caso ela exista a posição inicial da mesma é retornada, caso contrário a
		for(int i=0; i< string.length(); i++){										//FLAG = -1, é retornada. Para isso um laço de repetição duplo é criado.
			if(string.charAt(i) == key.charAt(0)){									//no laço externo é verificado se a posição de pesquisa atual é igual a
				pos = i;																		//posição de 0 da palavra-chave, caso seja essa posição é salva e um laço
				if(string.length() > pos+key.length()){
					for(int j=1; j<key.length(); j++){								//de repetição interno é ativado, esse laço percorre todo o palavra-chave
						if(string.charAt(i+j) != key.charAt(j)){					//até o final verificando se o caracter da string na posição i+j é dife-
							pos = -1;														//rente do caracter na posição j da palavra-chave, caso os dois sejam
							j = key.length();												//diferentes a posição volta a flag e o laço de repetição interno é quebrado.
						}//end of if														//Caso isso não ocorra o laço de repetição externa é quebrada e a posição é
					}//end of for j														//retornada.
				}//end of if
				if(pos != -1){
					i = string.length();
				}//if to "break" for i
			}//end of if
		}//end of for
		return pos;
	}//end of stringPosContains
	
	public static boolean isFim(String string){						//Método que verifica se o conteúdo da string é o fim.
		boolean end = false;													//Isso é feito através de uma estrutura condicional que verifica se dentro da string
		if(string.length() >= 3 && string.charAt(0) == 'F' &&		//Digitou "FIM"
			string.charAt(1) == 'I' && string.charAt(2) == 'M'){
			end = true;
		}//end of if is FIM
		return end;
	}//end of ifFim
//==================================================================================================================================================
//Classe Time verdadeira:
/**
 *		Método criado por André Lucas Ribeiro Costa em Agosto de 2019.
 *		Classe criada com o objetivo de descrever o objeto time, que tem como atributos: nome,apelido e etc.
 *		Está classe depende da classe Informações.
 */
//=========================================================================================================================
//Atributos da classe:
	private String nome,apelido,estadio,tecnico,
		       liga,nomeArquivo;
	private int capacidade,fundacaoDia,fundacaoMes,fundacaoAno;
	private long paginaTam;
//End of Atributos da classe
//=========================================================================================================================
//Constructor:
	public Time(){									//Construtor da classe times,caso o usuário não deseje passar nenhum atributo
		this.setNome("");								//todas as variáveis do objeto são inicializada com o valor vazio ou zero no
		this.setApelido("");							//caso de valores numéricos.
		this.setEstadio("");
		this.setTecnico("");
		this.setLiga("");
		this.setNomeArquivo("");
		this.setCapacidade(0);
		this.setFundacaoDia(0);
		this.setFundacaoMes(0);
		this.setFundacaoAno(0);
		this.setPaginaTam(0);
	}//end of empty constructor
	
	public Time(String nome,String apelido,String estadio,String tecnico,					//Construtor da classe Time com
					 String liga,String nomeArquivo,int capacidade,int fundacaoDia,			//todos os seus dados sendo para-
					 int fundacaoMes,int fundacaoAno,long paginaTam){								//metrizados.
		this.setNome(nome);														//Caso todos os dados sejam parametrizados as variáveis
		this.setApelido(apelido);												//são todas inicializadas com os seus respectivos valores.
		this.setEstadio(estadio);
		this.setTecnico(tecnico);
		this.setLiga(liga);
		this.setNomeArquivo(nomeArquivo);
		this.setCapacidade(capacidade);
		this.setFundacaoDia(fundacaoDia);
		this.setFundacaoMes(fundacaoMes);
		this.setFundacaoAno(fundacaoAno);
		this.setPaginaTam(paginaTam);
	}//end of full constructor
//End of contructor
//=========================================================================================================================
//Métodos da classe:
	public Time clonar(){																								//Método que cria e retorna
		Time time = new Time(this.getNome(),this.getApelido(),this.getEstadio(),						//um time clonado.
									this.getTecnico(),this.getLiga(),this.getNomeArquivo(),
									this.getCapacidade(),this.getFundacaoDia(),this.getFundacaoMes(),
									this.getFundacaoAno(),this.getPaginaTam());
		return time;
	}//end of clonar
	
	public void settarAtributos(String arquivo){						//Método criado apenas para formatar o que deve ser pesquisado
		try{																		//e chamar a função de atribuição de valores.
			this.string2Atributos(arquivo);
		} catch(IOException ex) {
			ex.printStackTrace();
		}//end of catch
	}//end of settarAtributos
	
	public void mostrar(){														//Método que mostra todos os elementos da classe Time
		String nome,apelido,estadio,tecnico,liga,arquivo;				//a única coisa necessária para chama-lo é um objeto
		int capacidade,dia,mes,ano;											//criado, pois independente ou não do usuário ter digitado
		long pagina;																//todas as variáveis, pelo fato do constutor mesmo vázio
		nome = this.getNome();													//ter inicializado todas as variaveis.
		apelido = this.getApelido();											//Primeiro o método pega todas os valores de seus atributos
		estadio = this.getEstadio();											//e printa na tela segundo a formatação exigida pelo exercício.
		tecnico = this.getTecnico();
		liga = this.getLiga();
		arquivo = this.getNomeArquivo();
		capacidade = this.getCapacidade();
		dia = this.getFundacaoDia();
		mes = this.getFundacaoMes();
		ano = this.getFundacaoAno();
		pagina = this.getPaginaTam();
		System.out.printf("%s ## %s ## %02d/%02d/%04d ## %s ## %d ## %s ## %s ## %s ## %d ##\n",
						      nome,apelido,dia,mes,ano,estadio,capacidade,tecnico,liga,arquivo,pagina);
	}//end of void mostrar
	
	private static String extractData(String linha){
		String data = stringEntre(linha,"&#160;(",")");
		if(stringPosContains(linha,"&#160;(") == -1){
			data = stringEntre(linha,"Founded","&#59");
			if(data.length() == 0){
				data = stringEntre(linha,"Founded","Ground");
			}//end of if
		}//end of if
		return data;
	}//end of extractData
	
	public void string2Atributos(String nomeArquivo) throws IOException{		//Método que pega dentro do arquivo todos o valores neces-
	   String linha;																			//sários para as variáveis.
      linha = tableFormatada(nomeArquivo);											//O primeiro passo é pegar a table, utilizando a função
		linha += "FIM";																		//tableFormatada logo após isso o método utiliza de diversos
      String nome = stringEntre(linha,"Full name","Nickname(s)");				//cortes nessa linha pega e conversões de tipo para poder adquirir
      String apelido = stringEntre(linha,"Nickname(s)","Short Name");		//todos os atributos.Todos os atributos são pegos e setados,exceto
      if(apelido.length() == 0){															//a data e a capacidade que utiliza de métodos complementares.
         apelido = stringEntre(linha,"Nickname(s)","Founded");
      }//end of if
      String estadio = stringEntre(linha,"Ground","Capacity");
      String tecnico = stringEntre(linha,"Head coach","League");
      if(tecnico.length() == 0){
         tecnico = stringEntre(linha,"Manager","League");
			if(tecnico.length() == 0){
				tecnico = stringEntre(linha,"Coach","League");
			}//end of tecnico
      }//end of if
      String liga = stringEntre(linha,"League","2018");
      String data = extractData(linha);
		if(data.length() == 0){
			data = stringEntre(linha,"Founded","Ground");
		}//end of if
      String capacidade = stringEntre(linha,"Capacity","President");
		if(capacidade.length() == 0){
			capacidade = stringEntre(linha,"Capacity","Chairman");
			if(capacidade.length() == 0){
				capacidade = stringEntre(linha,"Capacity","Head coach");
				if(capacidade.length() == 0){
					capacidade = stringEntre(linha,"Capacity","Manager");
				}//end of if capacidade NULL 3
			}//end of if capcidade NULL 2
		}//end of if capacidade NULL 1
		String arquivo = stringEntre(linha,"Nome Arquivo","Quantidade");
		String quantidadeChar = stringEntre(linha,"Quantidade","FIM");
		int capacidadeFormatada = string2Capacidade(capacidade);
		long quantidadeC = Long.parseLong(tamanhoArquivo(nomeArquivo));
      this.setNome(nome);
		this.setApelido(apelido);
		this.setEstadio(estadio);
		this.setTecnico(tecnico);
		this.setLiga(liga);
		this.setCapacidade(capacidadeFormatada);
		this.setNomeArquivo(arquivo);
		this.setPaginaTam(quantidadeC);
		string2Data(data);
   }//end of string2Atributos
	
	private int string2Capacidade(String string){									//Método que pega uma string parametrizada e extrai desta string
		String capacidadeFormatada = "";													//um valor inteiro correspondente a capacidade.Para isso uma string
		for(int i = 0; i<string.length(); i++){										//vazia chamada capacidadeFormatada é criada e dentro de um laço de
			if(string.charAt(i)>='0' && string.charAt(i)<='9'){					//repetição é preenchida apenas com os valores númericos da string
				capacidadeFormatada += string.charAt(i);								//e caso dentre dessa string ocorra os caracteres '(','#','&' ela para
			}//end of if																		//de ser preenchida,pois o valor númerico chegou ao fim.Logo após ser
			else if(string.charAt(i) == '(' || string.charAt(i) == '&' ||		//preenchida o valor dentro da string é transformado em valor númerico,
					  string.charAt(i) == '#' || string.charAt(i) > '9' &&		//salvo dentro de uma variável chamada capacidade e retornada.
					  string.charAt(i) != ','){
				i = string.length();
			}//end of else if
		}//end of for
		int capacidade = Integer.parseInt(capacidadeFormatada);
		return capacidade;
	}//end of string2Capacidade
	
	private void string2Data(String string){					//Método que verifica e atribui o valor da data num dado time e dependendo da string.
																			//Para isso o primeiro passo é verificar se a string está formatada num formatado
		if(stringPosContains(string,"-") == -1){				//aceito por este método que seria dd-mm-aaaa, aaaa-mm-dd ou aaaa, e caso não esteja
			string2Data2(string);									//O método string2Data2 é chamado para verificar a possibilidade de conversão da string.
		}//end of if													//Caso esteja no formato aceito o programa executa a seguinte instrução sequencial:
		else{																//1-verificar se a data é composto apenas por ano, caso seja converta o ano para numeros
			int dia = 0;												//e atribua o restante dos atributos dia e mes zero.Caso não seja vá para o segundo passo:
			int mes = 0;												//2-verificar se a data possui o primeiro elemento composto pelo ano, caso seja converta
			int ano = 0;												//este ano para um valor numerico, pegue o mês converta ele para um valor aceitavel usando
			String[] data;												//funções auxiliares, verifique se existe o dado do dia,caso exista converta ele para um
			if(string.length() == 4){								//valor numérico, caso não exista atribua o valor zero para o dia, e por fim salve todos
				ano = Integer.parseInt(string);					//essas informações no dado time.Caso o primeiro elemento não seja o ano prossiga com a
			}//end of if												//instrução 3.
			else{															//3-salve o primeiro dado númerico como time, converta o segundo dado mes usando função
				data = string.split("-");							//auxiliar para isso e verifique se nesta informação possua o dado referente ao ano,caso
				if(data[0].length() == 4){							//possua esse dado converta o valor deste dado para um número e o salve, caso não possua
					ano = Integer.parseInt(data[0]);				//esse dado salve-o como 0.
					mes = string2Mes(data[1]);						//Depois dessa instruções a função termina.
					if(data.length > 2){
						dia = Integer.parseInt(data[2].intern());
					}//end of if
				}//end of if
				else{
					dia = Integer.parseInt(data[0]);
					mes = string2Mes(data[1]);
					if(data.length > 2){
						ano = Integer.parseInt(data[2]);
					}//end of if
				}//end of else
			}//end of else
			this.setFundacaoDia(dia);
			this.setFundacaoMes(mes);
			this.setFundacaoAno(ano); 
		}//end of else
	}//end of string2Data
	
  	private void string2Data2(String string){
		//Método que extrai dentro de uma string o valor numérico da data.
		//Para isso as variáveis ano,dia e mês responsáveis pelo o valor da
		//data é criado e inicializado. Logo após, os seguintes caso
		//são analisados: apenas o ano, formatado ou não, ou a estrutura de data
		//apresentar a seguinte característica DD/MM/AAAA, formatado ou não.
		//Antes de começar os testes todas as tags que não importam são eliminadas.
		//No primeiro caso, a string conter apenas o ano, o valor dentro da string
		//é pego e salvo na variável ano e o valor de mês e dia continuam como zero.
		//Já no segundo caso, uma string vazia de auxilio é criado, como o dia está nas
		//duas primeiras posições, este valor é pego e salvo, para o mês o método auxiliar
		//string2Mes é chamado, e o ano é o que estiver entre " " e o fim da string que é
		//sinalizado como "/" adicionado manualmente ao final da string que contem os dados
		//da data, e este valor é pego e salvo dentro da variável numérica ano. Ao final todos
		//estes valores são setados no objeto.						
		int ano = 0;														
		int mes = 0;														
		int dia = 0;
		String formatado = "";
		for(int i=0;i<string.length();i++){
			if(string.charAt(i) != ','){
				formatado += string.charAt(i);
			}//end of if
		}//end of for	
		string = formatado;													
		if(string.length() == 4){									
			ano = Integer.parseInt(string);									
		}//end of if data is only year
		else if(string.charAt(0) > '9'){
			if(stringPosContains(string,"&#160;")!=(-1)){
				String[] data = string.split("&#160;");
				mes = string2Mes(data[0]);
				String[] aux = data[1].split(" ");
				if(aux[0].length() == 2){
					dia=Integer.parseInt(aux[0]);
					ano=Integer.parseInt(aux[1]);
				}else if(aux[0].length() == 4){
					ano=Integer.parseInt(aux[0]);
         	   dia=Integer.parseInt(aux[1]);
				}//end of else if
			}else{
				String[] aux = string.split(" ");
				mes = string2Mes(aux[0]);
				if(aux[1].length() == 2){
               dia=Integer.parseInt(aux[1]);
               ano=Integer.parseInt(aux[2]);
            }else if(aux[1].length() == 4){
               ano=Integer.parseInt(aux[1]);
               dia=Integer.parseInt(aux[2]);
				}//end of else if
			}//end of if
		}//end of else if							
		else if(stringPosContains(string,"&#160;")!=(-1)){
			String[] data = string.split("&#160;");
			if(data[0].length() == 4){
				ano = Integer.parseInt(data[0]);
			}//end of if later than formated is only year
			else if(data[0].length() == 2){
				String diaAux = "";
				diaAux+=data[0].charAt(0);
				diaAux+=data[0].charAt(1);
				dia = Integer.parseInt(diaAux);
			}//end of else data first information equals day
			if(data.length>0){
				if(data[1].length() > 0){
					String aux = "/";
					aux += data[1];
					aux = stringEntre(aux,"/"," ");
					mes=string2Mes(aux);
					aux = data[1];
					aux+="/";
					aux = stringEntre(aux," ","/");
					if(aux.length() == 2){
						dia = Integer.parseInt(aux);
					} else if (aux.length() == 4){
						ano = Integer.parseInt(aux);
					}//end of if last information is year or day
				}//end of if
			}//end of if extra informations exists
		}//end of if string data ins't formated
		else{
			String[] aux = string.split(" ");
			if(aux[0].length() == 4){
				ano = Integer.parseInt(aux[0]);
				dia = Integer.parseInt(aux[2]);
			}else if(aux[0].length() == 2){
				dia = Integer.parseInt(aux[0]);
				ano = Integer.parseInt(aux[2]);
			}//end of first information is a day or a year
			mes=string2Mes(aux[1]);
		}//end of else
		this.setFundacaoAno(ano);
		this.setFundacaoMes(mes);
		this.setFundacaoDia(dia);
	}//end of string2Data
	
	private int string2Mes(String string){
		//Método que auxilia o método string2Data.
		//O objetivo desse método é retornar o valor do
		//mês.Para obter o valor do mês primeiro é neces-
		//sário saber que o mês de situar dentro da string
		//de duas maneira: 1)Representado com palvras (Maio)
		//ou 2)Representado com números(1-12).
		//Para o primeiro caso um arranjo com o nome de todos os
		//possíveis meses é criado, e dentro de um laço de repe-
		//tição de tamanho igual ao número de meses esse arranjo
		//é percorrido verificando se o valor do mes é igual ao
		//valor do arranjo, logo após esse valor é retornado
		//adicionando 1.Para o segundo caso é necessário apenas
		//transformar o valor da string em um valor númerico para
		//o mês. Esse valor de mês é retornado.												
		int mes = 0;																			
		if(string.charAt(0) > '9'){															
			String[] meses = {"January","February","March","April",				
									"May","June","July","August",							
									"September","October","November","December"};	
			for(int i=0; i<12; i++){														
				if(string.intern() == meses[i].intern()){									
					mes = i;																		
					i = 12;																	
				}//end of if																
			}//end of for
			mes += 1;
		}//end of if
		else{
			mes = Integer.parseInt(string);
		}//end of else*/
		return mes;
	}//end of string2Mes
//End of Métodos da classe.
//=========================================================================================================================
//Getter da Classe
	public String getNome(){
		return this.nome;
	}//end of getNome

	public String getApelido(){
                return this.apelido;
   }//end of getApelido

	public String getEstadio(){
                return this.estadio;
   }//end of getEstadio

	public String getTecnico(){
                return this.tecnico;
   }//end of getTecnico

	public String getLiga(){
                return this.liga;
  	}//end of getLiga

	public String getNomeArquivo(){
                return this.nomeArquivo;
  	}//end of getNomeArquivo

	public int getCapacidade(){
		return this.capacidade;
	}//end of getCapacidade

	public int getFundacaoDia(){
                return this.fundacaoDia;
   }//end of getFundacaoDia

	public int getFundacaoMes(){
                return this.fundacaoMes;
   }//end of getFundacaoMes

	public int getFundacaoAno(){
                return this.fundacaoAno;
  	}//end of getFundacaoAno

	public long getPaginaTam(){
		return this.paginaTam;
	}//end of getPadinaTam
//End of getter
//====================================================================================================================
//Setter:
	public void setNome(String nome){
		this.nome = nome;
	}//end of setNome

	public void setApelido(String apelido){
		this.apelido = apelido;
	}//end of setApelido

	public void setEstadio(String estadio){
		this.estadio = estadio;
	}//end of setEstadio

	public void setTecnico(String tecnico){
		this.tecnico = tecnico;
	}//end of setTecnico

	public void setLiga(String liga){
		this.liga = liga;
	}//end of setLiga

	public void setNomeArquivo(String nomeArquivo){
		this.nomeArquivo = nomeArquivo;
	}//end of setNomeArquivo

	public void setCapacidade(int capacidade){
		this.capacidade = capacidade;
	}//end of setCapacidade

	public void setFundacaoDia(int dia){
		this.fundacaoDia = dia;
	}//end of setFundacaoDia

	public void setFundacaoMes(int mes){
		this.fundacaoMes = mes;
	}//end of setFundacaoMes

	public void setFundacaoAno(int ano){
		this.fundacaoAno = ano;
	}//end of setFundacaoAno

	public void setPaginaTam(long tam){
		this.paginaTam = tam;
	}//end of setPaginaTam
//End of setter.
}//end of class Time
/
