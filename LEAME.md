kalendas - Cálculos de calendario y Fecha Juliana
=================================================

![Screenshot](https://github.com/mikemolina/kalendas/wiki/images/01_gterm.png)

#### Tabla de Contenido
* [DESCRIPCIÓN](#description)
* [REQUISITOS](#require)
* [¡NUEVO!](#news)
* [INSTALACIÓN](#install)
  1. [Ubuntu](#debian)
  2. [Fedora and CentOS](#rhel)
  3. [Mac OS X](#mac)
  4. [Windows](#win)
  5. [Genérica](#unix)
  6. [Sin permiso root](#noroot)
  7. [Desarrollo](#dev)
* [USANDO KALENDAS](#use)
* [VERSIÓN](#version)
* [LICENCIA](#license)

<a name="description"/>
DESCRIPCIÓN
-----------
**kalendas** es un perl script para realizar cálculos de calendario.
Los cómputos están desarrollados sobre tres sistemas de datación:
el calendario Juliano, el calendario Gregoriano y el sistema de
numeración de día/fecha Juliana.

<a name="require"/>
REQUISITOS
----------
**kalendas** requiere perl 5 o posterior. Para el soporte en lenguaje
nativo se recomienda el módulo Locale::TextDomain incluido en el
paquete libintl-perl. Ver el archivo *DEPENDENCIES*.

<a name="news"/>
¡NUEVO!
-------
* Cálculo de la fecha Juliana modificada desde una fecha del calendario
Occidental.
* Conversión desde fecha Juliana modificada hacia fecha del calendario
Occidental para cualquier era (a.C. o A.D.).
* Documentación acerca de la fecha Juliana modificada.

<a name="install"/>
INSTALACIÓN
-----------
Muchas distribuciones UNIX/Linux o Mac OS X tienen instalado Perl;
para obtener su ubicación, escribir en una terminal

        $ which perl
que mostrara la ruta del ejecutable. Similarmente en entornos
operativos Windows (Woe), escribir en el símbolo de sistema

        > perl -v
el cual mostrara que perl está instalado.

<a name="debian"/>
1. La instalación de **kalendas** en Ubuntu es fácil y rápida. En una
terminal escribir

        $ sudo add-apt-repository ppa:mymolina/kalendas-pkg
        $ sudo apt-get update
        $ sudo apt-get install kalendas
Para distribuciones Linux basadas en Debian visite el [PPA](https://launchpad.net/~mymolina/+archive/ubuntu/kalendas-pkg).

<a name="rhel"/>
2. Instalación en Fedora y CentOS toma unos pocos segundos. Para
Fedora ejecutar en la terminal

        $ sudo yum install http://mikemolina.github.com/kalendas-rpm/kalendas-fedora-release-1.0-1.noarch.rpm
        $ sudo yum install kalendas
y en CentOS

        $ sudo yum install http://mikemolina.github.com/kalendas-rpm/kalendas-centos-release-1.0-1.noarch.rpm
        $ sudo yum install kalendas
Más info en el [repositorio](http://mikemolina.github.io/kalendas-rpm/).

<a name="mac"/>
3. Sobre Mac OS X, agregar el repositorio tap en su instalación *Homebrew*

        $ brew tap mikemolina/kalendas
Ahora puede instalar **kalendas** simplemente con

        $ brew install kalendas
Seguir los mismos pasos para instalar kalendas sobre *Linuxbrew*. Para más información visitar el
[wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-on-homebrew).

<a name="win"/>
4. En entornos Woe la instalación puede lograrse desde
el símbolo de sistema usando GNU Make (incluida en la distribución
[Strawberry Perl](http://strawberryperl.com)). Editar el archivo
woe/Makefile.mgw para modificar la ruta de instalación por defecto
y ejecutar

        > cd kalendas-1.1.0
        > copy woe/Makefile.mgw .
        > gmake -f Makefile.mgw

<a name="unix"/>
5. Usted también puede instalar **kalendas** desde el código fuente de
la versión estable disponible en [Launchpad](https://launchpad.net/kalendas),
cuyo paquete puede descargarse [aquí](https://launchpad.net/kalendas/trunk/1.1.0/+download/kalendas-1.1.0.tar.gz).
En plataformas UNIX (Linux, Mac OS X, incluso Woe/MSYS y similares),
extraer e instalar el paquete en la forma usual

        $ tar -xvzf kalendas-1.1.0.tar.gz
        $ cd kalendas-1.1.0
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

<a name="noroot"/>
6. Si no tiene permisos de root para instalar las dependencias, aún
puede instalar **kalendas** de forma local. Siga los pasos del numeral
3 ejecutando el script configure asi

        $ ./configure --disable-nls
el perlscript estara instalado en ~/kalendas/bin mostrando los mensajes
en español.

<a name="dev"/>
7. Si usted quiere instalar kalendas desde el repositorio git
en *GitHub*, primero asegúrese de tener instalado *GNU Autoconf*,
*GNU Automake*, *GNU libiconv*, *GNU gettext*, *Texinfo* y *pod2man* (incluido
en su distribución Perl); en algunas distribuciones UNIX algunas
dependencias de construcción están instaladas por defecto.
Para construir e instalar el paquete en plataformas UNIX ejecutar los
comandos

        $ git clone https://github.com/mikemolina/kalendas.git
        $ cd kalendas
        $ ./autogen.sh
        $ ./configure --prefix=/ruta/a/instalar
        $ make
        $ make install

<a name="use"/>
USANDO KALENDAS
---------------
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
ejecutar *info kalendas* o ver la documentación en línea [aquí](https://launchpad.net/kalendas/trunk/1.1.0/+download/kalendas-doc.pdf).

Actualmente, **kalendas** tiene soporte de traducción en los mensajes de
salida para lenguajes: inglés, español y portugués (BR). Usted puede probar
el perl script cambiando la variable de entorno LANGUAGE y/o LANG. En
plataformas UNIX escribir

        $ env LANGUAGE=es kalendas
o en el símbolo de sistema en Woe

        > set LANG=es
        > kalendas
Contribuciones para otras lenguas son Bienvenidas!

<a name="version"/>
VERSIÓN
-------
**kalendas**, versión 1.1.0, $Date: 2014/12/23 12:26:21 $

<a name="license"/>
LICENCIA
--------
Este programa es software libre y está distribuido conforme a los
términos de la *Licencia Pública General de GNU (GNU GPL)*, la cual
se encuentra incluida en esta distribución en el archivo COPYING.
Para comprender la licencia, el archivo LICENCIA contiene una
traducción no-oficial la Licencia Pública General de GNU (GNU GPL)
al español.

**Buena Suerte!**
