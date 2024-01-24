#!/bin/bash

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh

source scripts/repopick.sh
source scripts/fixes.sh
source scripts/extras.sh
