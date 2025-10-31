import java.util.HashMap;
import java.util.LinkedHashSet;

// ===============================
// Classe PadrãoAtaque
// ===============================
class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return nome + " (Dano: " + dano + ")";
    }
}

// ===============================
// Classe Boss
// ===============================
class Boss {
    protected String nome;
    protected String idBoss;
    protected String pontoFraco;
    protected LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String id, String pontoFraco) {
        this.nome = nome;
        this.idBoss = id;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Iniciando fase do Boss " + nome + "!");
        System.out.println("Ponto fraco: " + pontoFraco);
        for (PadraoAtaque atk : moveset) {
            System.out.println("→ Ataque: " + atk);
        }
        System.out.println();
    }

    public String getIdBoss() {
        return idBoss;
    }
}

// ===============================
// Classe BossMagico
// ===============================
class BossMagico extends Boss {

    public BossMagico(String nome, String id, String pontoFraco) {
        super(nome, id, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("🪄 O Boss Mágico " + nome + " está lançando feitiços!");
        System.out.println("Ponto fraco: " + pontoFraco);
        for (PadraoAtaque atk : moveset) {
            System.out.println("✨ Ataque mágico: " + atk);
        }
        System.out.println();
    }
}

// ===============================
// Classe Batalha
// ===============================
class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("❌ Boss com ID " + idBoss + " não encontrado!");
        }
    }
}

// ===============================
//Exemplo
// ===============================
public class Exercicio4 {
    public static void main(String[] args) {
        PadraoAtaque golpe = new PadraoAtaque("Golpe Pesado", 50);
        PadraoAtaque magia = new PadraoAtaque("Explosão Arcana", 70);
        PadraoAtaque raio = new PadraoAtaque("Raio do Caos", 90);

        Boss boss1 = new Boss("Titã de Pedra", "B001", "Fogo");
        boss1.adicionarAtaque(golpe);

        BossMagico boss2 = new BossMagico("Feiticeiro Sombrio", "B002", "Luz");
        boss2.adicionarAtaque(magia);
        boss2.adicionarAtaque(raio);

        Batalha batalha = new Batalha();
        batalha.adicionarBoss(boss1);
        batalha.adicionarBoss(boss2);

        batalha.iniciarBatalha("B001");
        batalha.iniciarBatalha("B002");
        batalha.iniciarBatalha("B999");
    }
}
