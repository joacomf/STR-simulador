require 'rspec'
require_relative '../model/planificador_fifo'
require_relative '../model/procesador'
require_relative '../model/tarea'

describe PlanificadorFIFO do
  it 'debe ejecutar 1 vez las 2 tareas en un ciclo' do
    procesador = Procesador.new
    planificador_fifo = described_class.new(procesador)
    tarea1 = Tarea.new(tiempo: 5, periodo: 10, reloj: procesador.reloj, nombre: 'tarea1')
    tarea2 = Tarea.new(tiempo: 3, periodo: 15, reloj: procesador.reloj, nombre: 'tarea2')
    planificador_fifo.encolar(tarea1)
    planificador_fifo.encolar(tarea2)
    planificador_fifo.simular(9)

    expect(tarea1.ciclos_completados).to eq 1
    expect(tarea2.ciclos_completados).to eq 1
  end

  describe 'con multiples tareas al procesar cantidad de ejecuciones' do
    it 'deberia tener 4 tareas procesadas' do
      procesador = Procesador.new
      tarea_a = Tarea.new(tiempo: 1, periodo: 5, deadline: 5, reloj: procesador.reloj, nombre: 'tarea_a')
      tarea_b = Tarea.new(tiempo: 4, periodo: 30, deadline: 20, reloj: procesador.reloj, nombre: 'tarea_b')

      planificador_fifo = described_class.new(procesador)

      planificador_fifo.encolar(tarea_a)
      planificador_fifo.encolar(tarea_b)
      planificador_fifo.simular(20)

      expect(tarea_a.ciclos_completados).to eq 4
      expect(tarea_b.ciclos_completados).to eq 1
    end
  end

  describe 'deberia lanzar error' do
    it 'al ejecutar una tarea que no cumple el deadline' do
      procesador = Procesador.new
      tarea1 = Tarea.new(tiempo: 5, periodo: 6, reloj: procesador.reloj, nombre: 'tarea1')
      tarea2 = Tarea.new(tiempo: 3, periodo: 7, reloj: procesador.reloj, nombre: 'tarea2')

      planificador_fifo = described_class.new(procesador)

      planificador_fifo.encolar(tarea1)
      planificador_fifo.encolar(tarea2)

      expect { planificador_fifo.simular(10) }.to raise_exception TareaEjecucionError
    end
  end
end
