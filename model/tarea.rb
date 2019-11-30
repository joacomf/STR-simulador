require_relative './exceptions/deadline_alcanzado_error'
require_relative './exceptions/tarea_ya_finalizada_error'

class Tarea
  attr_accessor :tiempo, :periodo, :prioridad, :deadline, :pendiente, :reloj, :tiempo_inicio, :ciclos_completados, :nombre

  def initialize(tiempo: 0, periodo:, deadline: nil, reloj: nil, tiempo_inicio: 0, nombre: 'unnamed', prioridad: 1)
    raise TareaInitializeError, 'Deadline debe ser mayor o igual a Tiempo' if !deadline.nil? && tiempo > deadline
    raise TareaInitializeError, 'Periodo debe ser mayor o igual a Tiempo' if !periodo.nil? && tiempo > periodo

    @nombre = nombre
    @periodo = periodo
    @deadline = if deadline.nil?
                  periodo
                else
                  deadline
                end
    @prioridad = prioridad
    @tiempo = tiempo
    @tiempo_inicio = tiempo_inicio
    @pendiente = tiempo
    @reloj = reloj
    @ciclos_completados = 0
  end

  def ejecutar
    raise TareaYaFinalizadaError.new("Tarea  ##{@nombre} finalizada, no se puede ejecutar", true) if @pendiente.zero?
    raise DeadlineAlcanzadoError.new("La tarea ##{@nombre} llego al Deadline, no se puede ejecutar", true) if @deadline <= @reloj.tiempo

    @pendiente -= 1
    unidades_de_tiempo_ejecutadas = @tiempo - @pendiente
    Logger.ejecucion(@reloj.tiempo, unidades_de_tiempo_ejecutadas, @tiempo, @nombre)

    reiniciar if termino_periodo?
  end

  def termino_periodo?
    @pendiente.zero?
  end

  def ultimo_periodo?
    @pendiente == 1
  end

  def es_ejecutable?
    @tiempo_inicio <= @reloj.tiempo
  end

  def reiniciar
    @tiempo_inicio += @periodo
    @pendiente = @tiempo
    @deadline += @periodo
    @ciclos_completados += 1
  end
end
