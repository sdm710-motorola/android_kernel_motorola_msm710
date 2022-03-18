#!/bin/bash

current_dir=$(pwd)
export ARCH=arm64 && export SUBARCH=arm64
export CROSS_COMPILE=$(pwd)/build/crosscompile/bin/aarch64-linux-android-
export OUT=$(pwd)/out

export DTC_EXT=/usr/bin/dtc

make O=$OUT -j5 astro_stock_defconfig
#make O=$OUT -j5 xconfig
make O=$OUT -j5

mkdir -p build/release/modules

rm build/anykernel/Image.gz build/anykernel/sdm710-astro-base.dtb build/anykernel/dtbo.img
cp ./out/arch/arm64/boot/Image.gz build/anykernel/Image.gz
cp ./out/arch/arm64/boot/dts/qcom/sdm710-astro-base.dtb build/anykernel/sdm710-astro-base.dtb

# Make and copy dtbo
#cd build/libufdt-master-utils/src
#python mkdtboimg.py create ../../anykernel/dtbo.img $OUT/arch/arm64/boot/dts/qcom/*.dtbo
#cd $current_dir

rm build/anykernel/anykernel.sh

cp build/anykernel.sh build/anykernel/anykernel.sh
#Copy modules
find ./out -iname "*.ko" -exec cp {} build/release/modules \;

cd build/anykernel
rm ../release/final.zip
zip -r ../release/final.zip ./* 
cd $current_dir