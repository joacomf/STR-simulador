require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }
  let(:tarea) { Tarea.new(tiempo: 10, periodo: 30, deadline: 20) }

  it 'deberia crearse con reloj en 0' do
    expect(procesador.reloj.tiempo).to eq 0
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador.tarea(tarea)

    expect(procesador.tareas.count).to eq 1
  end

  describe 'con multiples tareas' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      procesador.tarea(tarea_a)
      procesador.tarea(tarea_b)
      procesador.tarea(tarea_c)
      procesador.tarea(tarea_d)
    end

    it 'deberia tener 4 tareas' do
      expect(procesador.tareas.count).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    let(:procesador) { described_class.new }

    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      procesador.tarea(tarea_a)
      procesador.tarea(tarea_b)
      procesador.tarea(tarea_c)
      procesador.tarea(tarea_d)
    end

    it 'deberia tener 4 tareas procesadas' do
      procesador.procesar

      expect(procesador.ejecutadas).to eq 4
    end
  end

  describe 'con un reloj' do
    it 'deberia avanzar un tiempo al procesar 1 iteración' do
      tarea = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      procesador.tarea(tarea)
      procesador.procesar

      expect(procesador.reloj.tiempo).to eq 1
    end
  end
end
