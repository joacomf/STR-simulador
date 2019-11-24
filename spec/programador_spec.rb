require 'rspec'
require_relative '../model/programador'
require_relative '../model/procesador'

describe Programador do
  let(:programador) { described_class.new(Procesador.new) }

  it 'deberia crearse con procesador' do
    expect(programador.procesadores).to eq 1
  end
end
