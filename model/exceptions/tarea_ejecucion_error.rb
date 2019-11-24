class TareaEjecucionError < StandardError
  attr_reader :thing
  def initialize(msg = 'Error al ejecutar tarea')
    super(msg)
  end
end
