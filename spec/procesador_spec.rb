require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }
  let(:tarea) { Tarea.new(0, 10, 30, 5, 20) }

  it 'deberia crearse sin tareas pendientes' do
    expect(procesador.pendientes).to eq 0
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador.tarea(tarea)

    expect(procesador.pendientes).to eq 1
  end

  describe 'con multiples tareas' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10)
      tarea_b = Tarea.new(tiempo: 1)
      tarea_c = Tarea.new(tiempo: 5)
      tarea_d = Tarea.new(tiempo: 8)

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
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10)
      tarea_b = Tarea.new(tiempo: 1)
      tarea_c = Tarea.new(tiempo: 5)
      tarea_d = Tarea.new(tiempo: 8)

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
end
