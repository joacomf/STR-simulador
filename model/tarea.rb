class Tarea
  attr_accessor :tiempo, :inicio, :periodo, :prioridad, :deadline

  def initialize(inicio = 0, tiempo = 0, periodo = 0, prioridad = 0, deadline = 0)
    raise StandardError, 'Deadline debe ser mayor o igual a Tiempo' if tiempo > deadline
    raise StandardError, 'Periodo debe ser mayor o igual a Tiempo' if tiempo > periodo

    @periodo = periodo
    @deadline = deadline
    @prioridad = prioridad
    @inicio = inicio
    @tiempo = tiempo
  end
end
