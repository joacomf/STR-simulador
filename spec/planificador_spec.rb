require 'rspec'
require_relative '../model/planificador'
require_relative '../model/procesador'
require_relative '../model/nop'
require_relative '../model/reloj'

describe Planificador do
  it 'deberia crearse con un procesador' do
    procesador = Procesador.new
    planificador = described_class.new(procesador)
    expect(planificador.procesador).to eq procesador
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador = Procesador.new
    reloj = Reloj.new
    tarea = Tarea.new(tiempo: 10, periodo: 30, deadline: 20, reloj: reloj)

    planificador = described_class.new(procesador)

    planificador.encolar(tarea)

    expect(planificador.tareas.size).to eq 1
  end
end
