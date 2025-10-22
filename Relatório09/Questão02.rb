# ----- Classe base -----
class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # Método abstrato: deve ser implementado nas subclasses
  def tocar_partitura(peca)
    raise NotImplementedError, "Subclasses devem implementar o método tocar_partitura"
  end

  def to_s
    "#{@nome} tocando #{@instrumento}"
  end
end

# ----- Subclasses -----
class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' no piano com emoção!"
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    puts "#{@nome} toca a peça '#{peca}' no violino com delicadeza!"
  end
end

# ----- Classe Maestro -----
class Maestro
  def initialize
    @musicos = []
  end

  # Adiciona músico ao conjunto
  def adicionar_musico(musico)
    @musicos << musico
  end

  # Inicia ensaio chamando tocar_partitura de cada músico (polimorfismo)
  def iniciar_ensaio(peca)
    puts "\n--- Ensaio da peça '#{peca}' iniciado ---"
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end

  # Muda o foco de cada músico e retorna novo array de mensagens
  def mudar_foco(estado)
    @musicos.map { |musico| "#{musico.nome} agora está #{estado}!" }
  end
end

# ----- Main -----
maestro = Maestro.new

# Criar músicos
maestro.adicionar_musico(Pianista.new("Kousei"))
maestro.adicionar_musico(Violinista.new("Kaori"))

# Input do usuário
print "Digite o nome da peça a ser tocada: "
peca = gets.chomp

# Iniciar ensaio
maestro.iniciar_ensaio(peca)

# Mudar foco
mensagens = maestro.mudar_foco("Concentrado")
puts "\n--- Mudança de foco ---"
mensagens.each { |msg| puts msg }
