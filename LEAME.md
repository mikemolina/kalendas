kalendas - Cálculos de calendario y Fecha Juliana
=================================================

![Screenshot](https://github.com/mikemolina/kalendas/wiki/images/01_gterm.png)

#### Tabla de Contenido
* [DESCRIPCIÓN](#descripcion)
* [REQUISITOS](#requisitos)
* [NUEVO](#nuevo)
* [INSTALACIÓN](#instalacion)
  1. Ubuntu
  2. Fedora and CentOS
  3. Mac OS X
  4. Windows
  5. FreeBSD
  6. Genérica
  7. Sin permiso root
  8. Desarrollo
* [USANDO KALENDAS](#usando-kalendas)
* [VERSIÓN](#version)
* [LICENCIA](#licencia)

#### DESCRIPCIÓN
----------------
**kalendas** es un perl script para realizar cálculos de calendario.
Los cómputos están desarrollados sobre tres sistemas de datación:
el calendario Juliano, el calendario Gregoriano y el sistema de
numeración de día/fecha Juliana.

#### REQUISITOS
---------------
**kalendas** requiere perl 5 o posterior. Para el soporte en lenguaje
nativo se recomienda el módulo Locale::TextDomain incluido en el
paquete libintl-perl. Ver el archivo *DEPENDENCIES*.

#### NUEVO
----------
* Inclusión de pruebas para el correcto funcionamiento del perl-script
y sus opciones.

#### INSTALACIÓN
----------------
Muchas distribuciones UNIX/Linux o Mac OS X tienen instalado Perl;
para obtener su ubicación, escribir en una terminal

        $ which perl
que mostrara la ruta del ejecutable. Similarmente en entornos
operativos Windows (Woe), escribir en el símbolo de sistema

        > perl -v
el cual mostrara que perl está instalado.

1. La instalación de **kalendas** en Ubuntu es fácil y rápida. En una
terminal escribir

        $ sudo add-apt-repository ppa:mymolina/kalendas-pkg
        $ sudo apt-get update
        $ sudo apt-get install kalendas
	Para distribuciones Linux basadas en Debian visite el [PPA](https://launchpad.net/~mymolina/+archive/ubuntu/kalendas-pkg).

2. Instalación en Fedora y CentOS toma unos pocos segundos. Para
Fedora ejecutar en la terminal

        $ sudo dnf install http://mikemolina.github.com/kalendas-rpm/kalendas-fedora-release-1.0-1.noarch.rpm
        $ sudo dnf install kalendas
	y en CentOS

        $ sudo yum install http://mikemolina.github.com/kalendas-rpm/kalendas-centos-release-1.0-1.noarch.rpm
        $ sudo yum install kalendas
	Más info en el [repositorio](https://github.com/mikemolina/kalendas-rpm).

3. Sobre Mac OS X, agregar el repositorio tap en su instalación *Homebrew*

        $ brew tap mikemolina/kalendas
	Ahora puede instalar **kalendas** simplemente con

        $ brew install kalendas
	Seguir los mismos pasos para instalar kalendas sobre *Linuxbrew*. Para más información visitar el
[wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-on-homebrew).

4. En entornos Woe la instalación puede lograrse desde
el símbolo de sistema usando GNU Make (incluida en la distribución
[Strawberry Perl](http://strawberryperl.com)). Editar el archivo
woe/Makefile.mgw para modificar la ruta de instalación por defecto
y ejecutar

        > cd kalendas-1.3.1
        > copy woe/Makefile.mgw .
        > gmake -f Makefile.mgw

5. Instalación sobre FreeBSD usando el *port*. Clonar el
repositorio en la colección de ports

        # cd /usr/ports/astro
        # git clone https://github.com/mikemolina/kalendas-port.git kalendas
        # cd kalendas
        # make install clean
	Para más información visitar el [wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-port).

6. Usted también puede instalar **kalendas** desde el código fuente de
la versión estable disponible en el [sitio web](http://mikemolina.github.io/kalendas-home),
cuyo paquete puede descargarse [aquí](https://launchpad.net/kalendas/trunk/1.3.1/+download/kalendas-1.3.1.tar.gz).
En plataformas UNIX (Linux, Mac OS X, incluso Woe/MSYS y similares),
extraer e instalar el paquete en la forma usual

        $ tar -xvzf kalendas-1.3.1.tar.gz
        $ cd kalendas-1.3.1
        $ ./configure --prefix=/ruta/a/instalar
        $ make
        $ make install
	Para mejorar la codificación de carácteres en Woe/MSYS, ejecutar

        $ ./configure --enable-charset=latin1 --prefix=/ruta/a/instalar
        $ make
        $ make install
	Si la librería libintl (incluida en GNU gettext) está en una ruta
diferente a la ruta por defecto, agregar al script configure la
opción

        --with-libintl-prefix=/ruta/a/libintl

7. Si no tiene permisos de root para instalar las dependencias, aún
puede instalar **kalendas** de forma local. Siga los pasos del numeral
3 ejecutando el script configure asi

        $ ./configure --disable-nls --without-bash-completion
	el perlscript estara instalado en ~/kalendas/bin mostrando los mensajes
en español.

8. Si usted quiere instalar kalendas desde el repositorio git en *GitHub*,
primero asegúrese de tener instalado *GNU Autoconf*, *GNU Automake*,
*GNU libiconv*, *GNU gettext*, *Texinfo*, *pod2man* (incluido en su
distribución Perl) y opcionalmente *LaTeX* y *pkg-config*; en algunas
distribuciones UNIX algunas dependencias de construcción están instaladas
por defecto. Para construir e instalar el paquete en plataformas UNIX
ejecutar los comandos

        $ git clone https://github.com/mikemolina/kalendas.git
        $ cd kalendas
        $ ./autogen.sh
        $ ./configure --prefix=/ruta/a/instalar
        $ make
        $ make install

#### USANDO KALENDAS
--------------------
Después de la instalación, ejecutar el perl script

        $ cd /ruta/a/instalar/bin
        $ kalendas
o también desde el interprete perl

        $ perl kalendas
esta opción debería funcionar correctamente desde cualquier plataforma.

Ahora un ejemplo. En diversas aplicaciones astronómicas se hace
referencia a la época J2000, entendida como la fecha Juliana del 1
de Enero del 2000 A.D. a mediodía de Greenwich (12:00:00 UT). Con
kalendas, la fecha Juliana para tal instante es

        $ kalendas --calc2FJ "(AD,2000,1,1,md)"
        FJ = 2451545.00000
Un breve listado de funciones es mostrado ejecutando *kalendas -h*; puede
ampliar la información a través de la página manual con *man kalendas*.
Para información más detallada de funciones e instrucciones de **kalendas**
ejecutar *info kalendas* o ver la documentación en línea [aquí](https://launchpad.net/kalendas/trunk/1.3.1/+download/kalendas-doc.pdf).

Actualmente, **kalendas** tiene soporte de traducción en los mensajes de
salida para lenguajes: inglés, español y portugués (BR). Usted puede probar
el perl script cambiando la variable de entorno LANGUAGE y/o LANG. En
plataformas UNIX escribir

        $ env LANGUAGE=es kalendas
o en el símbolo de sistema en Woe

        > set LANG=es
        > kalendas
Contribuciones para otras lenguas son Bienvenidas!

#### VERSIÓN
------------
**kalendas**, versión 1.3.1, $Date: 2018/07/15 11:01:23 $

#### LICENCIA
-------------
Este programa es software libre y está distribuido conforme a los
términos de la *Licencia Pública General de GNU (GNU GPL)*, la cual
se encuentra incluida en esta distribución en el archivo COPYING.
Para comprender la licencia, el archivo LICENCIA contiene una
traducción no-oficial la Licencia Pública General de GNU (GNU GPL)
al español.

**Buena Suerte!**
