#!/bin/bash


rm -rf frameworks/base/
rm -rf device/lge/
rm -rf hardware/lge
rm out/target/product/*/*.zip
rm -rf .repo/local_manifests
repo init -u https://github.com/crdroidandroid/android.git -b 13.0 --git-lfs
mkdir .repo/local_manifests
cp scripts/roomservice.xml .repo/local_manifests
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh

source scripts/fixes.sh
lunch lineage_h872-userdebug
#m -j$(nproc --all) bacon
#lunch lineage_us997-userdebug
#m -j$(nproc --all) bacon
#lunch lineage_h872-userdebug
#m -j$(nproc --all) bacon


