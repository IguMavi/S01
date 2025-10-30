class IRastreavel {
  rastrearLocal(lat, long) {
    throw new Error("Método abstrato deve ser implementado.");
  }
}

// Classe base Hunter
class Hunter extends IRastreavel {
  constructor(nome, local, idade) {
    super();
    this.nome = nome;
    this.localizacao = local;
    this.idade = idade;
  }

  getNome() {
    return this.nome;
  }

  getLocalizacao() {
    return this.localizacao;
  }
}

// Subclasse Especialista
class Especialista extends Hunter {
  constructor(nome, local, idade, habilidadeNen) {
    super(nome, local, idade);
    this.habilidadeNen = habilidadeNen;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} (Especialista em ${this.habilidadeNen}) rastreando coordenadas (${lat}, ${long}). Localização atual: ${this.localizacao}`;
  }
}

// Subclasse Manipulador
class Manipulador extends Hunter {
  constructor(nome, local, idade, alvoAtual) {
    super(nome, local, idade);
    this.alvoAtual = alvoAtual;
  }

  rastrearLocal(lat, long) {
    const alvoNome = this.alvoAtual ? this.alvoAtual.getNome() : "nenhum";
    return `${this.nome} (Manipulador) está rastreando o alvo ${alvoNome} nas coordenadas (${lat}, ${long}). Localização atual: ${this.localizacao}`;
  }
}

// Classe Batalhão
class Batalhao {
  constructor() {
    this.hunters = new Set();
  }

  adicionarHunter(hunter) {
    // sem duplicatas
    if (![...this.hunters].some(h => h.getNome() === hunter.getNome())) {
      this.hunters.add(hunter);
    } else {
      console.log(`Hunter ${hunter.getNome()} já está no batalhão!`);
    }
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(lat, long) {
    console.log("Iniciando rastreamento de todos os Hunters...");
    const resultados = [];
    for (const h of this.hunters) {
      resultados.push(h.rastrearLocal(lat, long));
    }
    return resultados;
  }
}

// Demonstração
const gon = new Especialista("Gon", "Montanhas", 14, "Jajanken");
const kurapika = new Manipulador("Kurapika", "Cidade Yorknew", 17, gon);

const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(gon); // teste duplicado

console.log(batalhao.iniciarRastreamento("-12.98", "-38.51"));
