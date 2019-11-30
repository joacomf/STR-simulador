require_relative '../logger'

class TareaYaFinalizadaError < StandardError
  attr_reader :thing
  def initialize(msg = 'Tarea ya finalizada, no se puede ejecutar', debe_registrar = false)
    super(msg)
    Logger.excepcion(msg) if debe_registrar
  end
end
