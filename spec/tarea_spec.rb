require 'rspec'
require_relative '../model/tarea'
require_relative '../model/reloj'

describe Tarea do
  # Tarea(tiempo, periodo, prioridad, deadline)
  subject(:tarea) { described_class.new(tiempo: 5, periodo: 30, prioridad: 5, deadline: 20, reloj: Reloj.new) }

  it 'deberia crearse recibiendo tiempo' do
    expect(tarea.tiempo).to eq(5)
  end

  it 'deberia crearse recibiendo periodo' do
    expect(tarea.periodo).to eq(30)
  end

  it 'deberia lanzar excepcion si periodo es menor que tiempo' do
    expect { described_class.new(tiempo: 30, periodo: 10, prioridad: 5, deadline: 40) }.to raise_exception TareaInitializeError
  end

  it 'deberia crearse recibiendo prioridad' do
    expect(tarea.prioridad).to eq(5)
  end

  it 'deberia crearse recibiendo deadline' do
    expect(tarea.deadline).to eq(20)
  end

  it 'deberia crearse recibiendo reloj' do
    expect(tarea.reloj.tiempo).to eq(0)
  end

  it 'deberia lanzar excepcion si deadline es menor que tiempo' do
    expect { described_class.new(tiempo: 10, periodo: 30, prioridad: 5, deadline: 2) }.to raise_exception TareaInitializeError
  end

  describe 'con ejecución' do
    it 'deberia tener 4 pendiente de 5 tiempos al ejecutar 1 vez' do
      tarea.ejecutar

      expect(tarea.pendiente).to eq 4
      expect(tarea.tiempo).to eq 5
    end

    it 'deberia tener 2 pendiente de 5 tiempos al ejecutar 3 veces' do
      tarea.ejecutar
      tarea.ejecutar
      tarea.ejecutar

      expect(tarea.pendiente).to eq 2
      expect(tarea.tiempo).to eq 5
    end

    it 'deberia esperar una excepcion si se ejecuta una tarea que llego al deadline' do
      tarea.reloj = Reloj.new(20)
      expect { tarea.ejecutar }.to raise_exception TareaEjecucionError
    end

    it 'deberia esperar una excepcion si se ejecuta una tarea terminada' do
      tarea.pendiente = 0
      expect { tarea.ejecutar }.to raise_exception TareaEjecucionError
    end
  end
end
