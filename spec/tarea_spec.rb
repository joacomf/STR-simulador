require 'rspec'
require_relative '../model/tarea'
require_relative '../model/reloj'

describe Tarea do
  # Tarea(tiempo, periodo, prioridad, deadline)
  subject(:tarea) { described_class.new(tiempo: 5, periodo: 30, deadline: 20, reloj: reloj) }

  let(:reloj) { Reloj.new }

  it 'deberia crearse recibiendo tiempo' do
    expect(tarea.tiempo).to eq(5)
  end

  it 'deberia tener tiempo de inicio 0 al no recibirlo' do
    tarea = described_class.new(tiempo: 5, periodo: 5, reloj: reloj)
    expect(tarea.tiempo_inicio).to eq 0
  end

  it 'deberia crearse recibiendo periodo' do
    expect(tarea.periodo).to eq(30)
  end

  it 'deberia lanzar excepcion si periodo es menor que tiempo' do
    expect { described_class.new(tiempo: 30, periodo: 10, deadline: 40, reloj: reloj) }.to raise_exception TareaInitializeError
  end

  it 'deberia crearse con prioridad 1' do
    expect(tarea.prioridad).to eq(1)
  end

  it 'deberia crearse recibiendo deadline' do
    expect(tarea.deadline).to eq(20)
  end

  it 'deberia crearse recibiendo reloj' do
    expect(tarea.reloj.tiempo).to eq(0)
  end

  it 'deberia lanzar excepcion si deadline es menor que tiempo' do
    expect { described_class.new(tiempo: 10, periodo: 30, deadline: 2, reloj: reloj) }.to raise_exception TareaInitializeError
  end

  it 'deberia tener registrada la cantidad de ciclos completados' do
    tarea = described_class.new(tiempo: 1, periodo: 1, reloj: reloj)

    2.times { tarea.ejecutar }

    expect(tarea.ciclos_completados).to eq 2
  end

  describe 'al ejecutar' do
    it 'deberia tener 4 pendiente de 5 tiempos al ejecutar 1 vez' do
      tarea.ejecutar

      expect(tarea.pendiente).to eq 4
      expect(tarea.tiempo).to eq 5
    end

    it 'deberia tener 2 pendiente de 5 tiempos al ejecutar 3 veces' do
      3.times { tarea.ejecutar }

      expect(tarea.pendiente).to eq 2
      expect(tarea.tiempo).to eq 5
    end

    it 'deberia esperar una excepcion si se ejecuta una tarea que llego al deadline' do
      tarea.reloj = Reloj.new(20)
      expect { tarea.ejecutar }.to raise_exception TareaEjecucionError
    end

    it 'deberia esperar una excepcion si se ejecuta una tarea terminada' do
      tarea.pendiente = 0
      expect { tarea.ejecutar }.to raise_exception TareaEjecucionError
    end

    describe 'al finalizar de ejecutarse' do
      let(:tarea) { described_class.new(tiempo: 3, periodo: 3, reloj: reloj) }

      before(:each) do
        3.times { tarea.ejecutar }
      end

      it 'deberia reiniciarse actualizando los valores de inicio' do
        expect(tarea.tiempo_inicio).to eq 3
        expect(tarea.pendiente).to eq 3
      end
    end

    describe 'al ser ejecutable' do
      it 'debería ser verdadero cuando se llama a es_ejecutable' do
        reloj = Reloj.new
        3.times { reloj.incrementar }

        tarea = described_class.new(tiempo_inicio: 3, tiempo: 3, periodo: 5, reloj: reloj)

        expect(tarea.es_ejecutable?).to be true
      end
    end

    describe 'al no ser ejecutable' do
      it 'debería ser falso cuando se llama a es_ejecutable' do
        reloj = Reloj.new
        3.times { reloj.incrementar }

        tarea = described_class.new(tiempo_inicio: 5, tiempo: 3, periodo: 5, reloj: reloj)

        expect(tarea.es_ejecutable?).to be false
      end
    end
  end
end
