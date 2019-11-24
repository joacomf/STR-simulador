class TareaInitializeError < StandardError
  attr_reader :thing
  def initialize(msg = 'Error al inicializar tarea')
    super(msg)
  end
end
