require_relative './tarea'
require_relative './reloj'
require_relative './exceptions/deadline_alcanzado_error'

class Procesador
  attr_accessor :reloj

  def initialize
    @reloj = Reloj.new
  end

  def procesar(tarea)
    begin
      tarea.ejecutar
    rescue DeadlineAlcanzadoError
      tarea.reiniciar
      raise DeadlineAlcanzadoError
    end
    @reloj.incrementar
  end
end
