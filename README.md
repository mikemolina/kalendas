kalendas - Calculations of Calendar and Julian Date
===================================================

![Screenshot](https://github.com/mikemolina/kalendas/wiki/images/01_gterm.png)

#### Table of Content
* [DESCRIPTION](#description)
* [REQUIREMENTS](#require)
* [¡NEW!](#news)
* [INSTALLATION](#install)
  1. [Ubuntu](#debian)
  2. [Fedora and CentOS](#rhel)
  3. [Mac OS X](#mac)
  4. [Windows](#win)
  5. [FreeBSD/GhostBSD](#freebsd)
  6. [Generic](#unix)
  7. [No root](#noroot)
  8. [Devel](#dev)
* [USING KALENDAS](#use)
* [VERSION](#version)
* [LICENSE](#license)

<a name="description"/>
DESCRIPTION
-----------
  **kalendas** is a perl script to make calendar calculations. The
  computations are developed on three systems of dating: the Julian
  calendar, the Gregorian calendar and the system of numbering of
  Julian day/date.

  Este README se encuentra en *castellano* en el archivo LEAME o en
  el [wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-en-castellano).

<a name="require"/>
REQUIREMENTS
------------
  **kalendas** requires perl 5 or later. For native language support is
  recommended the module Locale::TextDomain included in the package
  libintl-perl. See *DEPENDENCIES* file.

<a name="news"/>
¡NEW!
-----
  * Calculation of the modified Julian date from date of the Western calendar.
  * Conversion from modified Julian date to date of the Western calendar for
    any era (a.C. or A.D.).
  * Documentation about the modified Julian date.

<a name="install"/>
INSTALLATION
------------
  Many UNIX/Linux or Mac OS X distributions have installed Perl;
  to get your location, type into a terminal

        $ which perl
  that showed the path of the executable. Similarly in Windows
  operating environment (Woe) writing in the symbol of system

        > perl -v
  will be show that perl is installed.

  <a name="debian"/>
  1. Installation of **kalendas** in Ubuntu is easy and fast. In a
  terminal run

        $ sudo add-apt-repository ppa:mymolina/kalendas-pkg
        $ sudo apt-get update
        $ sudo apt-get install kalendas
  For distros Linux based in Debian visit the [PPA](https://launchpad.net/~mymolina/+archive/ubuntu/kalendas-pkg).

  <a name="rhel"/>
  2. Installation in Fedora and CentOS takes a few seconds. For
  Fedora run in a terminal

        $ sudo yum install http://mikemolina.github.com/kalendas-rpm/kalendas-fedora-release-1.0-1.noarch.rpm
        $ sudo yum install kalendas
  and in CentOS

        $ sudo yum install http://mikemolina.github.com/kalendas-rpm/kalendas-centos-release-1.0-1.noarch.rpm
        $ sudo yum install kalendas
  More info in the [repository](http://mikemolina.github.io/kalendas-rpm/).

  <a name="mac"/>
  3. On Mac OS X, add this tap repository to your *Homebrew* installation

        $ brew tap mikemolina/kalendas
  Now you can install **kalendas** simply

        $ brew install kalendas
  Follow the same steps for install kalendas on *Linuxbrew*. More info
  in the [wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-on-homebrew).

  <a name="win"/>
  4. In Woe platforms the installation can be achieved
  from the command prompt using *GNU Make* (included in the
  [Strawberry Perl](http://strawberryperl.com/) distribution). Edit
  woe/Makefile.mgw file for to modify the path installation by default
  and run

        > cd kalendas-1.1.0
        > copy woe/Makefile.mgw .
        > gmake -f Makefile.mgw

  <a name="freebsd"/>
  5. Installation on FreeBSD/GhostBSD using the *port*. Clone the
  repository to your ports collection

        # cd /usr/ports/astro
        # git clone https://github.com/mikemolina/kalendas-port.git kalendas
        # cd kalendas
        # make install clean
  More info in the [wiki](https://github.com/mikemolina/kalendas/wiki/kalendas-port).

  <a name="unix"/>
  6. You can also install **kalendas** from the source code of the stable
  version available in [Launchpad](https://launchpad.net/kalendas),
  whose package can download [here](https://launchpad.net/kalendas/trunk/1.1.0/+download/kalendas-1.1.0.tar.gz).
  In UNIX platforms (Linux, Mac OS X, including Woe/MSYS and like
  environments), extract and install the package in the usual form

        $ tar -xvzf kalendas-1.1.0.tar.gz
        $ cd kalendas-1.1.0
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

  <a name="noroot"/>
  7. If you not have root privileges to install the dependencies, you
  can install **kalendas** locally. Follow the steps in section 3 running
  the configure script so

        $ ./configure --disable-nls
  the perlscript will be installed in ~/kalendas/bin showing messages
  in spanish.

  <a name="dev"/>
  8. If you want install program from the repository git in *GitHub*,
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

<a name="use"/>
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

  A brief functions list is shown running *kalendas -h*; can extend the
  information through man page with *man kalendas*. For more detailed
  information of functions and instructions run *info kalendas* or see
  the documentation online [here](https://launchpad.net/kalendas/trunk/1.1.0/+download/kalendas-doc.pdf).

  At present, **kalendas** have translation support of output messages
  for languages: english, spanish and portuguese (BR). You can test the
  perl script setting the environment variable LANGUAGE and/or LANG. In
  UNIX environments write

        $ env LANGUAGE=es kalendas

  or in the command prompt of Woe

        > set LANG=es
        > kalendas

  Contributions in other languages are Welcome!

<a name="version"/>
VERSION
-------
  **kalendas**, version 1.1.0, $Date: 2014/12/23 12:26:21 $

<a name="license"/>
LICENSE
-------
  This program is free software and is distributed under the terms of
  the *GNU General Public License (GNU GPL)*, which is included in this
  distribution in the file COPYING.

**Good Luck!**
