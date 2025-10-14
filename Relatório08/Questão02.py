from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao
    
    @abstractmethod
    def usar_ultimate(self):
        pass
    
    def __str__(self):
        return f"{self.nome} - {self.funcao}"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")
    
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) usa: PROTEÇÃO")
        return "Protege os aliados"


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")
    
    def usar_ultimate(self):
        print(f"{self.nome} (Dano) usa: RAIO DA MORTE")
        return "Dano concentrado e eliminação"


def main():
    equipe = []
    
    equipe.append(Tanque("Reinhardt"))
    equipe.append(Dano("Soldado: 76"))
    equipe.append(Tanque("D.Va"))
    equipe.append(Dano("Hanzo"))
    equipe.append(Tanque("Winston"))
    equipe.append(Dano("McCree"))
    
    for heroi in equipe:
        resultado = heroi.usar_ultimate()
        print(f"   Efeito: {resultado}\n")
    
    print("=== TODAS AS ULTIMATES FORAM UTILIZADAS! ===")



if __name__ == "__main__":
    main()
