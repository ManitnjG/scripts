#!/bin/bash
# Set default values for device anfd command



#git clean -fdX
#rm -rf frameworks/base/
rm -rf .repo/local_manifests
rm -rf device/lge/
#rm -rf kernel/lge/msm8996
mkdir -p .repo/local_manifests
mv scripts/statix .repo/manifests/snippets
cp scripts/roomservice3.xml .repo/local_manifests/roomservice.xml
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh
lunch cipher_h872-userdebug
m installclean
m -j$(nproc --all)  bacon

