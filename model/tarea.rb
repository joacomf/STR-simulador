require_relative './tarea'
require_relative './exceptions/tarea_initialize_error'
require_relative './exceptions/tarea_ejecucion_error'

class Tarea
  attr_accessor :inicio, :tiempo, :periodo, :prioridad, :deadline, :pendiente, :reloj, :tiempo_inicio, :ciclos_completados

  def initialize(tiempo: 0, periodo: nil, deadline: nil, reloj: nil, tiempo_inicio: 0)
    raise TareaInitializeError, 'Deadline debe ser mayor o igual a Tiempo' if !deadline.nil? && tiempo > deadline
    raise TareaInitializeError, 'Periodo debe ser mayor o igual a Tiempo' if !periodo.nil? && tiempo > periodo

    @periodo = periodo
    @deadline = if deadline.nil?
                  periodo
                else
                  deadline
                end
    @prioridad = 1
    @tiempo = tiempo
    @tiempo_inicio = tiempo_inicio
    @pendiente = tiempo
    @reloj = reloj
    @ciclos_completados = 0
  end

  def ejecutar
    raise TareaEjecucionError, 'Tarea finalizada, no se puede ejecutar' if @pendiente.zero?
    raise TareaEjecucionError, 'La tarea llego al Deadline, no se puede ejecutar' if deadline <= reloj.tiempo - @tiempo_inicio

    @pendiente -= 1
    unidades_de_tiempo_ejecutadas = @tiempo - @pendiente
    Logger.ejecucion(@reloj.tiempo, unidades_de_tiempo_ejecutadas, tiempo)

    reiniciar if termino_periodo
  end

  def termino_periodo
    @pendiente.zero?
  end

  def reiniciar
    @tiempo_inicio = @tiempo_inicio + @periodo + 1
    @pendiente = @tiempo
    @ciclos_completados += 1
  end
end
