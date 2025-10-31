import java.util.HashMap;

// Interface Rastreavel
interface IRastreavel {
    String obterCoordenadas();
}

// Classe Poder (componente de composição)
class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

// Classe base Entidades
abstract class Entidades implements IRastreavel {
    protected String nome;
    protected String localizacao;
    protected Poder poder;

    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    @Override
    public abstract String obterCoordenadas();
}

// Classe Youkai
class Youkai extends Entidades {

    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai " + nome + " localizado em " + localizacao +
               " com poder: " + poder.getNome();
    }
}

// Classe Alien
class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planetaOrigem, String ovni, Poder poder) {
        super(nome, planetaOrigem, poder);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien " + nome + " vindo de " + planetaOrigem +
               " avistado no OVNI: " + ovni +
               " com poder: " + poder.getNome();
    }
}

// Classe Registros
class Registros {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade) {
        if (avistamentos.containsKey(entidade.getNome())) {
            System.out.println("⚠️ Entidade " + entidade.getNome() + " já foi registrada!");
            return false;
        } else {
            avistamentos.put(entidade.getNome(), entidade);
            System.out.println("✅ Entidade " + entidade.getNome() + " registrada com sucesso!");
            return true;
        }
    }

    public void listarAvistamentos() {
        System.out.println("\n=== Avistamentos da equipe " + nomeEquipe + " ===");
        for (Entidades e : avistamentos.values()) {
            System.out.println(e.obterCoordenadas());
        }
        System.out.println("=============================================\n");
    }
}

// Exemplo
public class Main {
    public static void main(String[] args) {
        Poder invisibilidade = new Poder("Invisibilidade");
        Poder telepatia = new Poder("Telepatia");

        Youkai youkai1 = new Youkai("Kitsune", "Montanha Sagrada", invisibilidade);
        Alien alien1 = new Alien("Zorg", "Marte", "Disco Voador Alfa", telepatia);

        Registros equipe = new Registros("Detetives Ocultos");

        equipe.registrarAvistamento(youkai1);
        equipe.registrarAvistamento(alien1);

        equipe.registrarAvistamento(alien1);

        equipe.listarAvistamentos();
    }
}
