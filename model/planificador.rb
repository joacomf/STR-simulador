require_relative '../model/procesador'
require_relative './tarea'
require_relative './reloj'
require 'pqueue'

class Planificador
  attr_accessor :tareas, :ejecutadas, :procesador, :nop

  def initialize(procesador: nil, tareas: [])
    @tareas = tareas
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
    ultima_ejecucion = tarea.ultimo_periodo?
    @procesador.procesar(tarea)
    tratar(ultima_ejecucion)
  end

  def simular(max_ciclos = 200)
    @max_ciclos = max_ciclos
    procesar(siguiente_tarea) until simulacion_finalizada?
  end

  def tratar(ultima_ejecucion)
    @ejecutadas += 1 if ultima_ejecucion
  end

  def siguiente_tarea; end

  def criterio(tarea1, tarea2); end

  def simulacion_finalizada?
    @max_ciclos <= @reloj.tiempo
  end
end
