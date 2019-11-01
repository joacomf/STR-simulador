require 'rspec'
require_relative '../model/tarea'

describe Tarea do
  it 'deberia crearse recibiendo tiempo' do
    tarea = described_class.new(10)

    expect(tarea.tiempo).to eq(10)
  end
end
