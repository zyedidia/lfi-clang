#!/bin/sh

# Usage: build-musl.sh CC PREFIX

set -e
set -x

PREFIX=$2
SYSROOT=$PREFIX/sysroot
COMPRT=$PREFIX/compiler-rt

CC=$1

export CC=$CC
export CFLAGS="--rtlib=compiler-rt -resource-dir $COMPRT"
cd musl
make clean
./configure --prefix=$SYSROOT --syslibdir=$SYSROOT/lib
make
make install
