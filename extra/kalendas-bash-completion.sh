# -*- Shell-script -*-
#
# kalendas-bash-completion.sh - bash completion para kalendas
#
# Copyright (C) 2015-2018  Miguel Molina
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
# ::Using
# To use this bash-completion:
# 1) Copy this file in a adecaute place (e.g. ~/.kalendas-bash-completion.sh).
# 2) Add the line in your .bashrc (or run in the terminal)
#    source ~/.kalendas-bash-completion.sh
#
# ::Uso
# Para usar este bash-completion:
# 1) Copiar este archivo en un lugar apropiado (e.g. ~/.kalendas-bash-completion.sh).
# 2) Agregar la siguiente linea en su .bashrc (o correr en la terminal)
#    source ~/.kalendas-bash-completion.sh
#
# Info <https://www.debian-administration.org/article/316/An_introduction_to_bash_completion_part_1>.

_kalendas()
{
    local cur prev pts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    # Opciones de kalendas
    opts="-h -v \
         --calc2FJ --jul2FJ --greg2FJ --FJ2jul --FJ2greg \
         --calc2FJM --FJM2calc --convcal --mas --help --version"
    # Completar el argumento para opcion --mas
    case "${prev}" in
	--mas)
	    local funcion="calc2FJ jul2FJ greg2FJ FJ2jul FJ2greg \
                          calc2FJM FJM2calc convcal mas arg"
	    COMPREPLY=($(compgen -W "${funcion}" -- ${cur}))
	    return 0
	    ;;
	*)
	    ;;
    esac
    if [[ ${cur} == -* ]]
    then
        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
        return 0
    fi
}
complete -F _kalendas kalendas 
