# -*- Autoconf -*-
#
# pkg-checkvar.m4 - Implementacion de macro PKG_CHECK_VAR
#
# Copyright (C) 2015 Miguel Molina
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
#
# AVISO IMPORTANTE: Esta traduccion tiene caracter meramente informativo
# y carece de validez legal.
#
# Este programa es software libre: usted puede redistribuirlo y/o modificarlo
# conforme a los terminos de la Licencia Publica General de GNU publicada por
# la Free Software Foundation, ya sea la version 3 de la Licencia, o (en su
# opcion) cualquier version posterior.
#
# Este programa se distribuye con el deseo de que le resulte util, pero SIN
# GARANTIAS DE NINGUN TIPO; ni siquiera con las garantias implicitas de
# COMERCIABILIDAD o APTITUD PARA UN PROPOSITO DETERMINADO. Para mas informacion,
# consulte la Licencia Publica General de GNU.
#
# Usted debe haber recibido una copia de la Licencia Publica General de GNU
# junto con este programa. Si no, ver <http://www.gnu.org/licenses/>.
#
#
# ::Nota
# La macro PKG_CHECK_VAR para lectura de variables en archivos *.pc es una
# nueva implementacion de pkg-config lanzada en la version 0.28. Esta macro
# es una imitacion para ejecutar con Autoconf para versiones < 0.28.

# PKG_CHECK_VAR(variable, modulo, variable-pkgconfig, [accion-si-halla], [accion-sino-halla])
m4_ifdef(
	[PKG_CHECK_VAR],
	[],
	[AC_DEFUN([PKG_CHECK_VAR],
		[AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
		AC_ARG_VAR([$1], [value of $3 for $2, overriding pkg-config])dnl
		_PKG_CONFIG([$1], [variable="][$3]["], [$2])
		AS_VAR_COPY([$1], [pkg_cv_][$1])
		AS_VAR_IF([$1], [""], [$5], [$4])dnl
	])# PKG_CHECK_VAR
])
