class Logger
  def self.ejecucion(tiempo_actual, ejecucion_actual, ejecuciones_totales)
    puts "Tiempo #{tiempo_actual}. Ejecución de #{ejecucion_actual} de tarea #1. Total #{ejecuciones_totales}"
  end

  def self.nop(tiempo_actual)
    puts "Tiempo #{tiempo_actual}. Nop ejecutado"
  end
end
