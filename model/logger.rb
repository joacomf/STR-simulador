class Logger
  def self.ejecucion(tiempo_actual, ejecucion_actual, ejecuciones_totales, numero_tarea)
    puts "Tiempo #{tiempo_actual}. Ejecución de #{ejecucion_actual} de tarea ##{numero_tarea}. Total #{ejecuciones_totales}"
  end

  def self.nop(tiempo_actual)
    puts "Tiempo #{tiempo_actual}. Nop ejecutado"
  end
end
