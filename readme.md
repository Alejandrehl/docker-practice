# Docker

Es una herramienta que permite desplegar aplicaciones en contenedores, de forma rápida y portable.

$ docker run -d -p 80:80 —name web httpd (Levantar un Apache)
$ docker rm -fv web (Destruir el Apache)
\$ docker run -d -81:80 —name web2 nginx (Levantar un server con nginx como plantilla)

- Web y Web2 son los nombres del server, se puede poner lo que quieras.

## Arquitectura de Docker

Docker Host:

- Docker Daemon - Server
- Rest API
- Docker CLI - Client: Nos permite manejar contenedores, imágenes, volúmenes y redes.

## Qué es una imagen?

Las imágenes viven dentro del Docker Host, es una paquete que contiene toda la configuración necesaria para que funcione el servicio.
Capa 1: FROM, el from significa que sistema operativo voy a utilizar.
Capa 2: RUN
Capa 3: CMD, lo que definamos en el CMD es lo que va a levantar el servicio

- Dentro del Dockerfile se definen las capas, es un archivo de texto plano.
  Ejemplo:
  FROM centos:7
  RUN yum -y install httpd
  CMD [“apachectl”, “”-DFOREGROUND”] //Esta linea inicia el servicio de apache que instalamos en la linea anterior

- Las imágenes son un paquete de cosas que tienen todo lo necesario para correr la aplicación, cada cosa que esta dentro de ella se define utilizando capas.

## Qué es un contenedor?

Capa 4: Ejecución, Todos los cambios que hagamos en la capa 4 serán temporales, es una capa temporal. No es bueno, nunca, jamas en la vida meter mano a la capa 4 porque es temporal y si por alguna razón eliminamos la capa 4 toda la configuración que hemos hecho ahi se eliminara. Toda la configuración permanente va en las imágenes.

- Contenedor: Imagen, volumenes y redes.

## Una imagen es un paquete con las configuraciones y un contenedor es una capa adicional de ejecución e inicia todo lo que esta definido en las imágenes.

## Contenedores vs VMS

Contenedor: HDD, RAM, CPU. Es una instancia en la ejecución de una imagen. Es un proceso más del sistema, utiliza la misma ram del sistema, el mismo disco curo y la misma CPU.
VM: Es una maquina dentro de nuestra máquina, es ultra pesado.

## Contenedores vs VMS

1. docker pull name
2. docker pull name:version
3. docker images
4. docker images || grep name
5. docker build --tag apache-centos . // apache-centos es el campo (name) que se debe reemplazar
6. docker history -H apache-centos
