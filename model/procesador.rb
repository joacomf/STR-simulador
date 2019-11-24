require_relative './tarea'

class Procesador
  attr_accessor :tareas, :procesadas, :reloj

  def initialize
    @tareas = []
    @procesadas = []
    @reloj = 0
  end

  def tarea(tarea)
    @tareas << tarea
  end

  def pendientes
    @tareas.count
  end

  def procesar
    tareas_por_procesar = @tareas.clone
    tareas_por_procesar.each_with_index do |tarea, indice|
      tarea.tiempo.times do
        puts 'Ejecución de tarea ' + indice.to_s
      end
      @procesadas << @tareas.shift
    end
    @reloj += 1
  end

  def cantidad_procesadas
    @procesadas.count
  end
end
