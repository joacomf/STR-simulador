class Reloj
  attr_reader :tiempo

  def initialize(tiempo_inicio = 0)
    @tiempo = tiempo_inicio
  end

  def incrementar
    @tiempo += 1
  end
end
