require_relative '../model/procesador'
require_relative './tarea'
require_relative './reloj'
require 'pqueue'

class Programador
  attr_accessor :tareas, :ejecutadas, :procesador, :nop

  def initialize(procesador)
    @tareas = PQueue.new([]) do |tarea1, tarea2|
      if tarea1.tiempo_inicio == tarea2.tiempo_inicio
        tarea1.deadline < tarea2.deadline
      else
        tarea1.tiempo_inicio < tarea2.tiempo_inicio
      end
    end
    @procesador = procesador
    @reloj = procesador.reloj
    @ejecutadas = 0
    @nop = Nop.new(reloj: @reloj)
  end

  def encolar(tarea)
    tarea.reloj = procesador.reloj
    @tareas.push(tarea)
  end

  def procesar(tarea)
    while !tarea.es_ejecutable?
      return if simulacion_finalizada?
      @procesador.procesar(@nop)
    end
    tarea.tiempo.times do
      return if simulacion_finalizada?
      @procesador.procesar(tarea)
    end
  end

  def simular(max_ciclos = 200)
    @max_ciclos = max_ciclos
    while !simulacion_finalizada?
      tarea = @tareas.pop
      procesar(tarea)
      @tareas.push(tarea)
      return if simulacion_finalizada?
      @ejecutadas += 1
    end
  end

  def simulacion_finalizada?
    @max_ciclos <= @reloj.tiempo
  end
end
