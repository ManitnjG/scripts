#!/bin/bash
# Set default values for device anfd command

echo $PWD
echo $PWD
mkdir -p cc
mkdir -p c
cp -f cc/ccache.conf c/ccache.conf 
time ls -1 cc | xargs -I {} -P 5 -n 1 rsync -au cc/{} c/
ccache -s
# Update and install ccache
sudo apt-get update -y
sudo apt-get install -y apt-utils
sudo apt-get install -y ccache
export USE_CCACHE=1
ccache -M 100G
export CCACHE_DIR=${PWD}/cc
ccache -s
ccache -o compression=false
ccache --show-config | grep compression
echo $CCACHE_DIR
echo $CCACHE_EXEC
time ls -1 c | xargs -I {} -P 5 -n 1 rsync -au c/{} cc/
cp -f c/ccache.conf cc/ccache.conf 
ccache -o compression=false
ccache --show-config | grep compression

ccache -s
## Remove existing build artifactsa

#git clean -fdX
#rm -rf frameworks/base/
rm -rf .repo/local_manifests hardware
rm -rf device/lge/
#rm -rf kernel/lge/msm8996
mkdir -p .repo/local_manifests

cp scripts/roomservice3.xml .repo/local_manifests/roomservice.xml
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh
lunch cipher_h872-userdebug
m installclean
m -j$(nproc --all)  bacon

