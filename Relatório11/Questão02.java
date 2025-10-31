import java.util.ArrayList;

// Classe base Cafe
class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

// Subclasse CafeGourmet
class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPrecoBase() + bonusAroma;
    }
}

// Classe Menu
class Menu {
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void exibirMenu() {
        System.out.println("\n=== Menu da Cafeteria ===");
        for (Cafe cafe : itens) {
            System.out.println("- " + cafe.getNome() + " | Preço final: R$ " + cafe.calcularPrecoFinal());
        }
        System.out.println("==========================\n");
    }
}

// Classe CafeLeblanc
class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        menu.adicionarItem(cafe);
        System.out.println("Pedido recebido: " + cafe.getNome());
    }

    public void exibirMenu() {
        menu.exibirMenu();
    }
}

//Exemplo

public class Main {
    public static void main(String[] args) {
        Menu menu = new Menu(new ArrayList<>());

        CafeLeblanc leblanc = new CafeLeblanc(menu);

        Cafe cafeComum = new Cafe("Café Preto", 5.0);
        CafeGourmet cafeGourmet = new CafeGourmet("Café Gourmet", 8.0, 2.5);

        leblanc.receberPedido(cafeComum);
        leblanc.receberPedido(cafeGourmet);

        leblanc.exibirMenu();
    }
}
