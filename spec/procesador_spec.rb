require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  let(:procesador) { described_class.new }
  let(:tarea) { Tarea.new(0, 10, 30, 5, 20) }

  it 'deberia crearse sin tareas' do
    expect(procesador.cantidad_tareas).to eq 0
  end

  it 'deberia tener 1 tarea registrada al asignarle 1 tarea' do
    procesador.tarea(tarea)

    expect(procesador.cantidad_tareas).to eq 1
  end

  it 'deberia tener 2 tareas registradas al asignarle 2 tareas' do
    procesador.tarea(tarea)
    procesador.tarea(tarea)

    expect(procesador.cantidad_tareas).to eq 2
  end
end
