#!/bin/bash
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


ccache -o compression=false
ccache --show-config | grep compression

ccache -s





rm -rf .repo/local_manifests hardware/lge hardware/qcom
mkdir .repo/local_manifests
cp scripts/roomservice.xml .repo/local_manifests
mv scripts/statix.xml .repo/manifests/snippets
repo sync -c -j32 --force-sync --no-clone-bundle --no-tags
rm -rf hardware/qcom
source build/envsetup.sh
#m cleanfdsfdsf
#make clean

 rm out/target/product/*/*.zip
# source scripts/fixes.sh
#source build/envsetup.sh && lunch evolution_h872-eng && (while true; do clear; ccache -s; sleep 60; done) & m -j$(nproc --all) evolution

source build/envsetup.sh
lunch cipher_h872-eng

m -j$(nproc --all) bacon
