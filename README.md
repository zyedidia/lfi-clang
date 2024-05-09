# LFI Clang toolchain

This repository contains scripts for building a Clang toolchain that can target
LFI. The build process here does not build or include Clang, and expects you to
already have a version of Clang installed on your system. These scripts use
your version of Clang to build the following runtime libraries for use with
LFI: `compiler-rt`, `musl-libc`, `libc++` (and dependencies). This means that
the resulting toolchain can compile C and C++ programs.

The runtime libraries are currently built from LLVM 16.0.6, so your local Clang
should match this version (ideally), but you can change this version number in
`install-toolchain.sh`.

# Usage

First, you must install `lfi-compile` and `lfi-leg-arm64` from the LFI project.

Next, run the scripts:

```
$ ./install-toolchain.sh $PWD/lfi-clang
```

Once the build is complete, you can use your new toolchain to build programs
for LFI.

```
$ ./lfi-clang/bin/lfi-clang -O2 test.c
$ lfi-run ./a.out
Hello world: 0x1e00050000
$ ./lfi-clang/bin/lfi-clang++ -O2 test.cc
$ lfi-run ./a.out
done!
```
