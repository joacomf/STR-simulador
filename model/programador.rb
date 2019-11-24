require_relative '../model/procesador'
require_relative './tarea'
require_relative './reloj'

class Programador
  attr_accessor :tareas, :ejecutadas

  def initialize(procesador)
    @tareas = []
    @procesadores = []
    @procesadores << procesador
    @ejecutadas = 0
  end

  def procesadores
    @procesadores.size
  end

  def encolar(procesador, tarea)
    tarea.reloj = procesador.reloj
    @tareas << tarea
  end

  def procesar(_procesador, tarea)
    tarea.tiempo.times do
      tarea.ejecutar
    end
  end

  def simular
    @tareas.each do |tarea|
      procesar(@procesadores[0], tarea)
      @ejecutadas += 1
    end
  end
end
