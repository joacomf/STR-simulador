require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }
  let(:tarea) { Tarea.new(10, 30, 5, 20) }

  it 'deberia crearse con reloj en 0' do
    expect(procesador.reloj).to eq 0
  end

  it 'deberia crearse sin tareas pendientes' do
    expect(procesador.pendientes).to eq 0
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador.tarea(tarea)

    expect(procesador.pendientes).to eq 1
  end

  describe 'con multiples tareas' do
    before(:each) do
      tarea_a = Tarea.new(10)
      tarea_b = Tarea.new(1)
      tarea_c = Tarea.new(5)
      tarea_d = Tarea.new(8)

      procesador.tarea(tarea_a)
      procesador.tarea(tarea_b)
      procesador.tarea(tarea_c)
      procesador.tarea(tarea_d)
    end

    it 'deberia tener 4 tareas pendientes al asignarle 4 tareas' do
      expect(procesador.pendientes).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    let(:procesador) { described_class.new }

    before(:each) do
      tarea_a = Tarea.new(10)
      tarea_b = Tarea.new(1)
      tarea_c = Tarea.new(5)
      tarea_d = Tarea.new(8)

      procesador.tarea(tarea_a)
      procesador.tarea(tarea_b)
      procesador.tarea(tarea_c)
      procesador.tarea(tarea_d)
    end

    it 'deberia tener 4 tareas procesadas' do
      procesador.procesar

      expect(procesador.pendientes).to eq 0
      expect(procesador.cantidad_procesadas).to eq 4
    end
  end

  describe 'con un reloj' do
    it 'deberia avanzar un tiempo al procesar 1 iteración' do
      tarea = Tarea.new(1)

      procesador.tarea(tarea)
      procesador.procesar

      expect(procesador.reloj).to eq 1
    end
  end
end
