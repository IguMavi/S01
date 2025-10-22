class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  # Getter explícito
  def preco_base
    @preco_base
  end

  # Setter explícito com validação
  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    else
      raise "O preço deve ser positivo!"
    end
  end

  # Método que pode ser sobrescrito
  def preco_final
    @preco_base
  end

  def to_s
    "Drink: #{@nome} | Preço base: $#{@preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@nome} | Preço final: $#{preco_final} | Anos desde criação: #{@anos_desde_criacao}"
  end
end

# ----- Main -----
print "Digite o nome do drink: "
nome = gets.chomp

print "Digite o preço base do drink: "
preco = gets.chomp.to_f

print "Digite quantos anos esse drink existe: "
anos = gets.chomp.to_i

drink_lenda = DrinkLenda.new(nome, preco, anos)

puts "\n--- Resultado ---"
puts drink_lenda.to_s
