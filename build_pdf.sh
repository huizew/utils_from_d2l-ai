#!/bin/bash
set -ex

if [ $# -ne 1 ]; then
    echo "Usage: $0 LANG"
    echo "LANG can be en, zh, ..."
    exit -1
fi

D2L_LANG=$1

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64

conda activate d2l-${D2L_LANG}-build
make pdf
cp build/_build/latex/d2l-${D2L_LANG}.pdf build/_build/html/

[ -e build/_build/latex/d2l-${D2L_LANG}.aux ] && rm build/_build/latex/d2l-${D2L_LANG}.aux
[ -e build/_build/latex/d2l-${D2L_LANG}.idx ] && rm build/_build/latex/d2l-${D2L_LANG}.idx
