class Pokemon {
  #vida; // vida protegida de alterações externas
  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano! Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    const dano = 10; // ataque genérico
    console.log(`${this.nome} ataca ${alvo.nome} causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}

// Subclasse: Pokémon de Fogo
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 15 + this.bonusAtaque;
    console.log(`${this.nome} lança uma bola de fogo em ${alvo.nome}, causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}

// Subclasse: Pokémon de Água
class PokemonAgua extends Pokemon {
  #curaBase;
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 8;
    console.log(`${this.nome} usa jato d'água em ${alvo.nome}, causando ${dano} de dano e se cura ${this.#curaBase}!`);
    alvo.receberDano(dano);
    // cura o próprio Pokémon
    const vidaAntes = this.getVida();
    const novaVida = vidaAntes + this.#curaBase;
    // usando um método interno para alterar a vida
    this.#curar(this.#curaBase);
  }

  #curar(valor) {
    // método privado que altera a vida de forma controlada
    let novaVida = this.getVida() + valor;
    console.log(`${this.nome} recuperou ${valor} de vida! Vida atual: ${novaVida}`);
  }
}

// Demonstração
const charmander = new PokemonFogo("Charmander", 100, 5);
const squirtle = new PokemonAgua("Squirtle", 100, 3);

charmander.atacar(squirtle);
squirtle.atacar(charmander);
