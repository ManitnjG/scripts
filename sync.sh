#!/bin/bash

rm -rf build/make/
rm -rf frameworks/base/
rm -rf device/lge/
rm -rf hardware/lge
rm -rf kernel/lge/msm8996/
rm -rf vendor/lge/
rm -rf vendor/support/
rm -rf developers/*
rm -rf external/*
rm out/target/product/*/*.zip
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
source build/envsetup.sh

source scripts/fixes.sh
lunch derp_h870-userdebug
mka derp
lunch derp_us997-userdebug
mka derp
lunch derp_h872-userdebug
mka derp


