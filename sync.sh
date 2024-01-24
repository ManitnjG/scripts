#!/bin/bash


rm -rf frameworks/base/
rm -rf device/lge/
rm -rf hardware/lge
rm out/target/product/*/*.zip
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh

source scripts/fixes.sh
lunch lineage_h872-userdebug
m -j$(nproc --all) bacon
#lunch lineage_us997-userdebug
#m bacon
#lunch lineage_h872-userdebug
#m bacon


