#! /bin/sh
#
# autoclean.sh - Shellscript para limpiar los archivos 'autogenerados'.

test ! -f Makefile || make maintainer-clean

# Generados por autoconf
rm -fR autom4te.cache
rm -fR build-aux
rm -fR m4
if [ -d po ]; then
   cp -f po/*.po .
fi
rm -fR po
rm -f configure

# Generados por aclocal
rm -f aclocal.m4

# Generados por automake
rm -f Makefile.in
rm -f bin/Makefile.in
rm -f man/Makefile.in
rm -f doc/Makefile.in
rm -f woe/Makefile.in
rm -f ABOUT-NLS

# Generados por make
rm -f DIST_REVISION
rm -f doc/*.htm doc/*.info doc/version.texi doc/stamp-vti
rm -f man/*.1

echo "Remove OK!"
