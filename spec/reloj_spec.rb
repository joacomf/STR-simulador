require 'rspec'
require_relative '../model/reloj'

describe Reloj do
  let(:reloj) { described_class.new }

  it 'deberia crearse con tiempo en 0 si no es especificado' do
    expect(reloj.tiempo).to eq 0
  end

  it 'deberia crearse con tiempo definido si es especificado' do
    reloj = described_class.new(15)
    expect(reloj.tiempo).to eq 15
  end
end
