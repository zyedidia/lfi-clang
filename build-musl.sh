#!/bin/sh

# Usage: build-musl.sh CC PREFIX

set -e
set -x

VERSION=$3
PREFIX=$2
SYSROOT=$PREFIX/sysroot
COMPRT=$PREFIX/compiler-rt

CC=$1

cp musl-custom/getopt.c musl-$VERSION/src/misc/getopt.c
cp musl-custom/aarch64/memset.S musl-$VERSION/src/string/aarch64/memset.S
cp musl-custom/aarch64/crti.s musl-$VERSION/crt/aarch64/crti.s
cp musl-custom/x86_64/crti.s musl-$VERSION/crt/x86_64/crti.s

export CC=$CC
export CFLAGS="--rtlib=compiler-rt -resource-dir $COMPRT"
cd musl-$VERSION
make clean
./configure --prefix=$SYSROOT --syslibdir=$SYSROOT/lib
make
make install
