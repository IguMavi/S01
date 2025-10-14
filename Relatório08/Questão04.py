from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo: float, funcao: str):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, custo_implante: float, funcao_implante: str):
        self._implante = Implante(custo_implante, funcao_implante)
    
    def realizar_hack(self):
        print(f"Hack realizado com {self._implante.funcao}")

class Faccao:
    def __init__(self, membros: list[Cibernetico]):
        self.membros = membros

def main():
    netrunner1 = NetRunner(15000.0, "Controle Neural")
    netrunner2 = NetRunner(12000.0, "Extração de Dados")
    netrunner3 = NetRunner(18000.0, "Quebra de Segurança")
    
    faccao = Faccao([netrunner1, netrunner2, netrunner3])
    
    for membro in faccao.membros:
        membro.realizar_hack()

if __name__ == "__main__":
    main()
