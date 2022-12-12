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

![Modelo UML](/home/matias/Descargas/modelo.png)











