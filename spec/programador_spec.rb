require 'rspec'
require_relative '../model/programador'
require_relative '../model/procesador'

describe Programador do
  let(:procesador) { Procesador.new }
  let(:programador) { described_class.new(procesador) }
  let(:tarea) { Tarea.new(tiempo: 10, periodo: 30, deadline: 20) }

  it 'deberia crearse con procesador' do
    expect(programador.procesadores).to eq 1
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    programador.encolar(procesador, tarea)

    expect(programador.tareas.count).to eq 1
  end

  describe 'con multiples tareas' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      programador.encolar(procesador, tarea_a)
      programador.encolar(procesador, tarea_b)
      programador.encolar(procesador, tarea_c)
      programador.encolar(procesador, tarea_d)
    end

    it 'deberia tener 4 tareas' do
      expect(programador.tareas.count).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      programador.encolar(procesador, tarea_a)
      programador.encolar(procesador, tarea_b)
      programador.encolar(procesador, tarea_c)
      programador.encolar(procesador, tarea_d)
    end

    it 'deberia tener 4 tareas procesadas' do
      programador.simular

      expect(programador.ejecutadas).to eq 4
    end
  end
end
