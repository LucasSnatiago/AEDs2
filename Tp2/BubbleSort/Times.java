import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;

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
            String campos[] = html.split("<tr>");
    
            this.nomeArquivo = nomeArquivo;

            //Todos os componentes estao em ordem

            for (String campo : campos) {
                // Full name
                if (removeTags(campo).contains("Full name")) {
                    campo = removeTags(campo);
                    this.nome = campo.substring(9).trim();
    
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
                        }*/
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
                }
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

    /*
    public static String removerTags(String string, String tag1, String tag2)
	{

        char[] stringChar = string.toCharArray(); 
        int tamanho = stringChar.length;
        boolean isTag1 = false, isTag2 = false;
        
		for(int i = 0; i < string.length(); i++)
		{	 
			if( stringChar[i] == '<' &&
			    stringChar[i+1] == '/' &&
				stringChar[i+2] == 't' &&
				stringChar[i+3] == 'd' &&
				stringChar[i+4] == '>')
			{
				continue;
            }
            
			if(stringChar[i] == tag1.charAt(0))
			{
                isTag1 = true;
                for(int j = 0; j < tag1.length(); j++)
                {
                    if(tag1.charAt(j) != stringChar[i + j])
                    {
                        isTag1 = false;
                    }
                }
                if(isTag1)
                {
                    for(int j = (i + tag1.length() + 1); j < stringChar.length; j++)
                    {
                        if(stringChar[j] == tag2.charAt(0))
                        {
                            isTag2 = true;
                            for(int k = 0; k < tag2.length(); k++)
                            {
                                if(tag2.charAt(k) != stringChar[j + k])
                                {
                                    isTag2 = false;
                                    k = tag2.length();
                                }
                            }
                            if(isTag2)
                            {
                                for(int k = 0; k < j-i +tag2.length(); k++)
                                {
                                    for(int x = i; x < string.length()-1; x++)
                                    {
                                        stringChar[x] = stringChar[x+1];
                                    }

                                    string = new String(stringChar).substring(0, tamanho-1);
                                    stringChar = string.toCharArray();
                                    tamanho--;
                                }
                                
                                i--;
                                j = string.length();
                            }	
                        }
                    }
                }
			}
		}

		return string;
    }
    */
}