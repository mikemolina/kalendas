kalendas - Calculations of Calendar and Julian Date
===================================================

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
  libintl-perl. See *DEPENDENCES* file.

INSTALLATION
------------
  1. Many UNIX/Linux distributions have installed Perl; to get your
  location, type into a console

        $ which perl
  that showed the way (path) of the executable. Similarly platforms
  Windows writing "PATH" in a console MS-DOS or symbol of system
  must also show the location of perl, e.g.: "C:\Perl\bin".

  2. If you want install program from a repository git (as *GitHub*),
  first make sure have installed *GNU Autoconf*, *GNU Automake*, 
  *GNU libiconv*, *GNU gettext*, *Texinfo* and *pod2man* (included in your
  distribution Perl); in some distros UNIX/Linux some build
  dependencies are installed by default. For build and install the
  package in UNIX/Linux platforms and like environments as MSYS for
  Windows operating environment (Woe), run the commands

        $ git clone https://github.com/mikemolina/kalendas.git
        $ cd kalendas
        $ ./autogen.sh
        $ ./configure --prefix=/path/to/install
        $ make
        $ make install
  If you have installed the libintl library (included in *GNU gettext*)
  in a path different to default path add the option

        --with-libintl-prefix=/path/to/libintl
  in the configure script.
  In platforms Woe, later build the installation also can be achieved
  using *GNU Make* (included in the *Strawberry Perl* distribution).
  Edit woe/Makefile.mgw file for to modify the path installation by
  default and in the symbol's system write

        > copy woe/Makefile.mgw .
        > make -f Makefile.mgw

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
  the idioms included in the package. In UNIX/Linux platforms and
  Woe/MSYS write

        $ env LANGUAGE=es kalendas

  or in the symbol's system

        > set LANG=es
        > kalendas

  For more detailed information of functions and instructions, see 

        ./doc/kalendas.htm

  generated later build the package.

VERSION
-------
  **kalendas**, version 1.0.0, $Date: 2014/07/26 09:55:22 $

LICENSE
-------
  This program is free software and is distributed under the terms of
  the *GNU General Public License (GNU GPL)*, which is included in this
  distribution in the file COPYING. For Hispanic public, in order to
  understand the license, the LICENCIA file contains a not-official
  translation the GNU General Public License (GNU GPL) in Spanish.


If you find this software useful, please send
your comments and suggestions to the author:
Miguel Molina, e-mail: <mmolina.unphysics@gmail.com>

Good Luck!

A translation in Spanish of this README is in LEAME file.
