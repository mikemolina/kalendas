kalendas - Calculations of Calendar and Julian Date
===================================================

![Screenshot](https://github.com/mikemolina/kalendas/wiki/images/01_gterm.png)

DESCRIPTION
-----------
  **kalendas** is a perl script to make calendar calculations. The
  computations are developed on three systems of dating: the Julian
  calendar, the Gregorian calendar and the system of numbering of
  Julian day/date.

REQUIREMENTS
------------
  **kalendas** requires perl 5 or later. For native language support is
  recommended the module Locale::TextDomain included in the package
  libintl-perl. See *DEPENDENCIES* file.

  A translation in Spanish of this README is in LEAME file.

INSTALLATION
------------
  1. Many UNIX/Linux or Mac OS X distributions have installed Perl;
  to get your location, type into a terminal

        $ which perl
  that showed the path of the executable. Similarly in Windows
  operating environment (Woe) writing in the symbol of system

        > perl -v
  will be show that perl is installed.

  2. Installation of **kalendas** in Ubuntu is easy and fast. In a
  terminal run

        $ sudo add-apt-repository ppa:mymolina/kalendas-pkg
        $ sudo apt-get update
        $ sudo apt-get install kalendas
  For distros Linux based in Debian visit the [PPA](https://launchpad.net/~mymolina/+archive/ubuntu/kalendas-pkg).

  3. You can also install **kalendas** from the source code of the stable
  version available in [Launchpad](https://launchpad.net/kalendas),
  whose package can download [here](https://launchpad.net/kalendas/trunk/1.0.1/+download/kalendas-1.0.1.tar.gz).
  In UNIX platforms (Linux, Mac OS X, including Woe/MSYS and like
  environments), extract and install the package in the usual form

        $ tar -xvzf kalendas-1.0.1.tar.gz
        $ cd kalendas-1.0.1
        $ ./configure --prefix=/path/to/install
        $ make
        $ make install
  For improve the encoding characters in Woe/MSYS, run

        $ ./configure --enable-charset=latin1 --prefix=/path/to/install
        $ make
        $ make install
  If libintl library (included in GNU gettext) is in a different
  location to path by default, add the option to the configure script

        --with-libintl-prefix=/path/to/libintl
  Optionally, in Woe platforms the installation also can be achieved
  from the command prompt using *GNU Make* (included in the
  [Strawberry Perl](http://strawberryperl.com/) distribution). Edit
  woe/Makefile.mgw file for to modify the path installation by default
  and run

        > cd kalendas-1.0.1
        > copy woe/Makefile.mgw .
        > gmake -f Makefile.mgw
  
  4. If you not have root privileges to install the dependencies, you
  can install **kalendas** locally. Follow the steps in section 3 running
  the configure script so

        $ ./configure --disable-nls
  the perlscript will be installed in ~/kalendas/bin showing messages
  in spanish.

  5. If you want install program from the repository git in *GitHub*,
  first make sure have installed *GNU Autoconf*, *GNU Automake*, 
  *GNU libiconv*, *GNU gettext*, *Texinfo* and *pod2man* (included in your
  distribution Perl); in some distros UNIX some build dependencies are
  installed by default. For build and install the package in UNIX
  environments run the commands

        $ git clone https://github.com/mikemolina/kalendas.git
        $ cd kalendas
        $ ./autogen.sh
        $ ./configure --prefix=/path/to/install
        $ make
        $ make install

USING KALENDAS
--------------
  Later of install, run the perl script

        $ cd /path/to/install/bin
        $ kalendas

  the script can also run directly from the perl interpreter 

        $ perl kalendas

  this option should work correctly from any platform.

  Now an example. In many applications of astronomy cited the J2000
  epoch, understood as Julian date of the 1 January 2000 A.D. a noon
  of Greenwich (12:00:00 TU). With kalendas, the Julian date for such
  time is

        $ kalendas --calc2FJ "(AD,2000,1,1,md)"
        FJ = 2451545.00000

  For the translation of output messages, you can test the perl script
  setting the environment variable LANGUAGE and/or LANG according to
  the idioms included in the package. In UNIX environments write

        $ env LANGUAGE=es kalendas

  or in the command prompt of Woe

        > set LANG=es
        > kalendas

  For more detailed information of functions and instructions, see the
  documentation in [https://launchpad.net/kalendas](https://launchpad.net/kalendas). 

VERSION
-------
  **kalendas**, version 1.0.1, $Date: 2014/08/17 12:00:07 $

LICENSE
-------
  This program is free software and is distributed under the terms of
  the *GNU General Public License (GNU GPL)*, which is included in this
  distribution in the file COPYING. For Hispanic public, in order to
  understand the license, the LICENCIA file contains a not-official
  translation the GNU General Public License (GNU GPL) in Spanish.

Good Luck!

