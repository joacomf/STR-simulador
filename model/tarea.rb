class Tarea
  attr_accessor :tiempo, :inicio, :prioridad, :deadline

  def initialize(inicio, tiempo, prioridad, deadline)
    raise StandardError, 'Deadline debe ser mayor o igual a Tiempo' if tiempo > deadline

    @deadline = deadline
    @prioridad = prioridad
    @inicio = inicio
    @tiempo = tiempo
  end
end
