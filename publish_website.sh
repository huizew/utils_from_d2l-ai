#!/bin/bash
set -ex

if [ $# -ne 1 ]; then
    echo "Usage: $0 LANG"
    echo "LANG can be en, zh, ..."
    exit -1
fi

D2L_LANG=$1

conda activate d2l-${D2L_LANG}-build

build/utils/upload_doc_s3.sh build/_build/html s3://${D2L_LANG}.d2l.ai
