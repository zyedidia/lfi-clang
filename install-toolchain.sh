#!/bin/sh

set -e

PREFIX=$1
mkdir -p $PREFIX

export ARCH=$2 # (aarch64 or x86_64)

LLVM_VERSION=16.0.6

mkdir -p $PWD/wrappers

lfi-wrap -compiler=clang -toolchain=nolib-clang > $PWD/wrappers/lfi-nolib-clang
lfi-wrap -compiler=clang++ -toolchain=nolib-clang > $PWD/wrappers/lfi-nolib-clang++
chmod +x wrappers/lfi-nolib-clang
chmod +x wrappers/lfi-nolib-clang++

lfi-wrap -compiler=clang -toolchain=clang > $PWD/wrappers/lfi-clang
lfi-wrap -compiler=clang++ -toolchain=clang > $PWD/wrappers/lfi-clang++
chmod +x wrappers/lfi-clang
chmod +x wrappers/lfi-clang++

CC=$PWD/wrappers/lfi-nolib-clang
CXX=$PWD/wrappers/lfi-nolib-clang++

if [ ! -d llvm-project-$LLVM_VERSION.src ]; then
    ./download-llvm.sh $LLVM_VERSION
fi
if [ ! -d musl ]; then
    ./download-musl.sh
fi

./build-compiler-rt.sh $CC $CXX $PREFIX $LLVM_VERSION
./build-musl.sh $CC $PREFIX
./build-llvm-runtimes.sh $CC $CXX $PREFIX $LLVM_VERSION

cp -r wrappers $PREFIX/bin
