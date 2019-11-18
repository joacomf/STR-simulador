require_relative './tarea'

class Procesador
  attr_accessor :tareas

  def initialize
    @tareas = []
  end

  def tarea(tarea)
    @tareas << tarea
  end

  def pendientes
    @tareas.count
  end
end
