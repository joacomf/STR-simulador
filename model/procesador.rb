require_relative './tarea'

class Procesador
  attr_accessor :tareas, :procesadas

  def initialize
    @tareas = []
    @procesadas = []
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
  end

  def cantidad_procesadas
    @procesadas.count
  end
end
