require 'rspec'
require_relative '../model/tarea'

describe Tarea do
  subject(:tarea) { described_class.new(0, 10, 30, 5, 20) }

  it 'deberia crearse recibiendo inicio' do
    expect(tarea.inicio).to eq(0)
  end

  it 'deberia crearse recibiendo tiempo' do
    expect(tarea.tiempo).to eq(10)
  end

  it 'deberia crearse recibiendo periodo' do
    expect(tarea.periodo).to eq(30)
  end

  it 'deberia crearse recibiendo prioridad' do
    expect(tarea.prioridad).to eq(5)
  end

  it 'deberia crearse recibiendo deadline' do
    expect(tarea.deadline).to eq(20)
  end

  it 'deberia lanzar excepcion si deadline es menor que tiempo' do
    expect { tarea_deadline_menor_que_tiempo.new(0, 10, 30, 5, 2) }.to raise_exception StandardError
  end
end
