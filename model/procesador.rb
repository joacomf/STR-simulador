require_relative './tarea'

class Procesador
  attr_accessor :tareas, :reloj, :ejecutadas

  def initialize
    @tareas = []
    @reloj = 0
    @ejecutadas = 0
  end

  def tarea(tarea)
    @tareas << tarea
  end

  def procesar
    @tareas.each_with_index do |tarea, indice|
      tarea.tiempo.times do
        puts 'Ejecución de tarea ' + indice.to_s
      end
      @ejecutadas += 1
    end
    @reloj += 1
  end
end
