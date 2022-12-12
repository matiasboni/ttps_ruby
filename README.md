# **TTPS RUBY 2022**

Aplicación desarrollada para la materia Taller de Tecnologías de Producción de Software Ruby 2022.

# **Contexto**

Un importante banco de la Argentina está buscando modernizar la forma en que gestiona los turnos
para atención presencial en sus sucursales y para eso te encomendaron un desarrollo. En la actuali‑
dad, cualquier cliente debe acercarse a la sucursal para solicitar un turno para atención y luego espe‑
rar a que se le llame. El banco quiere poder ofrecer un sistema de turnos online, para que cualquier
persona pueda solicitar un turno para ser atendido en una sucursal sin necesidad de acercarse a ésta
y tener que esperar a ser atendida.

# **Requisitos**

- ruby >= 2.7
- rails = 7.0.4
- Git.
- Bundler gem .

# **Pasos para ejecutar la aplicación**

## Instalar git
```bash
    $ apt update -qq && apt install -y git
    $ git --version
```

## Instalar ruby mediante rbenv

#### Instalación de rbenv
```bash
  $ apt update -qq
  $ apt install -y git \
        build-essential \
        autoconf \
        bison \
        curl \
        lib{ssl,yaml,sqlite3}-dev \
        libreadline{8,-dev} \
        zlib1g{,-dev}


  $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  $ cd ~/.rbenv
  $ src/configure && make -C src
  $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  $ exec $SHELL -l
```
#### Instalación de ruby‑build
```bash
  $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins /ruby-build
```
#### Finalizando instalación Ruby
```bash
  $ rbenv install -l
  $ rbenv install 2.7.6
  $ rbenv versions
  $ rbenv global 2.7.6
```
#### Clonar repositorio con git.
Abrir terminal y clonar repositorio.
```bash
$ git clone https://github.com/matiasboni/ttps_ruby.git
```

#### Entrar al directorio donde se clono el proyecto.
```bash
  $ cd ttps_ruby
```

#### Instalar Bundler y gemas utilizadas.
```bash
  $ gem install bundler
  $ bundler install
```

#### Cargar datos de prueba
```bash
  $ rails db:setup
```

#### Iniciar la aplicación
```bash
  $ rails s
```

# Gemas adicionales utilizadas.
- Bootstrap: utilizada para dar estilos.
- Devise: utilizada para autenticación y autorización de usuarios.
- Will_paginate: utilizada para la paginación de listados.

# Datos de prueba

## Sucursales
- Sucursal1
- Sucursal2
- Sucursal3
- Sucursal4
- Sucursal5
- Sucursal6
- Sucursal7
- Sucursal8

Los horarios de atención de las sucursales impares son:
- Lunes de 13:00 a 17:00 .
- Martes de 14:00 a 17:00 .
- Miércoles de 17:00 a 22:00 .
- Viernes de 13:00 a 17:00 .

Los horarios de atención de las sucursales pares son:
- Lunes de 16:00 a 20:00 .
- Martes de 10:00 a 16:00 .
- Jueves de 10:00 a 16:00 .
- Viernes de 08:00 a 14:00 .

## Usuarios

#### Administrador
- admin@gmail.com

#### Personal Bancario
- personal@gmail.com , personal1@gmail.com y personal2@gmail.com asignados a la Sucursal1.
- personal3@gmail.com y personal4@gmail.com asignados a la Sucursal2.
- personal5@gmail.com y personal6@gmail.com asignados a la Sucursal3.
- personal7@gmail.com y personal8@gmail.com asignados a la Sucursal4.
- personal9@gmail.com y personal10@gmail.com asignados a la Sucursal5.

#### Clientes
- usuario@gmail.com
- usuario1@gmail.com
- usuario2@gmail.com
- usuario3@gmail.com
- usuario4@gmail.com

**Las contraseñas de todos los usuarios es 123456.**

#### Turnos
- Dos turnos pendientes de la Sucursal1 solicitados por el cliente usuario@gmail.com.
- Un turno pendiente de la Sucursal2 solicitado por el cliente usuario@gmail.com.
- Un turno pendiente de la Sucursal2 solicitado por el cliente usuario1@gmail.com.
- Un turno atendido de la Sucursal2 solicitado por el cliente usuario1@gmail.com y atendido por personal3@gmail.com.

# Decisiones de diseño importantes .

## Modelo

![Modelo UML](https://raw.githubusercontent.com/matiasboni/ttps_ruby/main/app/assets/images/modelo.png)

## Sucursales
       Las sucursales tienen los atributos name,phone_number y address,todos requeridos.Además tienen 
    como mínimo un horario de atención,es decir, al momento de crearla si o sí va a tener horarios de atención.
       Otra consideración es que una sucursal no puede ser eliminada si tiene turnos pendientes o 
    atendidos ; o si tiene personal bancario asignado.Ej: las sucursales cargadas de la 1 a la 5 no pueden ser eliminadas.De la 5 a la 8 si pueden ser eliminadas.

## Usuarios
       Los usuarios tienen los atributos email,password y role,todos requeridos.El rol 0 es el admin,el
    rol 1 es el personal bancario y el rol 2 el cliente.Cuando se registra un nuevo usuario mediante el registrar público se le asigna automáticamente el rol de cliente.
       Otra consideración es que un usuario con el rol personal bancario no puede eliminarse si tiene 
    turnos atendidos.Ej:personal3@gmail.com no puede eliminarse,todo el resto del personal sí.
       Por otro lado un cliente no puede eliminarse si tiene turnos pendientes o
    atendidos.Ej:usuario@gmail.com y usuario1@gmail.com no pueden eliminarse,los demás si.
       El usuario con rol administrador en la acción de editar otros usuarios solo puede editar el rol 
    y la sucursal en el caso que se trate de un personal bancario.Por otro lado todos los usuarios pueden modificar su email y su contraseña.

## Turnos
       Los turnos tienen los atributos que se observan en el diagrama.El cliente solo puede solicitar
    turnos en las bandas horarias de las sucursales.Además como los turnos son de 15 minutos,el último horario que se puede solicitar es 15 minutos antes de la finalización del horario de atención.Ej: si una sucursal cierra a las 17,el cliente solo puede solicitar turnos hasta las 16:45 .
       El personal bancario solo puede atender los turnos del día y en el horario de atención de dicho
    día de la sucursal.Ej:el personal4@gmail.com podrá atender el turno del jueves 15 de diciembre 11:30 en cualquier momento entre las 10:00 y las 16:00 ya que es el horario de los jueves de la Sucursal2.
       Los turnos por parte del usuario no pueden ser editados si la hora y fecha del turno ya pasó.

## Horarios de atención
       La hora de apertura de los horarios de atención debe ser menor a la hora de cierre de la 
    sucursal.Todas las sucursales tienen asignado como mínimo un horario de atención.











