class Tarea
  attr_accessor :tiempo, :inicio, :periodo, :prioridad, :deadline

  def initialize(inicio, tiempo, periodo, prioridad, deadline)
    raise StandardError, 'Deadline debe ser mayor o igual a Tiempo' if tiempo > deadline

    @periodo = periodo
    @deadline = deadline
    @prioridad = prioridad
    @inicio = inicio
    @tiempo = tiempo
  end
end
