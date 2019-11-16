require 'rspec'
require_relative '../model/tarea'

describe Tarea do
  subject(:tarea) { described_class.new(0, 10, 5, 20) }

  it 'deberia crearse recibiendo tiempo' do
    expect(tarea.tiempo).to eq(10)
  end

  it 'deberia crearse recibiendo inicio' do
    expect(tarea.inicio).to eq(0)
  end

  it 'deberia crearse recibiendo prioridad' do
    expect(tarea.prioridad).to eq(5)
  end

  it 'deberia crearse recibiendo deadline' do
    expect(tarea.deadline).to eq(20)
  end
end
