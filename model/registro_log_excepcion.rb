require 'json'

class RegistroLogException
  attr_accessor :mensaje

  def initialize(mensaje)
    @mensaje = mensaje
  end

  def to_hash
    {
      mensaje: @mensaje
    }
  end

  def to_json(_param)
    to_hash.to_json
  end
end
