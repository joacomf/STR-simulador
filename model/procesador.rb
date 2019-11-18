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
    tareas_por_procesar.each do
      @procesadas << @tareas.shift
    end
  end

  def cantidad_procesadas
    @procesadas.count
  end
end
