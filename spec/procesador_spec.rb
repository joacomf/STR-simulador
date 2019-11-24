require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }
  let(:tarea) { Tarea.new(tiempo: 10, periodo: 30, deadline: 20) }

  it 'deberia crearse con reloj en 0' do
    expect(procesador.reloj.tiempo).to eq 0
  end

  describe 'con un reloj' do
    it 'deberia avanzar un tiempo al procesar 1 iteración' do
      tarea = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea.reloj = procesador.reloj

      procesador.procesar(tarea)

      expect(procesador.reloj.tiempo).to eq 1
    end
  end
end
