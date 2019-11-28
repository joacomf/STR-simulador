require_relative './planificador'

class PlanificadorFIFO < Planificador
  def procesar(tarea)
    until tarea.es_ejecutable?
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
    until simulacion_finalizada?
      tarea = @tareas.pop
      procesar(tarea)
      @tareas.push(tarea)
      return if simulacion_finalizada?

      @ejecutadas += 1
    end
  end
end
