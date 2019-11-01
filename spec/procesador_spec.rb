require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }

  it 'deberia crearse sin tareas' do
    expect(procesador.cantidad_tareas).to eq 0
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    tarea = Tarea.new(10)
    procesador.tarea(tarea)

    expect(procesador.cantidad_tareas).to eq 1
  end
end
