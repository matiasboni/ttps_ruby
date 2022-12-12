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
## Clonar repositorio con git.
Abrir terminal y clonar repositorio.
```bash
$ git clone https://github.com/matiasboni/ttps_ruby.git
```

## Entrar al directorio donde se clono el proyecto.
```bash
  $ cd ttps_ruby
```

## Instalar Bundler y gemas utilizadas.
```bash
  $ gem install bundler
  $ bundler install
```





