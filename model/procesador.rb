require_relative './tarea'
require_relative './reloj'

class Procesador
  attr_accessor :reloj

  def initialize
    @reloj = Reloj.new
  end

  def procesar(tarea)
    tarea.ejecutar
    @reloj.incrementar
  end
end
