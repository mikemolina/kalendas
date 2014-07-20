#! /bin/sh
#
# autogen.sh - Shellscript para ejecutar Autotools

BUILDDIR=$(dirname $0)
abs_BUILDDIR=$(pwd)
CONFIG_AC_FILE="$BUILDDIR/configure.ac"

# Estamos construyendo en Linux?
so=`uname -o 2>/dev/null | tr [:upper:] [:lower:]`
# Ruta prefix a libintl | Path prefix to libintl
dirlibintl=
case $so in
   *linux) addopt='';;
   *) if [ "x$dirlibintl" = "x" ]; then
         echo "Please! Write the prefix path for libintl in the"
         echo "variable dirlibintl (line 12) in autogen.sh"
         exit 1
      else
         addopt="--with-libintl-prefix=$dirlibintl"
      fi ;;
esac

# Funcion de terminacion para shell y subshell
fin() {
    (exit $1)
    exit $1
}

# Funcion para actualizar fecha en archivos po
poupdate() {
    tup=`cat $1 | grep 'PO-Revision-Date:' | sed -e s/\"//g | sed -e 's/.*: \(.*\)[\]n/\1/'`
    rm $1
    cp ../$1 tmp
    tpot=`cat tmp | grep 'POT-Creation-Date:' | sed -e s/\"//g | sed -e 's/.*: \(.*\)[\]n/\1/'`
    tpo=`cat tmp | grep 'PO-Revision-Date:' | sed -e s/\"//g | sed -e s'/.*: \(.*\)[\]n/\1/'`
    sed -e "s/${tpo}/${tup}/g" -e "s/${tpot}/${tup}/g" tmp > $1
    rm tmp
}

# Directorio para correr autotools
if [ ! -f "$CONFIG_AC_FILE" ]; then
  echo "Are you sure $BUILDDIR is a valid source directory?"
  fin 1
fi

# Ejecutar Autotools
if [ -d po ]; then
   echo "First run: ./autoclean.sh"
   fin 1
fi
echo "running autoreconf..."
autoreconf -i

# Crer archivos gettext
echo "Creating file Makevars"
sed -e 's/^COPYRIGHT_HOLDER.*/COPYRIGHT_HOLDER = Miguel Molina/' \
    -e 's/^MSGID_BUGS_ADDRESS.*/MSGID_BUGS_ADDRESS = $(PACKAGE BUGREPORT)/' \
    po/Makevars.template > po/Makevars
# Parche para Makevars
cat > patch.t <<"EOF"
--- po/Makevars	2013-09-01 17:22:06.000000000 -0500
+++ Makevars.ori	2013-09-01 14:20:41.000000000 -0500
@@ -8,7 +8,17 @@
 top_builddir = ..
 
 # These options get passed to xgettext.
-XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
+XGETTEXT_OPTIONS = --language=Perl \
+  -k_ --flag=_:1:pass-perl-format --flag=_:1:pass-perl-brace-format \
+  -k__ --flag=__:1:pass-perl-format --flag=__:1:pass-perl-brace-format \
+  -k'$$__' --flag='$$__:1:pass-perl-format' --flag='$$__:1:pass-perl-brace-format' \
+  -k'%__' --flag=%__:1:pass-perl-format --flag=%__:1:pass-perl-brace-format \
+  -k__x --flag=__x:1:perl-brace-format \
+  -k__n:1,2 --flag=__n:1:pass-perl-format --flag=__n:1:pass-perl-brace-format \
+            --flag=__n:2:pass-perl-format --flag=__n:2:pass-perl-brace-format \
+  -k__nx:1,2 --flag=__nx:1:perl-brace-format --flag=__nx:2:perl-brace-format \
+  -k__xn:1,2 --flag=__xn:1:perl-brace-format --flag=__xn:2:perl-brace-format \
+  -kN__ --flag=N__:1:pass-perl-format --flag=N__:1:pass-perl-brace-format
 
 # This is the copyright holder that gets inserted into the header of the
 # $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
EOF
patch ./po/Makevars < patch.t
rm patch.t
echo "Creating initial po/POTFILES.in"
echo "# List of source files which contain translatable strings" > po/POTFILES.in
echo "bin/kalendas.in" >> po/POTFILES.in

# Pre-construccion
./configure --prefix=`pwd`/tmp $addopt
make

# i18n - l10n
echo "Creating po-files..."
langlist="es pt_BR"
cd po/
for lang in $langlist
do
   file="../$lang.po"
   if [ -f "$file" ]
   then
      msginit --no-translator -l $lang
      poupdate $lang.po
      msgfmt --statistics --check $lang.po
      echo $lang >> LINGUAS
   else
      echo "No such: $file"
      fin 1
   fi
done
cd ../

# Construccion del paquete
make maintainer-clean
./configure --prefix=`pwd`/tmp $addopt
make dist
rm *.po

echo "autogen OK!"

fin 0