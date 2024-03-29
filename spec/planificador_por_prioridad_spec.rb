require 'rspec'
require_relative '../model/planificador_por_prioridad'
require_relative '../model/procesador'
require_relative '../model/tarea'

describe PlanificadorPorPrioridad do
  it 'debe ejecutar 3 de las 2 tareas en un ciclo' do
    procesador = Procesador.new
    planificador_por_prioridad = described_class.new(procesador)
    tarea1 = Tarea.new(tiempo_inicio: 5, tiempo: 10, periodo: 40, nombre: 'Leer', prioridad: 1)
    tarea2 = Tarea.new(tiempo_inicio: 12, tiempo: 10, periodo: 40, nombre: 'Escribir', prioridad: 2)
    tarea3 = Tarea.new(tiempo_inicio: 0, tiempo: 10, periodo: 40, nombre: 'Calcular', prioridad: 3)
    tarea4 = Tarea.new(tiempo_inicio: 18, tiempo: 10, periodo: 40, nombre: 'Expulsar', prioridad: 4)

    planificador_por_prioridad.encolar(tarea1)
    planificador_por_prioridad.encolar(tarea2)
    planificador_por_prioridad.encolar(tarea3)
    planificador_por_prioridad.encolar(tarea4)
    planificador_por_prioridad.simular(30)

    expect(tarea1.ciclos_completados).to eq 1
    expect(tarea2.ciclos_completados).to eq 1
    expect(tarea4.ciclos_completados).to eq 0
  end

  it 'debe ejecutar 1 vez las 2 tareas en un ciclo' do
    procesador = Procesador.new
    planificador_por_prioridad = described_class.new(procesador)
    tarea1 = Tarea.new(tiempo_inicio: 0, tiempo: 10, periodo: 40, nombre: 'Leer', prioridad: 2)
    tarea2 = Tarea.new(tiempo_inicio: 4, tiempo: 10, periodo: 40, nombre: 'Escribir', prioridad: 1)

    planificador_por_prioridad.encolar(tarea1)
    planificador_por_prioridad.encolar(tarea2)
    planificador_por_prioridad.simular(30)

    expect(tarea1.ciclos_completados).to eq 1
    expect(tarea2.ciclos_completados).to eq 1
  end
end
