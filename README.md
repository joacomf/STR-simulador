# STR-simulador [![Build Status](https://travis-ci.com/joacomf/STR-simulador.svg?branch=master)](https://travis-ci.com/joacomf/STR-simulador)

## Tareas
1. Periodo
2. Computo
3. Deadline
4. Prioridad
5. Inicio

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
