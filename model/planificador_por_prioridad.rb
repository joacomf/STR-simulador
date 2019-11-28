require_relative './planificador'

class PlanificadorPorPrioridad < Planificador
  def initialize(procesador)
    super(procesador)
  end

  def procesar(tarea)
    @procesador.procesar(tarea)
    @ejecutadas += 1
  end

  def simular(max_ciclos = 200)
    @max_ciclos = max_ciclos
    until simulacion_finalizada?
      tarea = obtener_tarea
      procesar(tarea)
    end
  end

  def obtener_tarea
    tarea_seleccionada = @nop
    @tareas.each do |tarea|
      tarea_seleccionada = tarea if tarea.es_ejecutable? && prioridad(tarea, tarea_seleccionada)
    end

    tarea_seleccionada
  end

  def prioridad(tarea1, tarea2)
    tarea1.prioridad < tarea2.prioridad
  end
end
