require 'rspec'
require_relative '../model/planificador'
require_relative '../model/procesador'
require_relative '../model/nop'
require_relative '../model/reloj'

describe Planificador do
  let(:procesador) { Procesador.new }
  let(:tarea) { Tarea.new(tiempo: 10, periodo: 30, deadline: 20) }

  it 'deberia crearse con un procesador' do
    planificador = described_class.new(procesador: procesador)
    expect(planificador.procesador).to eq procesador
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    planificador = described_class.new(procesador: procesador)

    planificador.encolar(tarea)

    expect(planificador.tareas.size).to eq 1
  end

  it 'deberia simular 4 iteraciones' do
    planificador = described_class.new(procesador: procesador)
    expect(planificador).to receive(:procesar).exactly(4).times.and_call_original

    planificador.encolar(tarea)

    planificador.simular(4)
  end
end
