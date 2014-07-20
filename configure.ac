# -*- Autoconf -*-
#
# configure.ac - kalendas 1.0.0
# Copyright (C) 2013

#-------
# Inicio
#-------
AC_PREREQ([2.67])
AC_INIT([kalendas], [1.0.0], [mmolina.unphysics@gmail.com])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])
AC_PREFIX_DEFAULT($HOME/kalendas)
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([-Wall])
AC_MSG_CHECKING([target operating system])
case "$target_os" in
   linux* )
      AC_SUBST([TARGET_OS], [linux-gnu])
      AC_MSG_RESULT([UNIX (GNU/Linux)]) ;;
   freebsd* )
      AC_SUBST([TARGET_OS], [freebsd])
      AC_MSG_RESULT([UNIX (FreeBSD)]) ;;
   darwin* )
      AC_SUBST([TARGET_OS], [darwin])
      AC_MSG_RESULT([Mac OS X (darwin)]) ;;
   mingw* )
      AC_SUBST([TARGET_OS], [mingw32])
      AC_MSG_RESULT([Woe (mingw32)]) ;;
   * )
      AC_MSG_RESULT([UNIX (unix variant?)]) ;;
esac
AM_CONDITIONAL([MINGW32], [test "$TARGET_OS" = mingw32])

# Habilitar el modo silencioso por defecto en la compilacion.
# Para modo detallado usar "make V=1". Desde el configure usar
# "--disable-silent-rules".
AM_SILENT_RULES([yes])

#----------
# Programas
#----------
AC_PROG_INSTALL
AC_PATH_PROG([SED], [sed], [no])

AC_PATH_PROG([PERL], [perl], [no])
if test "x$PERL" = "xno"
then
   AC_MSG_ERROR([*** Missing perl! Essential program not found.])
else
   AC_MSG_CHECKING([for perl version])
   changequote(<<, >>)dnl
   perlver=`perl -e 'print "$]";'`
   changequote([, ])dnl
   AC_MSG_RESULT([$perlver])
   $PERL -e 'require 5.006001;' > /dev/null 2>&1
   if test $? -ne 0
   then
      AC_MSG_ERROR([*** Program perl is too old, v5.6.1 or newer required.])
   fi
fi

AC_PATH_PROG([POD2MAN], [pod2man], [no])
if test "x$POD2MAN" = "xno"
then
   AC_MSG_WARN([*** Missing program pod2man. Man documentation will not])
   AC_MSG_WARN([*** be rebuilt. Install :pod2man: for rebuild man page.])
fi

AC_PATH_PROG([MAKEINFO], [makeinfo], [no])
if test "x$MAKEINFO" = "xno"
then
   AC_MSG_WARN([*** Missing program makeinfo. Info documentation will not be rebuilt.])
else
   AC_MSG_CHECKING([for makeinfo version])
   changequote(<<, >>)dnl
   makeinfover=`$MAKEINFO --version 2>&1 | grep 'GNU texinfo' | sed -e 's/[^0-9\.]*//g'`
   mayorver=`echo $makeinfover | cut -d. -f1`
   changequote([, ])dnl
   AC_MSG_RESULT([$makeinfover])
   if test $mayorver -lt 4
   then
      AC_MSG_WARN([*** Program makeinfo is too old, 4.0 or newer required.])
      AC_MSG_WARN([*** Info documentation possibly will not be rebuilt.])
   fi
fi

# Variable para evitar revision de modulos
AC_ARG_ENABLE(pkgonly,[AC_HELP_STRING([--enable-pkgonly],[Skip all checking])])
AC_SUBST(enable_pkgonly)

# Revision modulos de Perl
if test "$enable_pkgonly" != yes
then
   for module in 'POSIX' 'Getopt::Long'
   do
      AC_MSG_CHECKING([for perl module '$module'])
      if ${PERL} -e 'use '$module 2>/dev/null
      then
         AC_MSG_RESULT([Ok])
      else
         AC_MSG_ERROR([Failed]);
      fi
   done
fi

#--------------------------------
# Codificacion de SO (info y man)
#--------------------------------
AC_SUBST([OSENCODING],[UTF-8])
if test "$TARGET_OS" = mingw32
then
   AC_SUBST([OSENCODING],[ISO-8859-1])
fi
AM_SUBST_NOTMAKE(OSENCODING)
AM_CONDITIONAL([MANENCODING], [test $OSENCODING = UTF-8])

#------------
# i18n - l10n
#------------
AM_GNU_GETTEXT_VERSION([0.18])
AM_GNU_GETTEXT([external])

# Revision de modulo Locale::TextDomain para traducciones
if test "x${USE_NLS}" = "xyes"
then
   if test "$enable_pkgonly" != yes
   then
      for module in 'Locale::TextDomain'
      do
         AC_MSG_CHECKING([for perl module '$module'])
         if ${PERL} -e 'use '$module 2>/dev/null
         then
            AC_MSG_RESULT([Ok])
         else
            AC_MSG_ERROR([Failed.
*** This package requires 'libintl-perl' for native language support.
*** Please install this package from your Distro, or reconfigure with
*** the option '--disable-nls' for disable native language support.
*** The perlscript will show messages in language spanish.
	    ]);
         fi
      done
   fi
fi
AM_CONDITIONAL([NONLS], [test x${USE_NLS} = xno])

#-----------------
# Generar archivos
#-----------------
AC_CONFIG_FILES([Makefile bin/Makefile man/Makefile po/Makefile.in])
AC_CONFIG_FILES([doc/Makefile doc/encoding.texi])
AC_CONFIG_FILES([woe/Makefile])
AC_CONFIG_FILES([extra/substvars.sh],[chmod +x extra/substvars.sh])
AC_SUBST(VERSION)
AC_SUBST([PESOS_SIGN],[$])
AC_OUTPUT
