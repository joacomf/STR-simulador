require 'rspec'
require_relative '../model/reloj'

describe Reloj do
  let(:reloj) { described_class.new }

  it 'deberia crearse con tiempo en 0' do
    expect(reloj.tiempo).to eq 0
  end
end
