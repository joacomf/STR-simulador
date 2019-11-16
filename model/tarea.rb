class Tarea
  attr_accessor :tiempo, :inicio, :prioridad, :deadline

  def initialize(inicio, tiempo, prioridad, deadline)
    @deadline = deadline
    @prioridad = prioridad
    @inicio = inicio
    @tiempo = tiempo
  end
end
