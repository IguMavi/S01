class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia
    
    @property
    def vida(self):
        return self._vida
    
    @vida.setter
    def vida(self, valor: int):
        if valor < 0:
            self._vida = 0
        else:
            self._vida = valor
    
    @property
    def resistencia(self):
        return self._resistencia
    
    @resistencia.setter
    def resistencia(self, valor: int):
        if valor < 0:
            self._resistencia = 0
        else:
            self._resistencia = valor
    
    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self._armadura_pesada = armadura_pesada
    
    @property
    def armadura_pesada(self):
        return self._armadura_pesada
    
    @armadura_pesada.setter
    def armadura_pesada(self, valor: bool):
        self._armadura_pesada = valor
    
    def __str__(self):
        tipo_armadura = "Armadura Pesada" if self._armadura_pesada else "Armadura Normal"
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e {tipo_armadura}"


# Exemplo de uso:
if __name__ == "__main__":
    personagem1 = Personagem(100, 50)
    print(personagem1)
    cavaleiro1 = Cavaleiro(150, 80, True)
    print(cavaleiro1)
    
    cavaleiro2 = Cavaleiro(120, 60, False)
    print(cavaleiro2)
    
    # setters
    personagem1.vida = 80
    personagem1.resistencia = 40
    print(f"\nApós modificar: {personagem1}")
    
    cavaleiro1.vida = 130
    cavaleiro1.armadura_pesada = False
    print(f"Após modificar: {cavaleiro1}")
