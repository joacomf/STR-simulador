require_relative '../logger'

class DeadlineAlcanzadoError < StandardError
  attr_reader :thing
  def initialize(msg = 'Deadline alcanzado para la tarea', debe_registrar = false)
    super(msg)
    Logger.excepcion(msg) if debe_registrar
  end
end
