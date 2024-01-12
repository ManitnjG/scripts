#!/bin/bash

rm -rf build/make/
rm -rf frameworks/base/
rm -rf device/lge/
rm -rf hardware/lge
rm -rf kernel/lge/msm8996/
rm -rf vendor/lge/
rm -rf vendor/lineage/

rm out/target/product/*/*.zip
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh

source scripts/fixes.sh
source scripts/fixes1.sh
lunch lineage_h872-userdebug
m bacon

