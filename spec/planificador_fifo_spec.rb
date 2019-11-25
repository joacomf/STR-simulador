require 'rspec'
require_relative '../model/planificador_fifo'
require_relative '../model/procesador'
require_relative '../model/tarea'

describe PlanificadorFIFO do
  let(:procesador) { Procesador.new }
  let(:planificadorFIFO) { described_class.new(procesador) }
  let(:tarea1) { Tarea.new(tiempo: 5, periodo: 10, reloj: procesador.reloj, nombre: 'tarea1') }
  let(:tarea2) { Tarea.new(tiempo: 3, periodo: 15, reloj: procesador.reloj, nombre: 'tarea2') }

  before(:each) do
    planificadorFIFO.encolar(tarea1)
    planificadorFIFO.encolar(tarea2)
  end

  it 'debe ejecutar 1 vez las 2 tareas en un ciclo' do
    planificadorFIFO.simular(9)

    expect(tarea1.ciclos_completados).to eq 1
    expect(tarea2.ciclos_completados).to eq 1
  end

  describe 'con multiples tareas al procesar cantidad de ejecuciones' do
    let(:tarea_a) { Tarea.new(tiempo: 1, periodo: 5, deadline: 5, reloj: procesador.reloj, nombre: 'tarea_a') }
    let(:tarea_b) { Tarea.new(tiempo: 4, periodo: 30, deadline: 20, reloj: procesador.reloj, nombre: 'tarea_b') }
    let(:planificadorFIFO) { described_class.new(procesador) }
    before(:each) do
      planificadorFIFO.encolar(tarea_a)
      planificadorFIFO.encolar(tarea_b)
    end

    it 'deberia tener 4 tareas procesadas' do
      planificadorFIFO.simular(20)

      expect(tarea_a.ciclos_completados).to eq 4
      expect(tarea_b.ciclos_completados).to eq 1
    end
  end

  describe 'deberia lanzar error' do
    let(:planificadorFIFO) { described_class.new(procesador) }
    before(:each) do
      tarea1 = Tarea.new(tiempo: 5, periodo: 6, reloj: procesador.reloj, nombre: 'tarea1')
      tarea2 = Tarea.new(tiempo: 3, periodo: 7, reloj: procesador.reloj, nombre: 'tarea2')

      planificadorFIFO.encolar(tarea1)
      planificadorFIFO.encolar(tarea2)
    end

    it 'al ejecutar una tarea que no cumple el deadline' do
      expect { planificadorFIFO.simular(10) }.to raise_exception TareaEjecucionError
    end
  end
end
