require 'rspec'
require_relative '../model/programador'
require_relative '../model/procesador'
require_relative '../model/nop'
require_relative '../model/reloj'

describe Programador do
  it 'deberia crearse con un procesador' do
    procesador = Procesador.new
    programador = described_class.new(procesador)
    expect(programador.procesador).to eq procesador
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador = Procesador.new
    reloj = Reloj.new
    tarea = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)

    programador = described_class.new(procesador)

    programador.encolar(tarea)

    expect(programador.tareas.size).to eq 1
  end

  describe 'con multiples tareas' do
    it 'deberia tener 4 tareas' do
      procesador = Procesador.new
      reloj = Reloj.new
      programador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)

      programador.encolar(tarea_a)
      programador.encolar(tarea_b)
      programador.encolar(tarea_c)
      programador.encolar(tarea_d)

      expect(programador.tareas.size).to eq 4
    end
  end

  describe 'con multiples tareas al procesar' do
    it 'deberia tener 4 tareas procesadas' do
      procesador = Procesador.new
      reloj = Reloj.new
      programador = described_class.new(procesador)

      tarea_a = Tarea.new(tiempo: 10, periodo: 30, deadline: 11, reloj: reloj, nombre: 'tarea_a')
      tarea_b = Tarea.new(tiempo: 10, periodo: 30, deadline: 21, reloj: reloj, nombre: 'tarea_b')
      tarea_c = Tarea.new(tiempo: 10, periodo: 30, deadline: 31, reloj: reloj, nombre: 'tarea_c')
      tarea_d = Tarea.new(tiempo: 10, periodo: 30, deadline: 41, reloj: reloj, nombre: 'tarea_d')

      programador.encolar(tarea_a)
      programador.encolar(tarea_b)
      programador.encolar(tarea_c)
      programador.encolar(tarea_d)

      programador.simular(41)

      expect(programador.ejecutadas).to eq 4
    end
  end

  describe 'cuando la tarea no esta lista' do
    it 'deberia ejecutar NOP si la siguiente tarea no es ejecutable' do
      procesador = Procesador.new
      reloj = Reloj.new
      programador = described_class.new(procesador)

      tarea1 = Tarea.new(tiempo: 2, periodo: 8, tiempo_inicio: 0, reloj: reloj, nombre: 'tarea1')
      tarea2 = Tarea.new(tiempo: 4, periodo: 6, tiempo_inicio: 4, reloj: reloj, nombre: 'tarea2')

      programador.encolar(tarea1)
      programador.encolar(tarea2)

      programador.simular(5)
      expect(programador.nop.ciclos_completados).to eq 2
    end
  end
end
