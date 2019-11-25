require 'rspec'
require_relative '../model/programador'
require_relative '../model/procesador'
require_relative '../model/nop'

describe Programador do
  let(:procesador) { Procesador.new }
  let(:tarea) { Tarea.new(tiempo: 10, periodo: 30, deadline: 20) }
  let(:programador) { described_class.new(procesador) }

  it 'deberia crearse con un procesador' do
    expect(programador.procesador).to eq procesador
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    programador.encolar(tarea)

    expect(programador.tareas.count).to eq 1
  end

  describe 'con multiples tareas' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)

      programador.encolar(tarea_a)
      programador.encolar(tarea_b)
      programador.encolar(tarea_c)
      programador.encolar(tarea_d)
    end

    it 'deberia tener 4 tareas' do
      expect(programador.tareas.count).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 10)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 30)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 40)

      programador.encolar(tarea_a)
      programador.encolar(tarea_b)
      programador.encolar(tarea_c)
      programador.encolar(tarea_d)
    end

    it 'deberia tener 4 tareas procesadas' do
      programador.simular

      expect(programador.ejecutadas).to eq 4
    end
  end

  describe 'cuando la tarea no esta lista' do
    before(:each) do
      tarea_a = Tarea.new(tiempo: 2, periodo: 8, tiempo_inicio: 0)
      tarea_b = Tarea.new(tiempo: 4, periodo: 6, tiempo_inicio: 4)

      programador.encolar(tarea_a)
      programador.encolar(tarea_b)

      programador.simular(5)
    end

    it 'deberia ejecutar NOP si la siguiente tarea no es ejecutable' do
      expect(programador.nop.ciclos_completados).to eq 2
    end
  end
end
