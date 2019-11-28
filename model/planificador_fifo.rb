require_relative './planificador'

class PlanificadorFIFO < Planificador
  def initialize(procesador)
    tareas = PQueue.new([]) do |tarea1, tarea2|
      criterio(tarea1, tarea2)
    end

    super(procesador: procesador, tareas: tareas)
  end

  def obtener_tarea
    tarea_seleccionada = @nop

    tarea = @tareas.top
    tarea_seleccionada = tarea if !tarea.nil? && tarea.es_ejecutable?

    tarea_seleccionada
  end

  def tratar(ultima_ejecucion)
    super(ultima_ejecucion)
    @tareas.push(@tareas.pop) if ultima_ejecucion
  end

  def criterio(tarea1, tarea2)
    if tarea1.tiempo_inicio == tarea2.tiempo_inicio
      tarea1.deadline < tarea2.deadline
    else
      tarea1.tiempo_inicio < tarea2.tiempo_inicio
    end
  end
end
