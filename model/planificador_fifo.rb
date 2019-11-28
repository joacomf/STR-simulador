require_relative './planificador'

class PlanificadorFIFO < Planificador
  def initialize(procesador)
    tareas = PQueue.new([]) do |tarea1, tarea2|
      criterio(tarea1, tarea2)
    end
    super(procesador, tareas)
  end

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

  def criterio(tarea1, tarea2)
    if tarea1.tiempo_inicio == tarea2.tiempo_inicio
      tarea1.deadline < tarea2.deadline
    else
      tarea1.tiempo_inicio < tarea2.tiempo_inicio
    end
  end
end
