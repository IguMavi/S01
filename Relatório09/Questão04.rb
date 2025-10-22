# ----- Módulos -----
module Rastreavel
  def obter_localizacao(hora)
    "#{@nome} está em #{@localizacao_atual} às #{hora}"
  end
end

module Perigoso
  def calcular_risco
    rand(1..10)  # Retorna um valor de risco aleatório entre 1 e 10
  end
end

# ----- Classe base -----
class Participante
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

# ----- Subclasses -----
class Detetive < Participante
  include Rastreavel

  attr_accessor :localizacao_atual

  def initialize(nome, localizacao_atual)
    super(nome)
    @localizacao_atual = localizacao_atual
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  attr_accessor :localizacao_atual

  def initialize(nome, localizacao_atual)
    super(nome)
    @localizacao_atual = localizacao_atual
  end
end

# ----- Classe Cenario -----
class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(p)
    @participantes << p
  end

  # Retorna apenas os participantes perigosos (que respondem a :calcular_risco)
  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

# ----- Main -----
# Coletar localização via gets
print "Digite a localização atual de Sherlock: "
local_sherlock = gets.chomp

print "Digite a localização atual de Moriarty: "
local_moriarty = gets.chomp

# Criar participantes
sherlock = Detetive.new("Sherlock", local_sherlock)
moriarty = MestreDoCrime.new("Moriarty", local_moriarty)

# Criar cenário e adicionar participantes
cenario = Cenario.new
cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

# Identificar ameaças
ameacas = cenario.identificar_ameacas

puts "\n--- Ameaças identificadas ---"
ameacas.each do |p|
  puts "#{p.nome} é perigoso com risco #{p.calcular_risco} e está em #{p.obter_localizacao("agora")}"
end
