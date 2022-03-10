#!/bin/bash

current_dir=$(pwd)
export ARCH=arm64 && export SUBARCH=arm64
export CROSS_COMPILE=$(pwd)/build/crosscompile/bin/aarch64-linux-android-

export DTC_EXT=/usr/bin/dtc

make O=./out -j5 astro_stock_defconfig
#make O=./out -j5 xconfig
make O=./out -j5

mkdir -p build/release/modules

rm build/anykernel/Image.gz
cp ./out/arch/arm64/boot/Image.gz build/anykernel/Image.gz

rm build/anykernel/anykernel.sh

cp build/anykernel.sh build/anykernel/anykernel.sh
#Copy modules
find ./out -iname "*.ko" -exec cp {} build/release/modules \;

cd build/anykernel
rm ../release/final.zip
zip -r ../release/final.zip ./* 
cd $current_dir