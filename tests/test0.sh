#! /bin/sh
#
# test0.sh - Test para verificar version de Kalendas
#
# Copyright (C) 2016  Miguel Molina
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Funcion de terminacion para shell y subshell
salida(){
    (exit $1)
    exit $1
}

# Funcion para SKIP
salto(){
    echo "$@" 1>&2
    salida 77
}

# Funcion para FAIL
fallo(){
    echo "$@" 1>&2
    salida 1
}

# Verificar perl-script
KALENDAS=../bin/kalendas
test -f "$KALENDAS" || KALENDAS=
if test -z "$KALENDAS"
then
    fallo "No existe perl-script en directorio bin."
fi

# Prueba
xtatus=0
version=`perl $KALENDAS -v | grep 'kalendas' | sed -e 's/[^0-9\.]*//g'`
if test "$version" != "1.3.0"
then
    fallo "Existe una version diferente de kalendas."
fi

salida $xtatus
