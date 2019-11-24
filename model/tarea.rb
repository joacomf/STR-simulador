require_relative './tarea'
require_relative './exceptions/tarea_initialize_error'

class Tarea
  attr_accessor :inicio, :tiempo, :periodo, :prioridad, :deadline, :pendiente, :reloj

  def initialize(tiempo = 0, periodo = nil, prioridad = nil, deadline = nil, reloj = nil)
    raise TareaInitializeError, 'Deadline debe ser mayor o igual a Tiempo' if !deadline.nil? && tiempo > deadline
    raise StandardError, 'Periodo debe ser mayor o igual a Tiempo' if !periodo.nil? && tiempo > periodo

    @periodo = periodo
    @deadline = if deadline.nil?
                  periodo
                else
                  deadline
                end
    @prioridad = prioridad
    @tiempo = tiempo
    @pendiente = tiempo
    @reloj = reloj
  end

  def ejecutar
    raise StandardError, 'Tarea finalizada, no se puede ejecutar' if @pendiente.zero?
    raise StandardError, 'La tarea llego al Deadline, no se puede ejecutar' if deadline <= reloj.tiempo

    @pendiente -= 1
    unidades_de_tiempo_ejecutadas = @tiempo - @pendiente
    Logger.ejecucion(@reloj.tiempo, unidades_de_tiempo_ejecutadas, tiempo)
  end
end
