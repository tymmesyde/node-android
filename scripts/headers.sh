#!/bin/sh

OUT="out"
mkdir -p $OUT

cd node
./configure
HEADERS_ONLY=1 python tools/install.py install ./ "../$OUT"
cd ..