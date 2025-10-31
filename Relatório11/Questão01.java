//Classe Personagem
public class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public int getIdade() {
        return idade;
    }
}
//Classe Mago
public class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String getMagia() {
        return magia;
    }

    public void setMagia(String magia) {
        this.magia = magia;
    }

    public String lancarFeitico() {
        return getNome() + " lançou o feitiço: " + magia + "!";
    }
}
//Classe Divisão
public class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
//Classe Castelo
import java.util.ArrayList;

public class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}
//Exemplo
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // Criando divisões
        Divisao sala = new Divisao("Sala de Magia");
        Divisao biblioteca = new Divisao("Biblioteca");

        // Criando castelo
        ArrayList<Divisao> divisoes = new ArrayList<>();
        Castelo castelo = new Castelo("Castelo Animado", divisoes);

        // Adicionando divisões
        castelo.adicionarDivisao(sala);
        castelo.adicionarDivisao(biblioteca);

        // Criando mago
        Mago howl = new Mago("Howl", 30, "Metamorfose");
        System.out.println(howl.lancarFeitico());
    }
}
