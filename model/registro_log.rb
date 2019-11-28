require 'json'

class RegistroLog
  attr_accessor :tiempo_actual, :ejecucion_actual, :ejecuciones_totales, :numero_tarea

  def initialize(tiempo_actual: 0, ejecucion_actual: 0, ejecuciones_totales: 0, numero_tarea: nil)
    @tiempo_actual = tiempo_actual
    @ejecucion_actual = ejecucion_actual
    @ejecuciones_totales = ejecuciones_totales
    @numero_tarea = numero_tarea
  end

  def to_hash
    {
      tiempo_actual: @tiempo_actual,
      ejecucion_actual: @ejecucion_actual,
      ejecuciones_totales: @ejecuciones_totales,
      numero_tarea: @numero_tarea
    }
  end

  def to_json(_param)
    to_hash.to_json
  end
end
