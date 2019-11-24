class Tarea
  attr_accessor :tiempo, :inicio, :periodo, :prioridad, :deadline, :ejecutado

  def initialize(tiempo = 0, periodo = nil, prioridad = nil, deadline = nil)
    raise StandardError, 'Deadline debe ser mayor o igual a Tiempo' if !deadline.nil? && tiempo > deadline
    raise StandardError, 'Periodo debe ser mayor o igual a Tiempo' if !periodo.nil? && tiempo > periodo

    @periodo = periodo
    @deadline = deadline
    @prioridad = prioridad
    @tiempo = tiempo
    @ejecutado = 0
  end

  def ejecutar
    @ejecutado += 1
  end
end
