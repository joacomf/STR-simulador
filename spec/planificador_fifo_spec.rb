require 'rspec'
require_relative '../model/planificador_fifo'
require_relative '../model/procesador'
require_relative '../model/tarea'
require_relative '../model/exceptions/deadline_alcanzado_error'

describe PlanificadorFIFO do
  it 'debe ejecutar 1 vez las 2 tareas en un ciclo' do
    procesador = Procesador.new
    planificador_fifo = described_class.new(procesador)

    tarea1 = Tarea.new(tiempo: 5, periodo: 10, nombre: 'tarea1')
    tarea2 = Tarea.new(tiempo: 3, periodo: 15, nombre: 'tarea2')

    planificador_fifo.encolar(tarea1)
    planificador_fifo.encolar(tarea2)
    planificador_fifo.simular(9)

    expect(tarea1.ciclos_completados).to eq 1
    expect(tarea2.ciclos_completados).to eq 1
  end

  describe 'con multiples tareas al procesar cantidad de ejecuciones' do
    it 'deberia tener 4 tareas procesadas' do
      procesador = Procesador.new
      tarea_a = Tarea.new(tiempo: 1, periodo: 5, deadline: 5, nombre: 'tarea_a')
      tarea_b = Tarea.new(tiempo: 4, periodo: 30, deadline: 20, nombre: 'tarea_b')

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
      tarea1 = Tarea.new(tiempo: 5, periodo: 6, nombre: 'tarea1')
      tarea2 = Tarea.new(tiempo: 3, periodo: 7, nombre: 'tarea2')

      planificador_fifo = described_class.new(procesador)

      expect(procesador).to receive(:procesar).and_raise(DeadlineAlcanzadoError.new).at_least(1).time.and_call_original

      planificador_fifo.encolar(tarea1)
      planificador_fifo.encolar(tarea2)

      planificador_fifo.simular(10)
    end
  end

  describe 'con multiples tareas' do
    it 'deberia tener 4 tareas' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      planificador.encolar(tarea_a)
      planificador.encolar(tarea_b)
      planificador.encolar(tarea_c)
      planificador.encolar(tarea_d)

      expect(planificador.tareas.size).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    it 'deberia tener 4 tareas procesadas' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 11, nombre: 'tarea_a')
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 21, nombre: 'tarea_b')
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 31, nombre: 'tarea_c')
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 41, nombre: 'tarea_d')

      planificador.encolar(tarea_a)
      planificador.encolar(tarea_b)
      planificador.encolar(tarea_c)
      planificador.encolar(tarea_d)

      planificador.simular(41)

      expect(planificador.ejecutadas).to eq 4
    end
  end

  describe 'cuando la tarea no esta lista' do
    it 'deberia ejecutar NOP si la siguiente tarea no es ejecutable' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea1 = Tarea.new(tiempo: 2, periodo: 8, tiempo_inicio: 0, nombre: 'tarea1')
      tarea2 = Tarea.new(tiempo: 4, periodo: 6, tiempo_inicio: 4, nombre: 'tarea2')

      planificador.encolar(tarea1)
      planificador.encolar(tarea2)

      planificador.simular(5)
      expect(planificador.nop.ciclos_completados).to eq 2
    end
  end

  describe 'demostracion de planificador fifo con 500 ciclos' do
    it 'deberia tener 71 tareas procesadas' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo: 10, periodo: 40, deadline: 40, nombre: 'demo_tarea_a')
      tarea_b = Tarea.new(tiempo: 5, periodo: 60, deadline: 26,  nombre: 'demo_tarea_b')
      tarea_c = Tarea.new(tiempo: 12, periodo: 30, deadline: 50, nombre: 'demo_tarea_c')
      tarea_d = Tarea.new(tiempo: 4, periodo: 15, deadline: 40, nombre: 'demo_tarea_d')

      planificador.encolar(tarea_a)
      planificador.encolar(tarea_b)
      planificador.encolar(tarea_c)
      planificador.encolar(tarea_d)

      planificador.simular(500)

      expect(planificador.ejecutadas).to eq 71
    end
  end

  describe 'demostracion de planificador fifo con 50 ciclos' do
    it 'deberia tener 7 tareas procesadas' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo_inicio: 0, tiempo: 10, periodo: 15, deadline: 11, nombre: 'demo2_tarea_a')
      tarea_b = Tarea.new(tiempo_inicio: 11, tiempo: 5, periodo: 15, deadline: 17, nombre: 'demo2_tarea_b')

      planificador.encolar(tarea_a)
      planificador.encolar(tarea_b)

      planificador.simular(50)

      expect(planificador.ejecutadas).to eq 7
    end
  end

  describe 'demostracion de planificador fifo con 50 ciclos que falla' do
    it 'deberia tener 3 ciclos completados en cada tarea' do
      procesador = Procesador.new
      planificador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo_inicio: 0, tiempo: 10, periodo: 15, deadline: 11, nombre: 'demo3_tarea_a')
      tarea_b = Tarea.new(tiempo_inicio: 11, tiempo: 5, periodo: 15, deadline: 10, nombre: 'demo3_tarea_b')

      planificador.encolar(tarea_a)
      planificador.encolar(tarea_b)

      planificador.simular(50)

      expect(tarea_a.ciclos_completados).to eq 3
      expect(tarea_b.ciclos_completados).to eq 3
    end
  end
end
