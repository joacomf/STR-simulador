require_relative '../model/procesador'

class Programador
  def initialize(procesador)
    @procesadores = []
    @procesadores << procesador
  end

  def procesadores
    @procesadores.size
  end
end
