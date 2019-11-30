require 'rspec'
require_relative '../model/logger'

describe Logger do
  let(:logger) { described.class }

  it 'debería imprimir ejecucion de tarea ' do
    expect { described_class.ejecucion(3, 3, 5, 1) }.to output("Tiempo 3. Ejecución de 3 de tarea #1. Total 5\n").to_stdout
  end

  it 'debería imprimir excepcion ' do
    expect { described_class.nop(4) }.to output("Tiempo 4. Nop ejecutado\n").to_stdout
  end

  it 'debería imprimir excepcion' do
    expect { described_class.excepcion('Excepcion lanzada') }.to output("Excepcion lanzada\n").to_stdout
  end
end
