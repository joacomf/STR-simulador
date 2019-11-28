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
    @procesador.procesar(tarea)
  end

  def simular(max_ciclos = 200)
    @max_ciclos = max_ciclos
    until simulacion_finalizada?
      tarea = obtener_tarea
      ultima_ejecucion = tarea.ultimo_periodo?
      procesar(tarea)
      tratar(ultima_ejecucion)
    end
  end

  def tratar(ultima_ejecucion)
    @ejecutadas += 1 if ultima_ejecucion
  end

  def criterio(tarea1, tarea2); end

  def simulacion_finalizada?
    @max_ciclos <= @reloj.tiempo
  end
end
