require_relative '../model/procesador'
require_relative './tarea'
require_relative './reloj'

class Programador
  attr_accessor :tareas, :ejecutadas, :procesador

  def initialize(procesador)
    @tareas = []
    @procesador = procesador
    @ejecutadas = 0
  end

  def encolar(tarea)
    tarea.reloj = procesador.reloj
    @tareas << tarea
  end

  def procesar(tarea)
    tarea.tiempo.times do
      @procesador.procesar(tarea)
    end
  end

  def simular
    @tareas.each do |tarea|
      procesar(tarea)
      @ejecutadas += 1
    end
  end
end
