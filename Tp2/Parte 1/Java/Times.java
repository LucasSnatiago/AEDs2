import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;

public class Times {
	public static void main(String[] args){
		Scanner leitor = new Scanner(System.in);

		String entrada = leitor.nextLine();
		while(!ehFim){
			ORQUESTRADOR(entrada);
			entrada = leitor.nextLine();
		}
	}

	public static void ORQUESTRADOR(String entrada){
		Time time = new Time(entrada);


	}

	public static boolean ehFim(String entrada){
		boolean fim = true;
		if(entrada.charAt(0) != 'F' || entrada.charAt(1) != 'I' || entrada.charAt(2) != 'M')
			fim = false;
		return fim;
	}

}

class Time {

	private String nome, apelido, estadio, tecnico, liga, nomeArquivo;
	private int capacidade, fundacaoDia, fundacaoMes, fundacaoAno;
	private long paginaTam;

	public Time(String arq) {
		nomeArquivo = arq;
		nome = apelido = estadio = tecnico = liga = "";
		paginaTam = capacidade = fundacaoDia = fundacaoMes = fundacaoAno = 0;
    }


    public void imprimir() {
		System.out.println(toString());
	}

	public String toString() {
		String resp = nome + " ## " + apelido + " ## ";
		resp += ((fundacaoDia > 9) ? "" : "0") + fundacaoDia + ((fundacaoMes > 9) ? "/" : "/0") + fundacaoMes + "/"
				+ fundacaoAno + " ## ";
		resp += estadio + " ## " + capacidade + " ## " + tecnico + " ## " + liga + " ## " + nomeArquivo + " ## "
				+ paginaTam + " ## ";
		return resp;
	}


	public void ler(String nomeArquivo) throws Exception {

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
		String estadios[] = html.split("<tr>");

		this.nomeArquivo = nomeArquivo;

		for (String estadio : estadios) {
			// Full name
			if (removeTags(estadio).contains("Full name")) {
				estadio = removeTags(estadio);
				this.nome = estadio.substring(9).trim();

				// Nickname(s)
			} else if (removeTags(estadio).contains("Nickname(s)")) {
				estadio = removeTags(estadio);
				this.apelido = estadio.substring(11).trim();

				// Founded
			} else if (removeTags(estadio).toLowerCase().contains("founded")) {
				estadio = removeTags(estadio.split("<br />")[0]);
				this.fundacaoMes = this.getMes(estadio.toLowerCase());

				if (this.fundacaoMes == 0) {
					this.fundacaoDia = 0;
					estadio = estadio.substring(7);
					this.fundacaoAno = Integer.parseInt(estadio.substring(0, 4));
				} else {
					estadio = estadio.substring(7);
					String data[] = estadio.split(" ");
					if (data.length < 3) {
						this.fundacaoDia = 0;
						this.fundacaoAno = Integer.parseInt(data[1].substring(0, 4));
					} else {
						if (estadio.contains(",")) {
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
			} else if (removeTags(estadio).toLowerCase().contains("ground")) {
				estadio = removeTags(estadio);
				this.estadio = estadio.substring(6).trim();

				// Capacity
			} else if (removeTags(estadio).toLowerCase().contains("capacity")) {
				estadio = estadio.split("<br")[0];
				estadio = removeTags(estadio.split("</td>")[0].replace(" ", ""));
				this.capacidade = Integer.parseInt(removePunctuation(estadio.substring(8).split(";")[0]));

				// Coach
			} else if (removeTags(estadio).toLowerCase().contains("coach") || estadio.toLowerCase().contains("manager")) {
				estadio = removeTags(estadio).replace("(es)", "").trim();
				if (estadio.toLowerCase().contains("coach")) {
					int index = estadio.toLowerCase().indexOf("coach");
					this.tecnico = estadio.substring(index + 5).trim();
				} else if (estadio.toLowerCase().contains("manager") && this.tecnico.isEmpty()) {
					int index = estadio.toLowerCase().indexOf("manager");
					this.tecnico = estadio.substring(index + 7).trim();
				}
				// League
			} else if (removeTags(estadio).contains("League") && this.liga.isEmpty()) {
				estadio = removeTags(estadio);
				this.liga = estadio.substring(6).trim();
			}
		}
	}

	public void removeTags(String entrada){
		boolean chaves = true;
		char letra;
		for(int i = 0; i < entrada.length(); i++){
			if(entrada.charAt(i) == '<'){
				chaves = true;
			}
			if(entrada.charAt(i) == '>'){
				chaves = false;
				entrada.replace(entrada.charAt(i), ' ').trim();
			}
			if(chaves){
				entrada.replace(entrada.charAt(i), ' ').trim();
			}
		}
	}


    public int getMes(String estadio) {
		int resp = 0;
		if (estadio.contains("january") == true) {
			resp = 1;
		} else if (estadio.contains("february") == true) {
			resp = 2;
		} else if (estadio.contains("march") == true) {
			resp = 3;
		} else if (estadio.contains("april") == true) {
			resp = 4;
		} else if (estadio.contains("may") == true) {
			resp = 5;
		} else if (estadio.contains("june") == true) {
			resp = 6;
		} else if (estadio.contains("july") == true) {
			resp = 7;
		} else if (estadio.contains("august") == true) {
			resp = 8;
		} else if (estadio.contains("september") == true) {
			resp = 9;
		} else if (estadio.contains("october") == true) {
			resp = 10;
		} else if (estadio.contains("november") == true) {
			resp = 11;
		} else if (estadio.contains("december") == true) {
			resp = 12;
		}
		return resp;
	}
}
