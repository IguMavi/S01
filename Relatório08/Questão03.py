class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int, tipo: str = "Facas"):
        self.nome = nome
        self.dano = dano
        self.tipo = tipo
    
    def __str__(self):
        return f"{self.nome} ({self.tipo}) - Dano: {self.dano}"


class PhantomThieves:
    def __init__(self, nome: str, arma: ArmaCorpoACorpo):
        self.nome = nome
        self.arma = arma
    
    def __str__(self):
        return f"{self.nome} - Arma: {self.arma}"


class Joker:
    def __init__(self, membros_equipe: list[PhantomThieves]):
        self._arma = ArmaCorpoACorpo("Facas do Joker", 85, "Facas Duplas")
        self.nome = "Joker"
        self.alcunha = "Ladrão Fantasma"
        self.membros_equipe = membros_equipe
    
    @property
    def arma(self):
        return self._arma
    
    def mostrar_equipe(self):
        print("=" * 50)
        print(f"LÍDER: {self.nome} ({self.alcunha})")
        print(f"ARMA PESSOAL: {self.arma}")
        print("=" * 50)
        print("\nPHANTOM THIEVES - MEMBROS DA EQUIPE:")
        print("-" * 40)
        
        for i, membro in enumerate(self.membros_equipe, 1):
            print(f"{i}. {membro}")
    


def main():
    #Armas
    arma_ryuji = ArmaCorpoACorpo("Taco de Baseball", 70, "Contundente")
    arma_ann = ArmaCorpoACorpo("Chicote", 65, "Flexível")
    arma_yusuke = ArmaCorpoACorpo("Espada Japonesa", 80, "Corte")
    arma_makoto = ArmaCorpoACorpo("Soqueira", 75, "Impacto")
    
    #Membros
    ryuji = PhantomThieves("Ryuji", arma_ryuji)
    ann = PhantomThieves("Ann", arma_ann)
    yusuke = PhantomThieves("Yusuke", arma_yusuke)
    makoto = PhantomThieves("Makoto", arma_makoto)
    
    equipe = [ryuji, ann, yusuke, makoto]

    joker = Joker(equipe)
    joker.mostrar_equipe()


if __name__ == "__main__":
    main()
