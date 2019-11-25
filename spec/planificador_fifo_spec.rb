require 'rspec'
require_relative '../model/planificador_fifo'
require_relative '../model/procesador'
require_relative '../model/tarea'

describe PlanificadorFIFO do
  let(:procesador) { Procesador.new }
  let(:planificadorFIFO) { described_class.new(procesador) }

  before(:each) do
    tarea1 = Tarea.new(tiempo: 5, periodo: 10)
    tarea2 = Tarea.new(tiempo: 3, periodo: 15)

    planificadorFIFO.encolar(tarea1)
    planificadorFIFO.encolar(tarea2)
  end

  it 'debe ejecutar por 2 periodos las 2 tareas en orden de llegada' do
    planificadorFIFO.simular(2)

    expect(planificadorFIFO.tareas[0].ciclos_completados).to eq 2
    expect(planificadorFIFO.tareas[1].ciclos_completados).to eq 2
  end

  describe 'deberia lanzar error' do
    before(:each) do
      tarea1 = Tarea.new(tiempo: 5, periodo: 6)
      tarea2 = Tarea.new(tiempo: 3, periodo: 8)

      planificadorFIFO.encolar(tarea1)
      planificadorFIFO.encolar(tarea2)
    end

    it 'al ejecutar una tarea que no cumple el deadline' do
      expect { planificadorFIFO.simular(1) }.to raise_exception TareaEjecucionError
    end
  end
end
