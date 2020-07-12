#!/bin/bash

export NDK=/home/lx/Downloads/android-ndk-r21d

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64

export API=23

export PREFIX=out

#arm
export PLATFORM=$NDK/platforms/android-$API/arch-arm
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
export CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
export LD=$TOOLCHAIN/bin/arm-linux-androideabi-ld
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip


function build_x264 {
cd x264

./configure \
    --prefix=../$PREFIX/armeabi-v7a \
    --enable-shared \
    --enable-pic \
    --disable-cli \
    --sysroot=$TOOLCHAIN/sysroot \
    --host=arm-linux-androideabi

make clean

make

make install

cd ../
}

build_x264
