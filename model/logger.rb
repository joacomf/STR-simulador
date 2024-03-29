require_relative './registro_log'
require_relative './registro_log_excepcion'
require 'json'
require 'time'

class Logger
  @registros = []
  RUTA = __dir__ + '/../resultados/'.freeze

  class << self
    attr_reader :registros
  end

  def self.ejecucion(tiempo_actual, ejecucion_actual, ejecuciones_totales, numero_tarea)
    @registros << RegistroLog.new(tiempo_actual: tiempo_actual,
                                  ejecucion_actual: ejecucion_actual,
                                  ejecuciones_totales: ejecuciones_totales,
                                  numero_tarea: numero_tarea)
    puts "Tiempo #{tiempo_actual}. Ejecución de #{ejecucion_actual} de tarea ##{numero_tarea}. Total #{ejecuciones_totales}"
  end

  def self.excepcion(mensaje)
    @registros << RegistroLogException.new(mensaje)
    puts mensaje
  end

  def self.nop(tiempo_actual)
    @registros << RegistroLog.new(tiempo_actual: tiempo_actual,
                                  ejecucion_actual: 1,
                                  ejecuciones_totales: 1,
                                  numero_tarea: 'NOP')
    puts "Tiempo #{tiempo_actual}. Nop ejecutado"
  end

  def self.reiniciar
    tiempo_ms = (Time.now.to_f * 1000.0).to_i.to_s
    ruta = RUTA + tiempo_ms + '.json'

    File.open(ruta, 'w+') do |f|
      f.write({ registros: @registros }.to_json)
    end

    @registros = []
  end

  def self.to_json
    @registros.map(&:to_hash).to_json
  end
end
