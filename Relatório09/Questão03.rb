# ----- Classe MicroondasUnidade (Composição) -----
class MicroondasUnidade
  def aquecer_por(minutos)
    puts "Microondas aquecendo por #{minutos} minutos..."
  end
end

# ----- Classe DMail (Agregação) -----
class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "[#{@hora_envio}] #{@conteudo}"
  end
end

# ----- Classe TelefoneDeMicroondas -----
class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new  # composição
    @dmails = []                      # agregação
  end

  # Método para enviar DMail
  def enviar_dmail
    print "Digite o conteúdo do D-Mail: "
    conteudo = gets.chomp

    print "Digite a hora de envio (ex: 10:30): "
    hora_envio = gets.chomp

    # Simular aquecimento
    @unidade.aquecer_por(1)  # aquecer 1 minuto apenas como exemplo

    # Criar e adicionar DMail à lista
    dmail = DMail.new(conteudo, hora_envio)
    @dmails << dmail

    puts "D-Mail enviado com sucesso!"
  end

  # Listar D-Mails após o horário de corte
  def listar_dmails(horario_corte)
    selecionados = @dmails.select { |d| d.hora_envio > horario_corte }
    if selecionados.empty?
      puts "Nenhum D-Mail enviado após #{horario_corte}."
    else
      puts "\nD-Mails enviados após #{horario_corte}:"
      selecionados.each { |d| puts d }
    end
  end
end

# ----- Main -----
telefone = TelefoneDeMicroondas.new

# Exemplo de envio de 2 D-Mails
2.times do
  telefone.enviar_dmail
end

# Filtrar D-Mails por horário
print "\nDigite o horário de corte (ex: 10:30) para listar D-Mails posteriores: "
horario_corte = gets.chomp

telefone.listar_dmails(horario_corte)
