// Classe Criatura
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

// Classe Diário
class Diario {
  #autorSecreto;
  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Apenas o autor pode decodificar o diário.";
    }
    if (!this.enigmas.has(num)) {
      return "Enigma não encontrado!";
    }
    return `Enigma #${num}: ${this.enigmas.get(num)}`;
  }

  adicionarCriatura(criatura) {
    this.criaturasAvistadas.push(criatura);
  }
}

// Classe Personagem
class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

// Classe Protagonista
class Protagonista extends Personagem {
  constructor(nome, idade) {
    super(nome, idade);
    this.diario = new Diario(nome);
  }
}

// Classe CabanaMistério
class CabanaMisterio {
  constructor() {
    this.funcionarios = [];
    this.visitantes = [];
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem);
  }

  listarFuncionários() {
    return this.funcionarios;
  }
}

// Demonstração
const dipper = new Protagonista("Dipper Pines", 12);
const cabana = new CabanaMisterio();

const soose = new Personagem("Soos", 22);
const wendy = new Personagem("Wendy", 17);

cabana.adicionarFuncionario(soose);
cabana.adicionarFuncionario(wendy);

dipper.diario.adicionarEnigma(1, "O segredo está nos olhos da estátua.");
dipper.diario.adicionarEnigma(2, "O símbolo da roda revela o portal.");

console.log(dipper.diario.decodificar("Dipper Pines", 1)); // sucesso
console.log(dipper.diario.decodificar("Bill Cipher", 2)); // acesso negado

console.log("Funcionários da Cabana Mistério:");
cabana.listarFuncionários().forEach(f => console.log(`- ${f.nome}, ${f.idade} anos`));
