//Questão 1
#include <iostream>
#include <string>
using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;


    void atacar(Personagem &alvo) {
        cout << nome << " atacou " << alvo.nome 
             << " causando " << dano << " de dano!" << endl;
        
        alvo.vida -= dano;
        if (alvo.vida < 0) alvo.vida = 0;
    }

    void mostrarStatus() {
        cout << "Nome: " << nome 
             << " | Nivel: " << nivel 
             << " | Dano: " << dano 
             << " | Vida: " << vida << endl;
    }
};

int main() {
    Personagem p1;
    p1.nome = "Guerreiro";
    p1.nivel = 5;
    p1.dano = 20;
    p1.vida = 100;

    Personagem p2;
    p2.nome = "Mago";
    p2.nivel = 4;
    p2.dano = 25;
    p2.vida = 80;

    cout << "=== Status Inicial ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();

    cout << "\n=== Combate ===" << endl;
    p1.atacar(p2);
    p2.atacar(p1);

    cout << "\n=== Status Após Combate ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();

    return 0;
}

--------------------------------------------------------------------------------------
  //Questão 2
  #include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }


    string getNome() { return nome; }
    int getIdade() { return idade; }


    void setNome(string n) { nome = n; }
    void setIdade(int i) { idade = i; }
};


class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) {
        nivel = nv;
    }

    int getNivel() { return nivel; }
    void setNivel(int nv) { nivel = nv; }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r >= 0 && r <= 10)
            rank = r;
        else
            rank = 0;
    }

    int getRank() { return rank; }
    void setRank(int r) { 
        if (r >= 0 && r <= 10)
            rank = r; 
    }
};

int main() {
    Protagonista hero("Ren Amamiya", 17, 5);

    Personagem aliado("Ryuji Sakamoto", 17, 2);

    cout << "=== Protagonista ===" << endl;
    cout << "Nome: " << hero.getNome() << endl;
    cout << "Idade: " << hero.getIdade() << endl;
    cout << "Nivel: " << hero.getNivel() << endl;

    cout << "\n=== Aliado ===" << endl;
    cout << "Nome: " << aliado.getNome() << endl;
    cout << "Idade: " << aliado.getIdade() << endl;
    cout << "Rank: " << aliado.getRank() << endl;

    return 0;
}
//Questão 3
#include <iostream>
#include <string>
using namespace std;


class Pessoa {
protected:
    string nome;

public:
    Pessoa(string n) : nome(n) {}


    virtual void apresentar() {
        cout << "Ola, meu nome e " << nome << " e eu sou uma pessoa." << endl;
    }

    virtual ~Pessoa() {}
};


class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(string n, string d) : Pessoa(n), disciplina(d) {}

    void apresentar()
    {
        cout << "Ola, meu nome e " << nome
             << " e eu sou um professor de " << disciplina << "." << endl;
    }
};


class Aluno : public Pessoa {
private:
    string curso;
    string matricula;

public:
    Aluno(string n, string c, string m) : Pessoa(n), curso(c), matricula(m) {}

    void apresentar() {
        cout << "Ola, meu nome e " << nome 
             << " e eu sou um aluno de " << curso 
             << " (Matricula: " << matricula << ")." << endl;
    }
};

int main() {
    Pessoa* p1 = new Professor("Mosca", "Algoritmos");
    Pessoa* p2 = new Aluno("Igor Medes Mavigno", "Engenharia de Software", "663");

    p1->apresentar();
    p2->apresentar();

    delete p1;
    delete p2;

    return 0;
}



//Questão 4
#include <iostream>
#include <string>
using namespace std;


class SerVivo {
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}

    virtual void apresentar() {
        cout << "Eu sou um ser vivo chamado " << nome << "." << endl;
    }

    virtual ~SerVivo() {}
};


class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}

    void apresentar() {
        cout << "Ola, eu sou o humano " << nome << "." << endl;
    }
};


class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}

    void apresentar() {
        cout << "Saudacoes, eu sou o elfo " << nome << "." << endl;
    }
};


class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}

    void apresentar() {
        cout << "Encantada em conhece-lo, eu sou a fada " << nome << "." << endl;
    }
};

int main() {

    SerVivo* seres[3];


    seres[0] = new Humano("Arthur");
    seres[1] = new Elfo("Legolas");
    seres[2] = new Fada("Tinkerbell");

 
    for (int i = 0; i < 3; i++) {
        seres[i]->apresentar();
    }


    for (int i = 0; i < 3; i++) {
        delete seres[i];
    }

    return 0;
}


