require 'rspec'
require_relative '../model/tarea'

describe Tarea do
  it 'deberia crearse recibiendo tiempo' do
    tarea = described_class.new(0, 10)

    expect(tarea.tiempo).to eq(10)
  end

  it 'deberia crearse recibiendo inicio' do
    tarea = described_class.new(0, 10)

    expect(tarea.inicio).to eq(0)
  end
end
