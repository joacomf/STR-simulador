require_relative './tarea'
require_relative './reloj'

class Procesador
  attr_accessor :tareas, :reloj, :ejecutadas

  def initialize
    @tareas = []
    @reloj = Reloj.new
    @ejecutadas = 0
  end

  def tarea(tarea)
    tarea.reloj = @reloj
    @tareas << tarea
  end

  def procesar
    @tareas.each do |tarea|
      tarea.tiempo.times do
        tarea.ejecutar
      end
      @ejecutadas += 1
    end
    @reloj.incrementar
  end
end
