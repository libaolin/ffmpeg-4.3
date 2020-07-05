#!/bin/bash

./configure \
	--prefix=/usr/local \
	--disable-x86asm \
	--disable-static \
    --enable-shared \
    --disable-doc \

make clean
make -j8
sudo make install
