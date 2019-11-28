require_relative './planificador'

class PlanificadorPorPrioridad < Planificador
  def initialize(procesador)
    super(procesador: procesador)
  end

  def siguiente_tarea
    tarea_seleccionada = @nop
    @tareas.each do |tarea|
      tarea_seleccionada = tarea if tarea.es_ejecutable? && criterio(tarea, tarea_seleccionada)
    end

    tarea_seleccionada
  end

  def criterio(tarea1, tarea2)
    tarea1.prioridad < tarea2.prioridad
  end
end
