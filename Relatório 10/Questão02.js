class IExplorador {
  explorarTerritorio() {
    throw new Error("Método abstrato! Deve ser implementado.");
  }
}

class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(quantidade) {
    this.#gasRestante -= quantidade;
    if (this.#gasRestante < 0) this.#gasRestante = 0;
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  verificarEquipamento() {
    return `${this.nome} está usando o ODM Gear modelo ${this.gear.modelo}.`;
  }

  explorarTerritorio() {
    this.gear.usarGas(20);
    return `${this.nome} está explorando o território... Gas restante: ${this.gear.getGas()}%`;
  }
}

class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    console.log(`O esquadrão liderado por ${this.lider} iniciou a exploração!`);
    this.membros.forEach(soldado => {
      console.log(soldado.explorarTerritorio());
    });
  }

  relatarStatus() {
    return this.membros.map(s => `${s.nome} - Gas: ${s.gear.getGas()}%`);
  }
}

// Demonstração
const levi = new Soldado("Levi Ackerman", "MK-II");
const mikasa = new Soldado("Mikasa Ackerman", "MK-I");
const squad = new Esquadrao("Levi", [levi, mikasa]);

console.log(levi.verificarEquipamento());
squad.explorarTerritorio();
console.log("Status final:", squad.relatarStatus());
