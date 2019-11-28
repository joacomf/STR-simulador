require_relative './tarea'

class Nop < Tarea
  def initialize(reloj: nil)
    tiempo = 1
    periodo = 1
    prioridad = 1000

    super(tiempo: tiempo, periodo: periodo, reloj: reloj, tiempo_inicio: 0, prioridad: prioridad)
  end

  def ejecutar
    Logger.nop(@reloj.tiempo)
    reiniciar
  end
end
