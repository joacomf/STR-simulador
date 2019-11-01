require 'rspec'
require_relative '../model/procesador'

describe Procesador do
  it 'deberia crearse sin tareas' do
    procesador = described_class.new

    expect(procesador.tareas).to eq 0
  end
end
