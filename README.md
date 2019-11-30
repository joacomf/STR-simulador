# STR-simulador [![Build Status](https://travis-ci.com/joacomf/STR-simulador.svg?branch=master)](https://travis-ci.com/joacomf/STR-simulador)

## Objetivo
Se requiere crear un simulador de tareas de tiempo real el cual prediga el comportamiento de un sistema de tiempo real según la definición de la configuración de las tareas periódicas de tiempo real del sistema.

## Alcance
- El alcance del proyecto está definido por:
- Procesador único
- Cantidad de tareas indefinida mayores a uno
- Todas las tareas son periódicas
- Configuración de las tareas:
    - Tiempo de inicio
    - Tiempo de proceso
    - Tiempo máximo de fin de proceso (deadline)
    - Prioridad
    - Periodo
    - Nombre
    - Planificadores
    - Procesamiento FIFO
    - Procesamiento por prioridad
- Obtención de resultados mediante archivo con formato JSON


## Instalación
Este trabajo práctico tiene su propia máquina virtual configurada.

### Software necesario
- Virtual box >= 5.2
- Vagrant >= 2.2.2

### Instalación de la imagen y su respectivas herramientas
En el directorio del proyecto, ejecutar:
 1. vagrant up
 2. vagrant ssh
 3. cd /vagrant && bundle install
 
### Ejecución
Cuando se necesite ejecutar los tests. Con la máquina virtual levantada:
Si no estoy dentro de la máquina virtual
 1. vagrant ssh
Dentro de la máquina virtual
 1. cd /vagrant
 2. rake
 ó
 2. ./build.sh
