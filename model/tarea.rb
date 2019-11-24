class Tarea
  attr_accessor :inicio, :tiempo, :periodo, :prioridad, :deadline, :pendiente, :reloj

  def initialize(tiempo = 0, periodo = nil, prioridad = nil, deadline = nil, reloj = nil)
    raise StandardError, 'Deadline debe ser mayor o igual a Tiempo' if !deadline.nil? && tiempo > deadline
    raise StandardError, 'Periodo debe ser mayor o igual a Tiempo' if !periodo.nil? && tiempo > periodo

    @periodo = periodo
    @deadline = deadline
    @prioridad = prioridad
    @tiempo = tiempo
    @pendiente = tiempo
    @reloj = reloj
  end

  def ejecutar
    @pendiente -= 1
  end
end
