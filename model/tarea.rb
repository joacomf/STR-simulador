class Tarea
  attr_accessor :tiempo, :inicio, :prioridad

  def initialize(inicio, tiempo, prioridad)
    @prioridad = prioridad
    @inicio = inicio
    @tiempo = tiempo
  end
end
