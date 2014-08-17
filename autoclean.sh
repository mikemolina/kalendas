#! /bin/sh
#
# autoclean.sh - Shellscript para limpiar los archivos 'autogenerados'.

# Funcion para mantener fecha de ultima actualizacion de archivos po
podowndate() {
    cp $1 tmp
    rm $1
    # Fecha ultima actualizacion archivos po
    tdown='2014-07-19 21:22-0500'
    tpo=`cat tmp | grep 'PO-Revision-Date:' | sed -e s/\"//g | sed -e s'/.*: \(.*\)[\]n/\1/'`
    sed -e "s/${tpo}/${tdown}/g" tmp > $1
    rm tmp
}

# Funcion para verificar codificacion UTF-8 en *.po
verifypoenc() {
   if ! grep 'charset=UTF-8' $1 1>/dev/null
   then
      msgconv -t UTF-8 -o $1.t $1
      rm $1
      mv $1.t $1
   fi
}

test ! -f Makefile || make maintainer-clean

# Generados por autoconf
rm -fR autom4te.cache
rm -fR build-aux
rm -fR m4
if [ -d po ]; then
   cp -f po/*.pot .
   cp -f po/*.po .
   for lang in `ls *.po`
   do
      verifypoenc $lang
      podowndate $lang
   done
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
