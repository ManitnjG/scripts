#!/bin/bash

# Cam fix for LG G6 and delete some line cause im stupid
cd frameworks/base/
git fetch https://github.com/xc112lg/android_frameworks_base-1.git cd10
git cherry-pick 5e769f677008161357a8855ed2d606f8a6198de7
cd ../../

# Mixer: adjust input volume levels
#cd device/lge/g6-common
#git fetch https://github.com/LG-G6/android_device_lge_g6-common.git dev/lineage-19.1
#git cherry-pick b3edeba5ac6500c145fec7222ffc696c9b819af0
#cd ../../../

 added crdroid setting
cd device/lge/msm8996-common
git fetch https://github.com/xc112lg/android_device_lge_msm8996-common.git patch-1
git cherry-pick 888db962607cf053f310ddf79ffa572485c01b68 ebc472d63b24a71af78b7ac3813a2d54b2f44efc
cd ../../../




