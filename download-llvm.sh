#!/bin/sh

# usage ./download-llvm.sh VERSION

VERSION=$1
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$VERSION/llvm-project-$VERSION.src.tar.xz
tar -xf llvm-project-$VERSION.src.tar.xz

cd llvm-project-$VERSION.src
patch -p0 < ../llvm-custom/DwarfInstructions.hpp.patch
