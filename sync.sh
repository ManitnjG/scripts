#!/bin/bash
# Set default values for device and command
DEVICE="${1:-all}"  # If no value is provided, default to "all"
COMMAND="${2:-build}"  # If no value is provided, default to "build"
DELZIP="${3}"
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
if [ "$DELZIP" == "delzip" ]; then
    rm -rf out/target/product/*/*.zip
fi

#git clean -fdX
#rm -rf frameworks/base/
rm -rf .repo/local_manifests
#rm -rf device/lge/
#rm -rf kernel/lge/msm8996
mkdir -p .repo/local_manifests
cp scripts/roomservice.xml .repo/local_manifests
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

#wget -O a.py https://raw.githubusercontent.com/xc112lg/crdroid10.1/main/a.py
#chmod +x a.py
chmod +x scripts/export.sh
#python3 a.py
#source scripts/fixes.sh
source build/envsetup.sh



# Check if command is "clean"
if [ "$COMMAND" == "clean" ]; then
    echo "Cleaning..."
    m clean
fi

# Check if device is set to "all"
if [ "$DEVICE" == "all" ]; then
    echo "Building for all devices..."
 rm -rf out/target/product/*/*.zip
lunch evolution_X01BD-userdebug

ccache m -j$(nproc --all) evolution
 
elif [ "$DEVICE" == "X01BD" ]; then
    echo "Building for X01BD..."
export BUILD_DEVICE="X01BD"
    lunch lineage_X01BD-userdebug
    m installclean
    m -j$(nproc --all) bacon
else
    echo "Building for the specified device: $DEVICE..."
    # Build for the specified device
    lunch "$DEVICE"
    m -j16 bacon
fi
